#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 3;

BEGIN {
    use_ok( 'PlaySpine' ) || print "Bail out!\n";
    use_ok( 'PlaySpine::Base' ) || print "Bail out!\n";
}

my $obj = PlaySpine::Base->new();

$obj->bind('foo', sub { pass('Ran'); }, 1, 2);

$obj->trigger('foo');

diag( "Testing PlaySpine $PlaySpine::VERSION, Perl $], $^X" );
