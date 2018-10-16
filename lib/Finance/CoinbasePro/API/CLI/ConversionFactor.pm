package Finance::CoinbasePro::API::CLI::ConversionFactor;
use Mouse;

has 'from_currency'  => ( is=>'rw', isa=>"Str", required=>1 );
has 'to_currency'    => ( is=>'rw', isa=>"Str", required=>1 );
has 'factor'         => ( is=>'rw', isa=>"Num", required=>1 );

1;

#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Finance::CoinbasePro::API::CLI::ConversionFactor


=head1 REQUIRES

L<Mouse> 


=head1 METHODS


=cut

