package PerlTent::Profile;
use Mojo::Base 'Mojolicious::Controller';

sub profile	 {
  my $self = shift;
  $self->render( json => $self->db->get_profiles);
}

1;
