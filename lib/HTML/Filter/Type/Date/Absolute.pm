package HTML::Filter::Type::Date::Absolute;

use HTML::Filter::Constants qw( FALSE TRUE );
use HTML::Filter::Types     qw( AbsoluteDate );
use Moo;

extends 'HTML::Filter::Type::Date';

has 'date' => is => 'ro', isa => AbsoluteDate, required => TRUE;

sub value {
   return '?', shift->date;
}

1;
