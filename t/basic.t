use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('PerlTent');
$t->get_ok('/')->status_is(200)->content_like(qr/Perl Tent/i);

done_testing();
