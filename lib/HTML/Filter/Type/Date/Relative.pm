package HTML::Filter::Type::Date::Relative;

use HTML::Filter::Constants qw( FALSE NUL TRUE );
use HTML::Filter::Types     qw( Bool Int );
use Moo;

extends 'HTML::Filter::Type::Date';

has 'days', is => 'ro', isa => Int, required => TRUE;

has 'months', is => 'ro', isa => Int, required => TRUE;

has 'past', is => 'ro', isa => Bool, required => TRUE;

has 'years', is => 'ro', isa => Int, required => TRUE;

sub value {
   my ($self, $args) = @_;

   my $interval = "((? || 'years')::interval + (? || 'months')::interval + (? || 'days')::interval)::interval";
   my $date; $date = $args->{date} if $args->{date};
   my $op = $self->past ? '-' : '+';
   my $holder;

   if ($self->has_time_zone) {
      my $timezone = $self->time_zone;

      if ($date) {
         $holder = "(timezone('${timezone}', '${date}')::timestamp ${op} ${interval})";
      }
      else {
         $holder = "(date_trunc('day', timezone('${timezone}', current_timestamp)) ${op} ${interval})";
      }
   }
   elsif ($date) {
      $holder = "('${date}'::timestamp ${op} ${interval})";
   }
   else {
      $holder = "(current_date::timestamp ${op} ${interval})";
   }

   return $holder, $self->years, $self->months, $self->days;
}

use namespace::autoclean;

1;
