# $Id: $
package File::Find::Rule::ImageSize;
use strict;
use vars qw/$VERSION @EXPORT/;
use File::Find::Rule;
use Image::Size;
use base qw( File::Find::Rule );
$VERSION = '0.01';
@EXPORT = @File::Find::Rule::EXPORT; # yes, re-export

sub File::Find::Rule::image_x {
    my $self = shift()->_force_object;
    my @rules = @_;
    $self->exec( sub {
                     my ($x, $y) = imgsize($_);
                     return unless defined $x;
                     for (@rules) { return 1 if $x == $_ }
                     return;
                 } );
}

1;
