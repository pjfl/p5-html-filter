# Name

HTML::Filter - Generates SQL::Abstract from JS graphical query editor

# Synopsis

    use HTML::Filter::Parser;

    my $json     = {};
    my $table    = $schema->resultset('TableBeingFiltered');
    my $parser   = HTML::Filter::Parser->new(config => {});
    my $filter   = $parser->parse($json);
    my $abstract = $filter->to_abstract({ table => $table });

# Description

JS executing in the browser updates the value of a hidden input field on an
HTML form. When posted to the server the parser consumes the JSON provided
and produces a representation of the query in [SQL::Abstract](https://metacpan.org/pod/SQL%3A%3AAbstract) format which
is in turn consumed by [DBIx::Class](https://metacpan.org/pod/DBIx%3A%3AClass) which produces an SQL query and bind
values

# Configuration and Environment

Defines no attributes

# Subroutines/Methods

Defines no methods

# Diagnostics

None

# Dependencies

- [Moo](https://metacpan.org/pod/Moo)
- [Unexpected](https://metacpan.org/pod/Unexpected)

# Incompatibilities

There are no known incompatibilities in this module

# Bugs and Limitations

There are no known bugs in this module. Please report problems to
http://rt.cpan.org/NoAuth/Bugs.html?Dist=HTML-Filter.
Patches are welcome

# Acknowledgements

Larry Wall - For the Perl programming language

# Author

Peter Flanigan, `<pjfl@cpan.org>`

# License and Copyright

Copyright (c) 2024 Peter Flanigan. All rights reserved

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself. See [perlartistic](https://metacpan.org/pod/perlartistic)

This program is distributed in the hope that it will be useful,
but WITHOUT WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE
