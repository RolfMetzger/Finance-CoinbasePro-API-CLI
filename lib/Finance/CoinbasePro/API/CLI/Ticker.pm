package Finance::CoinbasePro::API::CLI::Ticker
  ;    # knows about Finance::GDAX::Ticker objects and can display them

use strict;
use warnings;
our $VERSION = '0.017';

use Mouse;
#use Finance::CoinbasePro::API::CLI::Util::DateUtil qw(my_str2time);
#use Data::Dump;

#use Finance::CoinbasePro::API::CLI::Value;
#use Finance::CoinbasePro::API::CLI::Util::DateUtil
#  qw(convert_seconds_to_human_time);

# doesn't know what product or currencies it's in

has 'ask' => ( is => 'rw', isa => 'Num', required => 1 );
has 'bid' => ( is => 'rw', isa => 'Num', required => 1 );
has 'price' => ( is => 'rw', isa => 'Num', required => 1 );
has 'size' => ( is => 'rw', isa => 'Num', required => 1 );
has 'time' => ( is => 'rw', isa => 'Str', required => 1 );
has 'trade_id' => ( is => 'rw', isa => 'Num', required => 1 );
has 'volume' => ( is => 'rw', isa => 'Num', required => 1 );
 # { ask      => 6405.01, bid      => 6405, price    => "6405.00000000", size     => "0.00356760",
 # time     => "2018-10-20T14:10:30.004000Z", trade_id => 52712830, volume   => 4324.30439898, }

# returns a string
sub to_str {
    my $self = shift;

    #return Data::Dump::dump($self);
    return
"price: " . sprintf( "%f", $self->{price} ) . " (bid: $self->{bid}, ask $self->{ask}), volume " . sprintf( "%0.2f", $self->{volume}) . " (trade_id $self->{trade_id}) $self->{time}" 
}

1;


#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

lib::::Finance::CoinbasePro::API::CLI::Ticker - lib::::Finance::CoinbasePro::API::CLI::Ticker


=head1 DESCRIPTION

use Finance::CoinbasePro::API::CLI::Util::DateUtil qw(my_str2time);
use Data::Dump;


=head1 REQUIRES

L<Data::Dump> 

L<Finance::CoinbasePro::API::CLI::Util::DateUtil> 

L<Mouse> 


=head1 METHODS

=head2 to_str

 to_str();

returns a string



=cut
