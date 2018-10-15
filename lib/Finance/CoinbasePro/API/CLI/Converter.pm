package Finance::CoinbasePro::API::CLI::Converter;
use Mouse;
use Finance::CoinbasePro::API::CLI::Value;
use Finance::CoinbasePro::API::CLI::ConversionFactor;

has 'conversions'  => ( is=>'rw', isa=>"ArrayRef[Finance::CoinbasePro::API::CLI::ConversionFactor]", required=>1 );

#   my $converter = Finance::CoinbasePro::API::CLI::Converter->new( conversions=>[{from=>"BTC", to=>"USD", factor=>7884}] );
#   my $converted = $converter->convert( Finance::CoinbasePro::API::CLI:Value->new( num=>10, currency=>"BTC" ), "USD" ); 
sub convert {
    my ($self, $from_value, $to_currency) = @_;
    if ($from_value->currency eq $to_currency) {
        return $from_value;
    }
    for my $conversion (@{$self->conversions}) {
        if ($from_value->currency eq $conversion->from_currency &&
            $to_currency eq $conversion->to_currency) {
            return $self->_convert_value_with_factor( $conversion, $from_value, $to_currency );
        }
        if ($from_value->currency eq $conversion->to_currency &&
            $to_currency eq $conversion->from_currency) {
            return $self->_convert_value_with_factor( $conversion, $from_value, $to_currency );
        }
        #if ($from_value->currency eq $conversion->from_currency ) {
        #    return $from_value; # special case, no conversion needed
        #}
    }
    die "$0: Couldn't find conversion for " . $from_value->to_str() . " to $to_currency\n";
}


sub _convert_value_with_factor {
    my ($self, $conversion, $from_value, $to_currency) = @_;
    
    if ($from_value->currency eq $conversion->from_currency &&
        $to_currency eq $conversion->to_currency) {
        my $new_num = $from_value->num * $conversion->factor;
        return Finance::CoinbasePro::API::CLI::Value->new( num=>$new_num, currency=>$to_currency );
    }
    if ($from_value->currency eq $conversion->to_currency &&
        $to_currency eq $conversion->from_currency) {
        my $new_num = $from_value->num / $conversion->factor;
        return Finance::CoinbasePro::API::CLI::Value->new( num=>$new_num, currency=>$to_currency );
    }
    if ($from_value->currency ne $conversion->from_currency ) {
        return $from_value; # special case, no conversion needed
        die "$0: can't use converter for " . $conversion->from . " for value in " . $from_value->{currency};
    }
}

1;