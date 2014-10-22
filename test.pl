use Time::Fake;
use Test::More 'no_plan';
use strict;

my $mon = (localtime)[4];
is(  Time::Fake->offset("+2M"),
    0,
    "original offset zero" );

ok( $mon != (localtime)[4],
    "changes localtime" );

is( 3600*24*60,
    Time::Fake->reset,
    "reflects new offset" );

is( (localtime)[4],
    $mon,
    "localtime reset" );

my $epoch = 1199547498;
Time::Fake->offset($epoch);
is( time,
    $epoch,
    "epoch as argument" );


