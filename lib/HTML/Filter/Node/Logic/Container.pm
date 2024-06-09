package HTML::Filter::Node::Logic::Container;

use Moo;

extends 'HTML::Filter::Node::Logic';

sub to_abstract {
   my ($self, $args) = @_;

   return map { $_->to_abstract($args) } @{$self->nodes};
}

use namespace::autoclean;

1;
