package HTML::Filter::Util;

use strictures;

use HTML::Filter::Constants qw( EXCEPTION_CLASS FALSE TRUE );
use Module::Runtime         qw( is_module_name require_module );
use Unexpected::Functions   qw( is_class_loaded throw Unspecified );

use Sub::Exporter -setup => { exports => [
   qw( ensure_class_loaded throw_on_error )
]};


=item C<ensure_class_loaded>

   ensure_class_loaded $some_class, $options_ref;

Require the requested class, throw an error if it doesn't load

=cut

sub ensure_class_loaded ($;$) {
   my ($class, $opts) = @_;

   throw Unspecified, ['class name'], level => 2 unless $class;

   throw 'String [_1] invalid classname', [$class], level => 2
      unless is_module_name($class);

   $opts //= {};
   return TRUE if !$opts->{ignore_loaded} && is_class_loaded $class;

   eval { require_module($class) }; throw_on_error({ level => 3 });

   throw 'Class [_1] loaded but package undefined', [$class], level => 2
      unless is_class_loaded $class;

   return TRUE;
}

=item C<throw_on_error>

   throw_on_error @args;

Passes it's optional arguments to L</exception> and if an exception object is
returned it throws it. Returns undefined otherwise. If no arguments are
passed L</exception> will use the value of the global C<$EVAL_ERROR>

=cut

sub throw_on_error (;@) {
   EXCEPTION_CLASS->throw_on_error(@_);
}

1;

__END__

=pod

=encoding utf-8

=head1 Name

HTML::Filter::Util - One-line description of the modules purpose

=head1 Synopsis

   use HTML::Filter::Util;
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
