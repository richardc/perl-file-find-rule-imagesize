# $Id$
package File::Find::Rule::ImageSize;
use strict;

use File::Find::Rule;
use base qw( File::Find::Rule );
use vars qw/$VERSION @EXPORT/;
$VERSION = '0.01';
@EXPORT = @File::Find::Rule::EXPORT;

use Number::Compare;
use Image::Size;

sub File::Find::Rule::image_x {
    my $self = shift()->_force_object;
    my @rules = map { Number::Compare->new($_) } @_;
    $self->exec( sub {
                     my ($x, $y) = imgsize($_);
                     return unless defined $x;
                     for (@rules) { return 1 if $_->($x) }
                     return;
                 } );
}

1;
