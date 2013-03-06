use Mojo::Base -strict;

BEGIN { $ENV{MOJO_MODE}='testing'; }

use Test::More;
use Test::Mojo;
use Mojo::Util qw/url_escape/;

my $t = Test::Mojo->new('PerlTent');
$t->app->db->mango->db->collection('profile')->remove;

$t->post_ok('/profile/'.url_escape("https://tent.io/types/info/core/v0.1.0"), json => {
	  "name"=> "The Tentity",
	  "avatar_url"=> "http://example.org/avatar.jpg",
	  "birthdate"=> "2012-08-23",
	  "location"=> "The Internet",
	  "gender"=> "Unknown",
	  "bio"=> "Dolorem ut ut at ipsum esse."
	})->status_is(200);

$t->get_ok('/profile')->status_is(200)->json_has('/0/avatar_url');

done_testing();
