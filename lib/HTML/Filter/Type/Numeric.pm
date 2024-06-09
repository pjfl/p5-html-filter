package HTML::Filter::Type::Numeric;

use HTML::Filter::Constants qw( FALSE TRUE );
use HTML::Filter::Types     qw( Str );
use Moo;

extends 'HTML::Filter::Node';

has 'string' => is => 'ro', isa => Str, required => TRUE;

sub value {
   return shift->string;
}

use namespace::autoclean;

1;
