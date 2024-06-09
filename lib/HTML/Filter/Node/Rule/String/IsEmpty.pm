package HTML::Filter::Node::Rule::String::IsEmpty;

use HTML::Filter::Constants qw( FALSE NUL );
use Moo;

extends 'HTML::Filter::Node::Rule::String';

has '+_operator' => default => '=';

has '+string' => required => FALSE;

sub _value {
   return NUL;
}

use namespace::autoclean;

1;
