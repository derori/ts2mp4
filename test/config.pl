#!/usr/local/bin/perl
#!/usr/bin/env perl

use 5.20.1;
use Data::Dumper; # $VAR1などをつけない。
$Data::Dumper::Terse = 1;
#use base qw(FW::Config Class::Singleton);
use JSON;
BEGIN {
    use Path::Class;
    require(file(__FILE__)->absolute->dir . "/../init.pm");
}

use TS2MP4::Config;

my $C = TS2MP4::Config->instance()->getApp();


#warn Dumper $config->{dir}->{to};
#my $config = $C->getApp();

#warn Dumper $C;
# my $t;
# $t->{"dir"}->{"from"} = "/smb/ts/";
# $t->{"dir"}->{"to"}   = "/smb/ts2mp4/";
# $t->{"encoder"}->{"bin"} = "/usr/local/bin/HandBrakeCLI";
# $t->{"encoder"}->{"param"} = '-i ${INPUT} -o ${OUTPUT} --preset="High Profile"';

# my $json = JSON->new->allow_nonref;

# warn $json->pretty->encode($t);
