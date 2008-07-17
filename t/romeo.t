#!/usr/bin/env perl

use lib '../lib/';

$ENV{DOCUMENT_ROOT} = '/usr/local/sites/romeo/html';

use Test::More qw(no_plan);

print "=== Object Tests ===\n";
use WWW::Romeo;
use WWW::Romeo::Session;

my $romeo = new WWW::Romeo;

is(ref($romeo), 'WWW::Romeo', "Making sure \$romeo is WWW::Romeo.");
is($romeo->c->COOKIE_DURATION, '3600', "Config object, i know im jumping the gun, but does it work?");
is(ref($romeo->db), 'WWW::Romeo::DB', "Do we have a database object?");

print "\n=== User Tests ===\n";

# deploy the database schema
$romeo->deploy;

my $user = $romeo->db->resultset('User')->create(
    {   
        username        =>      'mikeyg',
        password        =>      'test123',
        common_name     =>      'Michael Gregorowicz',
        flags           =>      'a,b,c',
    }
);

is($user->username, 'mikeyg', 'schema deployed and user created');

$user = undef;
eval {
    $user = $romeo->db->resultset('User')->create(
        {   
            username        =>      'mikeyg',
            password        =>      'test123',
            common_name     =>      'Michael Gregorowicz',
            flags           =>      'a,b,c',
        }
    );
};

ok(!$user, 'Making sure user didnt get set or re-created');

$user = $romeo->user('mikeyg');

is($user->username, 'mikeyg', 'Making sure we can re-open what we saved.');

print "\n=== Session Tests ===\n";

my $session = WWW::Romeo::Session->new(
    User        =>          'mikeyg',
    Pass        =>          'test123');

is($session->user, 'mikeyg', 'Autenticated session created?');

my $anon = WWW::Romeo::Session->new(
    Anon        =>          1);

is ($anon->user, 'anonymous', 'Anonymous session created?');
