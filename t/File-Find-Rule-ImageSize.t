#!perl -w
use strict;
use Test::More tests => 2;

use File::Find::Rule::ImageSize;
is_deeply( [ find( image_x => 640, maxdepth => 2, in => 't' ) ],
           [ 't/happy-baby.JPG' ], "x == 640" );

is_deeply( [ find( image_x => 641, maxdepth => 2, in => 't' ) ],
           [ ] );
