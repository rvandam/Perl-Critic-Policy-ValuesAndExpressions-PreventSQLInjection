package Perl::Critic::Policy::ValuesAndExpressions::PreventSQLInjection;

use 5.006001;
use strict;
use warnings;

use base 'Perl::Critic::Policy';

use Carp;
use Data::Dumper;
use Perl::Critic::Utils;
use Readonly;
use Try::Tiny;


=head1 NAME

Perl::Critic::Policy::ValuesAndExpressions::PreventSQLInjection - Prevent SQL injection in interpolated strings.


=head1 VERSION

Version 1.0.0

=cut

our $VERSION = '1.0.0';


=head1 AFFILIATION

This is a standalone policy not part of a larger PerlCritic Policies group.


=head1 DESCRIPTION

When building SQL statements manually instead of using an ORM, any input must
be quoted or passed using placeholders to prevent the introduction of SQL
injection vectors. This policy attempts to detect the most common sources of
SQL injection in manually crafted SQL statements, by detecting the use of
variables inside interpolated strings that look like SQL statements.

In other words, this policy searches for code such as:

	my $sql = "SELECT * FROM $table WHERE field = $value";

But would leave alone:

	my $string = "Hello $world";


=head1 CONFIGURATION

There is no configuration option available for this policy.


=cut

Readonly::Scalar my $DESCRIPTION => 'SQL injection risk.';
Readonly::Scalar my $EXPLANATION => 'Variables in interpolated SQL string are susceptible to SQL injection: %s';


=head1 FUNCTIONS

=head2 supported_parameters()

Return an array with information about the parameters supported.

	my @supported_parameters = $policy->supported_parameters();

=cut

sub supported_parameters
{
	return ();
}


=head2 default_severity()

Return the default severify for this policy.

	my $default_severity = $policy->default_severity();

=cut

sub default_severity
{
	return $Perl::Critic::Utils::SEVERITY_HIGHEST;
}


=head1 BUGS

Please report any bugs or feature requests through the web interface at
L<https://github.com/guillaumeaubert/Perl-Critic-Policy-ValuesAndExpressions-PreventSQLInjection/issues>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

	perldoc Perl::Critic::Policy::ValuesAndExpressions::PreventSQLInjection


You can also look for information at:

=over 4

=item * GitHub (report bugs there)

L<https://github.com/guillaumeaubert/Perl-Critic-Policy-ValuesAndExpressions-PreventSQLInjection/issues>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Perl-Critic-Policy-ValuesAndExpressions-PreventSQLInjection>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Perl-Critic-Policy-ValuesAndExpressions-PreventSQLInjection>

=item * MetaCPAN

L<https://metacpan.org/release/Perl-Critic-Policy-ValuesAndExpressions-PreventSQLInjection>

=back


=head1 AUTHOR

L<Guillaume Aubert|https://metacpan.org/author/AUBERTG>,
C<< <aubertg at cpan.org> >>.


=head1 COPYRIGHT & LICENSE

Copyright 2013 Guillaume Aubert.

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License version 3 as published by the Free
Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see http://www.gnu.org/licenses/

=cut

1;