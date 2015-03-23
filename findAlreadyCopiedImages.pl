#!/usr/bin/perl -w
# This FAST tool prints the full path of files from a given directory
# that already exist with the same file size in or under my pictures_folder.
# I use this to list all videos and images from an SD card that I already sorted into my local picutes2 folderstructure before.
# Input: directory of SD card as first programm argument
# Output: list of full path of already existing files (via std out. one path per line)

($#ARGV == 0) or die "Usages:\n  $0 [directory with new pictures]\n  $0 [fullpath to a file in that directory]\n"; 

use File::Spec;
use File::Find;

my $pictures_folder = '/Volumes/Data1TB/Pictures2';
my ($volume,$newPicsDir,$anyfile) = File::Spec->splitpath( $ARGV[0] );
my %existingFile;
my %newFile;

# This helper method fills the given associative array with some info about files.
# @param $aref      reference to an associative array that is filled and returned
# @param $filename  filename (with extension and without path)
# @param $filepath  full path of the file
# @return the passed arrayref will be filled like this:
#     %fileInfo = {
#        'IMG_123.jpg' => { size => 123345, path = '/full/path/to/IMG_123.jpg' }
#     }
sub saveFileInfo {
    my ($aref, $filename, $filepath) = @_;
    if (-f $filename) {
      $$aref{$filename}{'size'} = -s;
      $$aref{$filename}{'path'} = $filepath;
    }
}

# Fill two associative arrays:
# 1. %existingFile contains all files that already exist in or under $pictures_folder
# 2. %newFile contains all files within the passed folder
# Remark: 'sub' is used as a 'closure' here.  I like hakish perl :-)
find( sub { saveFileInfo(\%existingFile, $_, $File::Find::name) }, $pictures_folder);
find( sub { saveFileInfo(\%newFile, $_, $File::Find::name) },      $newPicsDir);

# print full path of newFile in given folder that already exists with same size under $pictures_folder
# the whole point of all the above is to be FAST!
foreach (keys %newFile) 
{
    if (defined $existingFile{$_} && $newFile{$_}{'size'} == $existingFile{$_}{'size'} ) {
        print $newFile{$_}{'path'}."\n";
    }
}
