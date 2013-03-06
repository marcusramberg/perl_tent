use Mojo::Base -strict;

BEGIN { $ENV{MOJO_MODE}='testing'; }

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('PerlTent');
my $db=$t->app->db;
$db->mango->db->collection('profile')->remove;

isa_ok($db,'PerlTent::Model');
my $profile_data={ 
	  "name"=> "The Tentity",
	  "avatar_url"=> "http://example.org/avatar.jpg",
	  "birthdate"=> "2012-08-23",
	  "location"=> "The Internet",
	  "gender"=> "Unknown",
	  "bio"=> "Dolorem ut ut at ipsum esse."
	};
my $profile=$db->update_profile("https://tent.io/types/info/core/v0.1.0" => $profile_data);
isa_ok($profile,'Mango::BSON::ObjectID');

my $roundtrip_profile=$db->get_profile($profile);
is(delete $roundtrip_profile->{_id},$profile,'There was an id to delete');
is_deeply($roundtrip_profile,$profile_data,'Got back the same result');

my $profiles=$db->get_profiles;
isa_ok($profiles,'Mango::Cursor');
is($profiles->count,1);

done_testing();
