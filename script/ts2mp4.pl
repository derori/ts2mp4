#!/usr/local/bin/perl
#!/usr/bin/env perl

use 5.20.1;
use Data::Dumper;
$Data::Dumper::Terse = 1;# $VAR1などをつけない。

use JSON;
BEGIN {
    use Path::Class;
    require(file(__FILE__)->absolute->dir . "/../init.pm");
}

use TS2MP4::Config;

my $C = TS2MP4::Config->instance()->getApp();
