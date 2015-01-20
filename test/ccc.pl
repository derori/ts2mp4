#!/usr/bin/env perl

# その日付のファイルをエンコするよ。
# param yyyymmdd
use 5.20.1;
use Data::Dumper;
$Data::Dumper::Terse = 1;# $VAR1などをつけない
use Path::Class;


my $date = $ARGV[0];
$date =~ s/^20//;
my $delete_flg = $ARGV[1] eq "--delete" ? 1 : 0;


my $C = {
    "dir" => {"from" => "/smb/ts",
              "to" => "/smb/ts2m4v"
          },
    "cli" => '/usr/local/bin/HandBrakeCLI -i "${INPUT}" -o "${OUTPUT}" --preset="High Profile"',
    "file_extension" => "mp4"
};

my $dir = dir($C->{dir}->{from});
while(my $file = $dir->next) {
    next if $file eq $dir or $file->resolve eq $dir->parent; # カレントと１つ上のディレクトリを除外

    if($file =~ /\[$date-/){
        my $to = $file->basename;
        $to =~ s/m2ts$/mp4/;

        my $c = $C->{cli};
        $c =~ s/\$\{INPUT\}/$file/;
        $c =~ s/\$\{OUTPUT\}/$C->{dir}->{to}\/$to/;
        warn $c;
        `$c`;
        unlink $file if($delete_flg);

    }


}
