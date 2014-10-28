use strict;
use warnings;
package Dist::Zilla::Plugin::BlockRelease;
# git description: v0.001-8-gc4f0ca1
$Dist::Zilla::Plugin::BlockRelease::VERSION = '0.002';
# ABSTRACT: Prevent a release from occurring
# KEYWORDS: plugin distribution release sanity safety prevent
# vim: set ts=8 sw=4 tw=78 et :

use Moose;
with 'Dist::Zilla::Role::BeforeRelease',
    'Dist::Zilla::Role::Releaser';

use namespace::autoclean;

sub BUILD
{
    my $self = shift;
    $self->log('releases will be prevented!');
}

# nothing to put in dump_config yet...
# around dump_config => sub { ... };

sub before_release
{
    my $self = shift;
    $self->log_fatal('halting release');
}

sub release {}

__PACKAGE__->meta->make_immutable;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::BlockRelease - Prevent a release from occurring

=head1 VERSION

version 0.002

=head1 SYNOPSIS

In your F<dist.ini>:

    [BlockRelease]

=head1 DESCRIPTION

This plugin, when loaded, prevents C<dzil release> from completing. It is
useful to include temporarily, while developing (perhaps while using some
development-only requirements or code, to guard against an accidental release.

Load it last to allow all other C<BeforeRelease> plugins to still perform
their checks, or first to stop these pre-release checks from occurring.

=for Pod::Coverage BUILD before_release release

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
