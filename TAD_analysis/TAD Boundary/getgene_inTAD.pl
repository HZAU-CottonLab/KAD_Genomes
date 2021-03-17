#!/usr/bin/perl
use strict;
my $file1 = shift ; #loci[Chr,Strat,End,Value]
my $file2 = shift ; #gene loci [Gene,Chr,Strat,End]
   
my %hash_gff = () ;
open IN1,"<$file2" or die "$!";
while (<IN1>){
	chomp;
	my @domain = split ;
	push(@{$hash_gff{"$domain[1]"}},[$domain[0],$domain[2],$domain[3]]) ;
	# $hash_gff{"$domain[1]"}->{$domain[0]} = [$domain[2],$domain[3]] ;
}

open IN2, "<$file1" or die "$!";
while (<IN2>){
	chomp;
	my @array = split ;
	if (defined $hash_gff{"$array[0]"}){
      	  my @geneID =  @{$hash_gff{"$array[0]"}} ;
		print join("\t",@array) ;
		for  my $id (@geneID){
			if ($id->[1] >= $array[1] && $id->[2] <= $array[2]){                           
				print "\t",$id->[0];	
	}
		}
		print "\n" ;
			}	
				}

