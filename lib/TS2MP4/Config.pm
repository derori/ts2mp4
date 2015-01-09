package TS2MP4::Config;

use 5.20.1;
use JSON::XS;
use base qw(Class::Singleton);
use Path::Class;
use Data::Dumper;

sub _new_instance{

    my $class = shift;
    my $self  = bless { }, $class;
    return $self;
}

sub getApp(){
    try{
        my $file = file($ENV{"PROJECT_ROOT"} . 'config/app.json');
        return decode_json($file->slurp);
    }catch{
        die $_;
    }
}


1;
