#!/usr/bin/env perl

$ENV{DOCUMENT_ROOT} = '/usr/local/sites/romeo/html';

use lib '../lib';
use WWW::Romeo::Session;

my $session = WWW::Romeo::Session->new(
    User        =>      'mikeyg',
    Pass        =>      'test123',
);

print $session->session_id . "\n";

print "hi\n";

print $session->user . "\n";
