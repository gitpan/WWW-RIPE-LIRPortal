
use WWW::RIPE::LIRPortal;

my $w = WWW::RIPE::LIRPortal->new;

chomp(my $regid    = shift);
chomp(my $username = shift);
chomp(my $password = shift);

$w->login( regid    => $regid,
           username => $username,
           password => $password );

print $w->regxml(version => '0.1');
