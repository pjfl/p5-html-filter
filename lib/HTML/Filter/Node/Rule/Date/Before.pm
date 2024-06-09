package HTML::Filter::Node::Rule::Date::Before;

use Moo;

extends 'HTML::Filter::Node::Rule::Date';

has '+_operator' => default => '<';

use namespace::autoclean;

1;
