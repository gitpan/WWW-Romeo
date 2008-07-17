#!/usr/bin/env perl

use lib('../lib');

use WWW::Romeo::DB;
my $dbic = WWW::Romeo::DB->connect('DBI:SQLite:test.db');

my $user = $dbic->resultset('User')->create(
    {
        username        =>      'mikeyg',
        password        =>      'test123',
        common_name     =>      'Michael Gregorowicz',
        flags           =>      'a,b,c',
    }
);

#my $user = $dbic->resultset('User')->search(
#    {
#        username        =>      'mikeyg',
#    }
#)->first;

#print $user->common_name . "\n";
#print $user->has_flag('s') . "\n";
print $user->has_flag('b') . "\n";
#print $user->has_flag('z') . "\n";
#
#$user->add_flag('b');
#$user->add_flag('z');
#
#print $user->has_flag('z') . "\n";
#
$user->favorite_ice_cream('vanilla');
#
print $user->favorite_ice_cream . "\n";

$user->delete;

