package HTML::Filter::Node::Rule::String::Equals;

use Moo;

extends 'HTML::Filter::Node::Rule::String';

has '+_operator' => default => '=';

use namespace::autoclean;

1;
