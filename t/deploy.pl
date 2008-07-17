#!/usr/bin/env perl

my $db_file = $ARGV[0];

unless ($db_file) {
    die "Usage: deploy <database file>\n";
}

use WWW::Romeo::DB;
my $dbic = WWW::Romeo::DB->connect('DBI:SQLite:' . $db_file);
$dbic->deploy;
