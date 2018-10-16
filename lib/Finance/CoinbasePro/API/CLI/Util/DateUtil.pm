package Finance::CoinbasePro::API::CLI::Util::DateUtil;

use base qw(Exporter);
our @EXPORT_OK = qw( getdatetime convert_seconds_to_human_time );

# returns 19 character string like "2004-04-04 12:30:59"
sub getdatetime {
    my $t = shift || time();
    return POSIX::strftime( "%Y-%m-%d %H:%M:%S", localtime( $t ) );
}

# converts seconds to human-readable.
sub convert_seconds_to_human_time {
    my $t = shift;
    my $precision = shift // 2;

    my @table = (
        [86400*365.25, " years"],
        [86400,    " days"],
        [3600,     " hrs"],
        [60,       " mins"],
        [1,        " secs"],
        [0.001,    " ms"],
        [0.000001, " us"],
    );
    return _convert_units_to_human_size( $t, \@table, $precision );
}

sub _convert_units_to_human_size {
    my ($units, $tableref, $precision) = @_;
    $precision = 2 unless defined($precision);
    #print "---$bytes---";
    for my $row (@$tableref) {
        if (abs($units) >= $row->[0]) {
            if (0) { # one way
                my $value = int($units / $row->[0]);
                $value = sprintf( "%.${precision}f", $units / $row->[0]) if (length($value) < 3);
                return $value . $row->[1];
            } else {    # another way
                my $value =  $units / $row->[0];
                if ($value =~ /^\d+(\.0*)?$/) {
                    $value = int( $value );
                } else {
                    $value = sprintf( "%.${precision}f", $value);
                }
                if (length($value) > 6 && $value =~ /\d\.\d\d$/) {
                    chop $value;    # remove last of the digits
                }

                return $value . $row->[1];
            }
        }
    }
    return int($units);
}



1;

#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Finance::CoinbasePro::API::CLI::Util::DateUtil


=head1 DESCRIPTION

returns 19 character string like "2004-04-04 12:30:59"


=head1 REQUIRES


=head1 IMPLEMENTS

L<Exporter> 


=head1 METHODS

=head2 convert_seconds_to_human_time

 $self->convert_seconds_to_human_time();

converts seconds to human-readable.


=head2 getdatetime

 $self->getdatetime();

returns 19 character string like "2004-04-04 12:30:59"



=cut

