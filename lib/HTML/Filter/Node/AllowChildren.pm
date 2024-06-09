package HTML::Filter::Node::AllowChildren;

use HTML::Filter::Constants qw( EXCEPTION_CLASS FALSE TRUE );
use HTML::Filter::Types     qw( ArrayRef );
use Unexpected::Functions   qw( throw Unspecified );
use Moo;

extends 'HTML::Filter::Node';

has 'nodes' => is => 'ro', isa => ArrayRef, default => sub { [] };

sub add_node {
   my ($self, $node) = @_;

   throw Unspecified, ['node'] unless $node;

   throw 'Node wrong class' unless $node->isa('HTML::Filter::Node');

   push @{$self->nodes}, $node;
   return $node;
}

sub contains_empty_nodes {
   return shift->_contains_node('HTML::Filter::Node::Rule::Empty');
}

sub to_abstract {
   my ($self, $args) = @_;

   return map { $_->to_abstract($args) } @{$self->nodes};
}

# Private methods
sub _contains_node {
   my ($self, $node_class) = @_;

   return $self->_process_nodes($node_class => sub { TRUE });
}

sub _process_nodes {
   my ($self, %dispatch) = @_;

   for my $node (@{$self->nodes}) {
      if ($node->isa('HTML::Filter::Node::AllowChildren')) {
         return TRUE if $node->_process_nodes(%dispatch);
      }

      for my $node_class (keys %dispatch) {
         next unless $node->isa($node_class);
         return TRUE if $dispatch{$node_class}->($node);
         last;
      }
   }

   return FALSE;
}

use namespace::autoclean;

1;
