package HTML::Filter::Node::Rule::Date::After;

use Moo;

extends 'HTML::Filter::Node::Rule::Date';

has '+_operator' => default => '>';

use namespace::autoclean;

1;
