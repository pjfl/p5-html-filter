package HTML::Filter::Constants;

use strictures;

use HTML::Filter::Exception;

use Sub::Exporter -setup => { exports => [
   qw( EXCEPTION_CLASS FALSE NUL TRUE )
]};

sub FALSE () { 0   }
sub NUL   () { q() }
sub TRUE  () { 1   }

sub EXCEPTION_CLASS () { __PACKAGE__->Exception_Class }

my $exception_class = 'HTML::Filter::Exception';

sub Exception_Class {
   my ($self, $class) = @_;

   return $exception_class unless defined $class;

   $exception_class->throw(
      "Exception class ${class} is not loaded or has no throw method"
   ) unless $class->can('throw');

   return $exception_class = $class;
}

1;

__END__

=pod

=encoding utf-8

=head1 Name

HTML::Filter::Constants - One-line description of the modules purpose

=head1 Synopsis

   use HTML::Filter::Constants;
   # Brief but working code examples

=head1 Description

=head1 Configuration and Environment

Defines the following attributes;

=over 3

=back

=head1 Subroutines/Methods

=head1 Diagnostics

=head1 Dependencies

=over 3

=item L<Class::Usul>

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
