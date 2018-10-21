package Finance::CoinbasePro::API::CLI
  ;    # Command-line interface to GDAX / Coinbase Pro

use 5.006;
use strict;
use warnings;

=head1 NAME

Finance::CoinbasePro::API::CLI - Command-line interface to GDAX / Coinbase Pro

=cut

our $VERSION = '0.024';

=head1 SYNOPSIS

Provides a command-line interface to Coinbase Pro (no longer GDAX).

    % script/coinbasepro.pl
    coinbasepro.pl: first param is action to perform (top|buy|sell|products|accounts|orders|quotes|trades|fills|cancel|cancelall)
    coinbasepro.pl (top|buy|sell|products|accounts|orders|quotes|trades|fills|cancel|cancelall)
       [--verbose] [--dryrun] [--product=BTC-USD] [--price=N] [--size=N] [--cancel]:
       shows data from GDAX/Coinbase Pro
        for example: coinbasepro.pl quotes --product=BTC-USD  or  coinbasepro.pl products


=head1 AUTHOR

joshr, C<< <joshr at joshr.com> >>


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Finance::CoinbasePro::API::CLI

=over 4

=item * Search CPAN

L<https://metacpan.org/release/Finance-CoinbasePro-API-CLI>

=back

=head1 ACKNOWLEDGEMENTS

=head1 LICENSE AND COPYRIGHT

Copyright 2018 Josh Rabinowitz

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

=cut

1;    # End of Finance::CoinbasePro::API::CLI



#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Finance::CoinbasePro::API::CLI


=head1 DESCRIPTION

pod generated by Pod::Autopod - keep this line to make pod updates possible ####################


=head1 REQUIRES

L<5.006> 


=head1 METHODS

=head2 function1

 function1();

=head2 function2

 function2();


=cut

