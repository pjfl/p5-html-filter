package HTML::Filter::Type::Negate;

use Moo;

extends 'HTML::Filter::Node';

has 'negate' => is => 'ro';

sub value {
   return shift->negate;
}

1;
