package WWW::RIPE::LIRPortal;

use 5.008;
use base 'WWW::Mechanize';

our $VERSION = '0.01';

our $URL = "https://lirportal.ripe.net/lirportal";
our $LOGIN_URL = "$URL/nossl/login.html";
our $XML_URL = "$URL/registry-data-%s.xml";


=head1 NAME

WWW::RIPE::LIRPortal - Automated access to the RIPE NCC LIRPortal

=head1 SYNOPSIS

  use WWW::RIPE::LIRPortal;

  my $w = WWW::RIPE::LIRPortal->new;

  $w->login( regid    => 'xx.joes',
             username => 'joe',
             password => 'secret' );

  print $w->regxml(version => '0.1');

=head1 DESCRIPTION

WWW::RIPE::LIRPortal provides a simple OO interface to logging in and retrieving registry information from the RIPE NCC LIRPortal.

=head1 METHODS

=over 4

=item new()

Creates a new WWW::RIPE::LIRPortal object

=item login()

Logs into the LIR Portal.

Arguments:
regid => $regid, username => $username, password => $password

=cut

sub login {
  my $self = shift;
  my %args = @_;

  $self->get($LOGIN_URL);
  $self->submit_form
    ( form_name => 'login',
      fields => \%args );
}

=item regxml(version => $version)

Returns registry data as XML.

=cut

sub regxml {
  my $self = shift;
  my %args = @_;

  $self->get(sprintf $XML_URL, $args{version});

  $self->content;
}

=back

=head1 BUGS

Please report bugs, patches or feature requests to
E<lt>swbugs@ripe.netE<gt>

=head1 AUTHOR

Ziya Suzen E<lt>ziya@ripe.netE<gt>

=head1 SEE ALSO

perl(1).

=head1 COPYRIGHT

Copyright (c) 2004 RIPE NCC

All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the name of the author not be used
in advertising or publicity pertaining to distribution of the software
without specific, written prior permission.

THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS; IN NO
EVENT SHALL AUTHOR BE LIABLE FOR ANY SPECIAL, INDIRECT OR
CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.

=cut


1;
