package File::Find::Rule::ImageSize;
use strict;
use vars qw/$VERSION @EXPORT/;
use File::Find::Rule;
use Image::Size;
use base qw( File::Find::Rule );
$VERSION = '0.01';
@EXPORT = @File::Find::Rule::EXPORT; # yes, re-export

sub File::Find::Rule::magic {
    my $self = shift()->_force_object;
    $self->exec( sub {
                     my $type = $mm->checktype_filename($_);
                     for (@patterns) { return 1 if $type =~ m/$_/ }
                     return;
                 } );
}

1;
