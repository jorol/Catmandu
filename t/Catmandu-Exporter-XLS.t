#!/usr/bin/env perl

use strict;
use warnings;
use Catmandu::ConfigData;
use Test::More;
use Test::Exception;

my $pkg;
BEGIN {
    unless (Catmandu::ConfigData->feature('export_xls')) {
        plan skip_all => 'feature disabled';
    }
    $pkg = 'Catmandu::Exporter::XLS';
    use_ok $pkg;
}
require_ok $pkg;

done_testing 2;

