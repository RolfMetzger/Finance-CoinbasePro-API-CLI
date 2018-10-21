package Finance::CoinbasePro::API::CLI::Value;   # stores a value and a currency

use strict;
use warnings;
our $VERSION = '0.019';

use Mouse;

use Finance::CoinbasePro::API::CLI::Util::CurrencyUtil
  qw( format_currency format_crypto_with_usd );

has 'num'      => ( is => 'rw', isa => "Num", required => 1 );
has 'currency' => ( is => 'ro', isa => "Str", required => 1 );

sub to_str {
    my $self = shift;
    return format_currency( $self->{num}, $self->{currency} );
}

sub to_str_with_usd {
    my ( $self, $per_usd ) = @_;    # $value, $per_usd_float
    return format_crypto_with_usd( $self->{num}, $self->{currency}, $per_usd );
}

sub add {
    my ( $self, $v ) = @_;
    die(    "$0: can't add $self->{currency} ("
          . $self->to_str()
          . ") and $v->{currency}( "
          . $v->to_str()
          . "\n" )
      unless ( $self->currency eq $v->currency );
    return $self->num( $self->num + $v->num );
}

=for comment
sub subtract {
    my ($self, $v) = @_;
    die "$0: can't subtract $self->{currency} and $v->{currency}\n" unless ($self->currency eq $v->currency);
    $self->num( $self->num - $v->num );
}
=cut

1;




#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Finance::CoinbasePro::API::CLI::Value - stores a value and a currency


=head1 DESCRIPTION

pod generated by Pod::Autopod - keep this line to make pod updates possible ####################


=head1 REQUIRES

L<Mouse> 


=head1 METHODS

=head2 add

 add();

=head2 subtract

 subtract();

=head2 to_str

 to_str();

=head2 to_str_with_usd

 to_str_with_usd();


=cut

