package HTML::Filter::Node::Logic::And;

use Moo;

extends 'HTML::Filter::Node::Logic';

sub to_abstract {
   my ($self, $args) = @_;

   # Nodes are arrays for ors and hashes for ands. Each sets join type
   return '-and' => [ map { $_->to_abstract($args) } @{$self->nodes} ];
}

use namespace::autoclean;

1;
