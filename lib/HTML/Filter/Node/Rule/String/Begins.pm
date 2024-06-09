package HTML::Filter::Node::Rule::String::Begins;

use Moo;

extends 'HTML::Filter::Node::Rule::String';

has '+_operator' => default => 'LIKE';

sub _value {
   return shift->string->value . '%';
}

use namespace::autoclean;

1;
