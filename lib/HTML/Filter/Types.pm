package HTML::Filter::Types;

use strictures;

use Type::Library             -base, -declare =>
                          qw( AbsoluteDate FilterDate FilterField FilterList
                              FilterNumeric FilterString FilterNegate );
use Type::Utils           qw( as class_type coerce declare extends from
                              message subtype via where );
use Unexpected::Functions qw( inflate_message );

BEGIN { extends 'Unexpected::Types' };

class_type FilterDate, { class => 'HTML::Filter::Type::Date' };

class_type FilterField, { class => 'HTML::Filter::Type::Field' };

class_type FilterList, { class => 'HTML::Filter::Type::List' };

class_type FilterNegate, { class => 'HTML::Filter::Type::Negate' };

class_type FilterNumeric, { class => 'HTML::Filter::Type::Numeric' };

class_type FilterString, { class => 'HTML::Filter::Type::String' };

coerce FilterDate, from Str, via {
   HTML::Filter::Type::Date->new( date => $_ );
};

coerce FilterDate, from HashRef, via {
   HTML::Filter::Type::Date->new( $_ );
};

coerce FilterField, from Str, via {
   HTML::Filter::Type::Field->new( name => $_ );
};

coerce FilterField, from HashRef, via {
   HTML::Filter::Type::Field->new( $_ );
};

coerce FilterList, from Str, via {
   HTML::Filter::Type::List->new( list => $_ );
};

coerce FilterList, from HashRef, via {
   HTML::Filter::Type::List->new( $_ );
};

coerce FilterNumeric, from Str, via {
   HTML::Filter::Type::Numeric->new( string => $_ );
};

coerce FilterNumeric, from HashRef, via {
   HTML::Filter::Type::Numeric->new( $_ );
};

coerce FilterString, from Str, via {
   HTML::Filter::Type::String->new( string => $_ );
};

coerce FilterString, from HashRef, via {
   HTML::Filter::Type::String->new( $_ );
};

subtype AbsoluteDate, as Str,
   where { $_ =~ m{ \A \d{4} [/-] \d{2} [/-] \d{2} \z }mx },
   message {
      inflate_message 'Value [_1] does not match pattern YYYY-MM-DD', $_
   };

1;
