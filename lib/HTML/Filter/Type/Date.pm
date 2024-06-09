package HTML::Filter::Type::Date;

use HTML::Filter::Constants qw( FALSE TRUE );
use HTML::Filter::Types     qw( Str );
use Moo;

extends 'HTML::Filter::Node';

has 'time_zone' => is => 'ro', predicate => 'has_time_zone';

sub value { ... }

use namespace::autoclean;

1;
