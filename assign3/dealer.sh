#!/bin/bash
#
#Programer: Cristian Aguirre - Z1824863
#
#This script will compute some dollar amounts on
#a car based on a buy or lease of the car for that current day.
#
#
#

clear

TODAY=$(date)
echo "The date of this estimate is "$TODAY
echo
echo

if [ $# -ne 3 ];
then
    echo "Usage: You did not passed in three arguments"
    exit 1
fi

if [ $2 == '-b' ];
   then
   let ans1=$3+500
   let ans3=$ans1
   let ans2=$ans1\*8
   let ans3+=$ans2/100
   echo "Buying a $1 at a price of $ans1 including set up fee" '($500)'

   echo "and sales tax (8 percent) will end up totaling: \$$ans3"
   echo
 exit 1
fi

if [ $2 == '-l' ] && [ $3 -gt 24 ];
   then

    let cost=400
    let cost1=400\*3
    let cost2=$cost1/100
    let cost+=$cost2
    let total=$cost\*$3
    echo "Leasing a $1 for $3 months at \$400 per month"
    echo "with 3 percent interest will end up costing: \$$total"
    echo
  exit 1
  fi


if [ $2 == '-l' ] &&  [ $3 -lt 25 ];

    then
    let cost=400
    let cost1=400\*2
    let cost2=$cost1/100
    let cost+=$cost2
    let total=$cost\*$3
    echo "Leasing a $1 for $3 months at \$400 per month"
    echo "with 2 interest will end up costing: \$$total"
    echo
    exit 1
    fi

if [ $2 != '-b' ] && [ $2 != '-l' ];
    then
    echo "The only valid options are -b to buy and -l to lease."
    echo
    exit 1
    fi
