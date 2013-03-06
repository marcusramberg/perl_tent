package PerlTent::Profile;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub profile	 {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(
    json => $self->db->);
}

1;
