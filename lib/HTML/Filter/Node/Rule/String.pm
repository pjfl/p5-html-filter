package HTML::Filter::Node::Rule::String;

use HTML::Filter::Constants qw( FALSE TRUE );
use HTML::Filter::Types     qw( FilterField FilterString Str );
use Moo;

extends 'HTML::Filter::Node::Rule';

has 'field' => is => 'ro', isa => FilterField, coerce => TRUE, required => TRUE;

has 'string' =>
   is       => 'ro',
   isa      => FilterString,
   coerce   => TRUE,
   required => TRUE;

has '_operator' => is => 'ro', isa => Str, required => TRUE;

has '_template' =>
   is      => 'ro',
   isa     => Str,
   default => '\coalesce(lower(%s), "")';

sub _to_abstract {
   my ($self, $args) = @_;

   my ($lhs, $value);

   if ($args->{insensitive}) {
      $lhs = sprintf $self->_template, $self->field->value($args);
      $value = lc $self->_value;
   }
   else {
      $lhs = $self->field->value($args);
      $value = $self->_value;
   }

   return $lhs => { $self->_operator => $value };
}

sub _value {
   return shift->string->value;
}

use namespace::autoclean;

1;
