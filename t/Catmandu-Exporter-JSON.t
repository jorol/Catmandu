#!/usr/bin/env perl

use strict;
use warnings;
use Catmandu::ConfigData;
use Test::More;
use Test::Exception;
use JSON ();

my $pkg;
BEGIN {
    #unless (Catmandu::ConfigData->feature('')) {
    #    plan skip_all => 'feature disabled';
    #}
    $pkg = 'Catmandu::Exporter::JSON';
    use_ok $pkg;
}
require_ok $pkg;

my $data = [{'a' => 'moose'}, {'a' => 'pony'}, {'a' => 'shrimp'}];
my $file = "";

my $exporter = $pkg->new(file => \$file);

isa_ok $exporter, $pkg;

$exporter->add($_) for @$data;
$exporter->commit;
is_deeply $data, [ map { JSON::decode_json($_) } split /\n/, $file ];

done_testing 4;
