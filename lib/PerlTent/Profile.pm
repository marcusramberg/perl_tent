package PerlTent::Profile;
use Mojo::Base 'Mojolicious::Controller';

sub profile	 {
  my $self = shift;
  $self->render( json => $self->db->get_profiles->all);
}

sub update_profile {
	my $self = shift;
	my $id=$self->db->update_profile($self->stash('type'),$self->req->json);
	$self->render( json => $id);
}

1;
