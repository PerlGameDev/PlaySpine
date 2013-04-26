#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;


BEGIN {
    use_ok('PlaySpine::Base') || print "Bail out!\n";
}

my $obj = PlaySpine::Base->new();

$obj->bind( 'foo',
    sub { pass('Ran'); is( $_[0], $obj ); is( $_[1], 1 ); is( $_[2], 2 ); },
    1, 2 );

$obj->trigger('foo');

done_testing();
