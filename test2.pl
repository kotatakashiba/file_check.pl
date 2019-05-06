#!/usr/bin/perl 
use strict;
use warnings;
use Cwd 'getcwd';

#my $testfile = "test.txt";
#my $testfile = "hoge.bin";
my $curdir = getcwd;


sub file_check {
    my $chkfile = shift;
    my $ret = 0;
    if ( -e $chkfile ) {
        $ret = 1;
        return $ret;
    } else {
        return $ret;
    }
}

sub dir_check {
    my $chkfile = shift;
    my $ret = 0;
    if ( -d $chkfile ) {
        $ret = 1;
        return $ret;
    } else {
        return $ret;
    }
}

my @all_files = glob "$curdir/*";
print join( "\n", @all_files );

foreach my $file (@all_files) {
    if ( file_check($file) ) {
        if ( -T $file ) {
            open ( my $fh, '<', $file);
            while ( my $line = <$fh> ) {
                print $line;
            }
            close $fh;
        } elsif ( -B $file ) {
            print 'birarryfile';
        }
    } else {
        print 'error' . "\n";
    }
}
