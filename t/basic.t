use Test::More tests => 2;

# All LIR Portal connections are HTTPS
use Crypt::SSLeay;

use WWW::RIPE::LIRPortal;

ok 1;

my $w = WWW::RIPE::LIRPortal->new;

ok $w;

