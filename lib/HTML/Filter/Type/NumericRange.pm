package HTML::Filter::Type::NumericRange;

use HTML::Filter::Constants qw( FALSE TRUE );
use HTML::Filter::Types     qw( Maybe Num );
use Moo;

extends 'HTML::Filter::Node';

has 'max_value' => is => 'ro', isa => Maybe[Num];

has 'min_value' => is => 'ro', isa => Maybe[Num];

sub value {
   my $self = shift;
   my @values;

   push @values, $self->max_value if $self->max_value;
   push @values, $self->min_value if $self->min_value;

   return @values;
}

use namespace::autoclean;

1;
