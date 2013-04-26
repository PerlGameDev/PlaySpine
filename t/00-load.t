#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 2;

BEGIN {
    use_ok( 'PlaySpine' ) || print "Bail out!\n";
    use_ok( 'PlaySpine::Base' ) || print "Bail out!\n";
}

diag( "Testing PlaySpine $PlaySpine::VERSION, Perl $], $^X" );
