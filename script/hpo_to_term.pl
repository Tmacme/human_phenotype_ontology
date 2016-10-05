#!/usr/bin/env perl

# Script to output names and synonyms of HPO terms

use strict;
use warnings;
use hpo qw/hpo_to_name hpo_to_level hpo_to_synonym/;

my $usage = "Usage: $0 <HPO term> [HPO terms]\n";

if (scalar(@ARGV) == 0){
   die $usage;
}

foreach my $h (@ARGV){
   $h =~ s/,//g;
   my $name  = hpo_to_name($h);
   my $level = hpo_to_level($h);
   print "$h\tlevel $level\n";
   print "\t$name\n";
   my $syn = hpo_to_synonym($h);
   for (my $i = 0; $i < scalar(@{$syn}); ++$i){
      print "\t$syn->[$i]\n";
   }
}

__END__
