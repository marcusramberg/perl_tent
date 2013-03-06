use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('PerlTent');
$t->get_ok('/profile')->status_is(200);

done_testing();
