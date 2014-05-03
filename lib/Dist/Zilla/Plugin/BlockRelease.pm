use strict;
use warnings;
package Dist::Zilla::Plugin::BlockRelease;
BEGIN {
  $Dist::Zilla::Plugin::BlockRelease::AUTHORITY = 'cpan:ETHER';
}
# git description: 4dc0061
$Dist::Zilla::Plugin::BlockRelease::VERSION = '0.001';
# ABSTRACT: Prevent a release from occurring
# vim: set ts=8 sw=4 tw=78 et :

use Moose;
with 'Dist::Zilla::Role::BeforeRelease';
use namespace::autoclean;

sub before_release
{
    my $self = shift;
    $self->log_fatal('halting release');
}

__PACKAGE__->meta->make_immutable;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::BlockRelease - Prevent a release from occurring

=head1 VERSION

version 0.001

=head1 SYNOPSIS

In your F<dist.ini>:

    [BlockRelease]

=head1 DESCRIPTION

This plugin, when loaded, prevents C<dzil release> from completing. It is
useful to include temporarily, while developing (perhaps while using some
development-only requirements or code, to guard against an accidental release.

Load it last to allow all other C<BeforeRelease> plugins to still perform
their checks, or first to stop these pre-release checks from occurring.

=for Pod::Coverage before_release

=head1 SUPPORT

=for stopwords irc

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=Dist-Zilla-Plugin-BlockRelease>
(or L<bug-Dist-Zilla-Plugin-BlockRelease@rt.cpan.org|mailto:bug-Dist-Zilla-Plugin-BlockRelease@rt.cpan.org>).
I am also usually active on irc, as 'ether' at C<irc.perl.org>.

=head1 AUTHOR

Karen Etheridge <ether@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Karen Etheridge.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
