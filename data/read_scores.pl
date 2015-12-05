#!/usr/bin/perl
###############################################################################
# name:
#   read_scores.pl
# usage:
#   ./read_scores.pl < scores_2002.txt
# bugs:
#   Maximum scores hard-wired.
#   Grade break-down hard-wired.
# revision history:
#   2001-Nov-18  written - Hogg
###############################################################################

# loop over lines, removing newlines and comments
while($line = <STDIN>){
    chomp $line ;
    ($line)= split /\#/, $line, 2 ;

# read lines with grades
    if($line =~ /\"(.*)\"\s+(\S+.*)/){
	$name= $1 ;
#	print STDOUT "# name $name\n" ;
	$line= $2 ;
#	print STDOUT "# $line \n" ;
	($q1,$q2,$q3,$q4,$participation,$ps,$final,$grade)= split /\s+/, $line ;
#	print STDOUT "# q1 $q1; q2 $q2; q3 $q3; q4 $q4\n" ; 
#	print STDOUT "# ps $ps; final $final; participation $participation\n" ;

# total up quizzes and max quiz scores for each student
        $maxq= 0 ; $totalq= 0 ;
        if($q1 =~ /\d+/){ $maxq+= 10.0 ; $totalq+= $q1 ; }
        if($q2 =~ /\d+/){ $maxq+= 10.0 ; $totalq+= $q2 ; }
        if($q3 =~ /\d+/){ $maxq+= 10.0 ; $totalq+= $q3 ; }
        if($q4 =~ /\d+/){ $maxq+= 10.0 ; $totalq+= $q4 ; }
#	print STDOUT "maxq $maxq; totalq $totalq\n" ;

# set maximum problem set, exam and participation scores
        $maxps= 390.0 ;
	$maxfinal= 30.0 ;
        $maxpart= 5.0 ;

	# make combined grades
	$combined= 30.0* $totalq/$maxq    + 30.0* $ps/$maxps
                 + 35.0* $final/$maxfinal +  5.0* $participation/$maxpart;
	print STDOUT "$combined ($q1 $q2 $q3 $q4) ($participation) ($ps) ($final) \t$grade \t$name\n" ;
   }
}
