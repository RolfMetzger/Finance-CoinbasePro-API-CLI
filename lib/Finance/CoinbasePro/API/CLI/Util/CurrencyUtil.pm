package Finance::CoinbasePro::API::CLI::Util::CurrencyUtil;

use base qw(Exporter);
our @EXPORT_OK = qw( get_product_currencies 
        format_crypto format_crypto_exact 
        format_crypto_with_usd  format_usd format_currency );

# our global number formatter.
use Number::Format;
my $formatter = Number::Format->new( -neg_format=>'-x' );

sub get_product_currencies {
    my $product = shift;
    my ($from_currency, $to_currency) = split(/-/, $product);
    return ($from_currency, $to_currency);
}

sub format_currency {
    my ($val, $currency, $prec) = @_;
    $currency ||= "USD";
    if ($currency eq "USD" or $currency eq "EUR" or $currency eq "GBP" or $currency eq "JPY") {
        return format_fiat_currency($val, $currency, $prec);
    }
    return format_crypto( $val, $currency );
}
sub format_currency {
    my ($val, $currency, $prec) = @_;
    $currency ||= "USD";
    if ($currency eq "USD" or $currency eq "EUR" or $currency eq "GBP" or $currency eq "JPY") {
        return format_fiat_currency($val, $currency, $prec);
    }
    return format_crypto( $val, $currency );
}
sub format_crypto {
    my ($val, $currency) = @_;
    sprintf("%0.4f%s", $val, $currency );   # like 0.234BTC
}
sub format_crypto_exact {
    my ($val, $currency) = @_;
    sprintf("%0.10f%s", $val, $currency );  # like 0.0123456789BTC
}
sub format_crypto_with_usd {
    my ($val, $currency, $per_usd) = @_;
    sprintf( "%s (%s)", format_crypto( $val, $currency), format_usd( $val * $per_usd ) );
}

sub format_usd {
    my ($val, $prec) = @_;
    return format_fiat_currency( $val, "USD", $prec );
}

sub format_fiat_currency {
    my ($val, $currency, $prec) = @_;
    my $indicator = $currency eq "USD" ? '$' :
                    $currency eq "EUR" ? '&euro;' :
                    $currency eq "GBP" ? '&pound;' :
                    $currency eq "JPY" ? '&yen;' :
                    $currency;

    $val ||= 0;

    if (0) {
        unless(defined($prec)) {
            if (abs($val) > 1.0) {
                $prec = 2;
            } else {
                my $v2 = sprintf("%0.2f", $val);
                if ($val eq $v2) {  # if normal rep isn't same as 2-digit representation
                    $prec = 2;
                } else {
                    my $diff = abs($v2 - $val);
                    my $log10 =  floor(_log10(abs $diff));
                    $prec = List::Util::min(6, List::Util::max(2, -$log10 + 1));
                    #print "val: $val, v2: $v2, log10: $log10, prec: $prec\n";
                }
            }
        }

        my $str =  $formatter->format_price( $val || 0, $prec, $indicator );   # returns negatives as '-$100' (what?)
        $str =~ s/ //g;
        if ($prec > 2) {
            #print "before: $str\n";
            $str =~ s{(\.\d{2,}[1-9])0+$}{$1};
            #print "after $str\n";
        }
        return $str;
    } else {
        $val ||= 0;

        unless(defined($prec)) {
            if (abs($val) > 1000) {
                $prec = 0;
            } elsif (abs($val) >    1) {
                $prec = 2;
            } else {
                my $v2 = sprintf("%0.2f", $val);
                if ($val eq $v2) {  # if normal rep isn't same as 2-digit representation
                    $prec = 2;
                } else {
                    my $diff = abs($v2 - $val);
                    my $log10 =  floor(_log10(abs $diff));
                    $prec = List::Util::min(6, List::Util::max(2, -$log10 + 1));
                    #print "val: $val, v2: $v2, log10: $log10, prec: $prec\n";
                }
            }
        }

        my $str =  $formatter->format_price( $val || 0, $prec, $indicator );
        $str =~ s/ //g;
        if ($prec > 2) {
            #print "before: $str\n";
            $str =~ s{(\.\d{2,}[1-9])0+$}{$1};
            #print "after $str\n";
        }
        return $str;
    }
}



1;
