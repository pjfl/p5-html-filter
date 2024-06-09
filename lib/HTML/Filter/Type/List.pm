package HTML::Filter::Type::List;

use HTML::Filter::Constants qw( FALSE TRUE );
use HTML::Filter::Types     qw( Int );
use Moo;

has 'list_id' => is => 'ro', isa => Int, required => TRUE;

sub value {
   my ($self, $args) = @_;

   return $self->list_id;
}

use namespace::autoclean;

1;
