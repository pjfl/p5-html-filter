package HTML::Filter;

use 5.010001;
use version; our $VERSION = qv( sprintf '0.1.%d', q$Rev: 6 $ =~ /\d+/gmx );

use Moo;

extends 'HTML::Filter::Node::AllowChildren';

use namespace::autoclean;

1;

__END__

=pod

=encoding utf-8

=head1 Name

HTML::Filter - Generates SQL::Abstract from JS graphical query editor

=head1 Synopsis

   use HTML::Filter::Parser;

   my $json     = {};
   my $table    = $schema->resultset('TableBeingFiltered');
   my $parser   = HTML::Filter::Parser->new(config => {});
   my $filter   = $parser->parse($json);
   my $abstract = $filter->to_abstract({ table => $table });

=head1 Description

JS executing in the browser updates the value of a hidden input field on an
HTML form. When posted to the server the parser consumes the JSON provided
and produces a representation of the query in L<SQL::Abstract> format which
is in turn consumed by L<DBIx::Class> which produces an SQL query and bind
values

=head1 Configuration and Environment

Defines no attributes

=head1 Subroutines/Methods

Defines no methods

=head1 Diagnostics

None

=head1 Dependencies

=over 3

=item L<Moo>

=item L<Unexpected>

=back

=head1 Incompatibilities

There are no known incompatibilities in this module

=head1 Bugs and Limitations

There are no known bugs in this module. Please report problems to
http://rt.cpan.org/NoAuth/Bugs.html?Dist=HTML-Filter.
Patches are welcome

=head1 Acknowledgements

Larry Wall - For the Perl programming language

=head1 Author

Peter Flanigan, C<< <pjfl@cpan.org> >>

=head1 License and Copyright

Copyright (c) 2024 Peter Flanigan. All rights reserved

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself. See L<perlartistic>

This program is distributed in the hope that it will be useful,
but WITHOUT WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

=cut

# Local Variables:
# mode: perl
# tab-width: 3
# End:
# vim: expandtab shiftwidth=3:
