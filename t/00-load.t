#!perl -T
use 5.12;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'PlaySpine' ) || print "Bail out!\n";
}

diag( "Testing PlaySpine $PlaySpine::VERSION, Perl $], $^X" );
