package PerlTent::Model;

use Mango;

use Mojo::Base -base;

has 'config';
has 'mango' => sub { Mango->new(shift->config); };


sub update_profile {
  my ($self, $type, $data) = @_;
  $data->{type} = $type;
  if ($self->get_profile_by_type($type)) {
    $self->mango->db->collection('profile')
      ->find_and_modify(
      {query => {type => $type}, update => {'$set' => $data}});
  }
  else {
    $self->mango->db->collection('profile')->insert({%$data});
  }
}

sub get_profile {
  my ($self, $id) = @_;
  $self->mango->db->collection('profile')->find_one($id);
}

sub get_profile_by_type {
  my ($self, $type) = @_;
  $self->mango->db->collection('profile')->find_one({type => $type});
}

sub get_profiles {
  my $self = shift;
  $self->mango->db->collection('profile')->find();
}


1;
