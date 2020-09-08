#! /usr/bin/env fish

# lesson: seldom use functions with fish

function dec2bin_hax -d "this hax can map binary values upto 2^(#seq), using cross product of (0,1)*"
    set BINARYLIST (seq 0 1)(seq 0 1)(seq 0 1)(seq 0 1)
    echo $BINARYLIST[(math $argv+1)]
end

# two ways to generate random string of {0,1} simulating bit string of 16bits.
# set bits (shuf --input-range=0-1 --repeat --head-count=16)
set -q bits;for i in (seq 16);set -a bits (random 0 1);end 
echo $bits
set array
for i in (seq 1 16)
    if test $bits[$i] -eq 1;set -a array (math $i-1);end
end

echo $array
set binarray
for i in $array;set -a binarray (dec2bin_hax $i);end
echo $binarray

set sig_bit 0 0 0 0
for i in $binarray
    set temp (string split '' $i)
    echo $temp
    set sig_bit[1] (math "$sig_bit[1]+$temp[1]")
    set sig_bit[2] (math "$sig_bit[2]+$temp[2]")
    set sig_bit[3] (math "$sig_bit[3]+$temp[3]")
    set sig_bit[4] (math "$sig_bit[4]+$temp[4]")
end
echo $sig_bit
