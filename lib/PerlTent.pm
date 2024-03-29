package PerlTent;
use Mojo::Base 'Mojolicious';
use PerlTent::Model;

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  my $config=$self->plugin('Config');
  $self->attr(model => sub { PerlTent::Model->new(config=>$config->{db}) });
  $self->helper(db => sub { $self->model });

  # Router
  my $r = $self->routes;

  # Normal route to controller
	$r->get('/')->to(cb=> sub { shift->render(text=>'This is my Perl Tent'); });
	$r->get('/profile')->to('profile#profile');
	$r->post('/profile/*update')->to('profile#update_profile');
}

1;
