package HTML::Filter::Node;

use Moo;

sub type {
   my $self = shift;
   my $type = blessed $self;

   $type =~ s{ \A HTML::Filter::(Node::)? }{}mx;
   $type =~ s{ :: }{.}gmx;

   return $type;
}

use namespace::autoclean;

1;
