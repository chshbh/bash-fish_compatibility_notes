#! /usr/bin/env fish

function dec2bin_hax -d "this hax can map binary values upto 2^(#seq), using cross product of (0,1)*"
    set -g BINARYLIST (seq 0 1)(seq 0 1)(seq 0 1)(seq 0 1)
    echo $BINARYLIST[(math $argv+1)]
end


function bin2dec_hax -d "read dec2bin"
    if contains --index $argv $BINARYLIST; ;end
end


function scuffed_xor -d "xor hax. how? take all the bits at significant positions and do addtion modulo 2"
    set -g sig_bit 0 0 0 0
    for i in $argv
        set temp (string split '' $i)
        set sig_bit[1] (math "$sig_bit[1]+$temp[1]")
        set sig_bit[2] (math "$sig_bit[2]+$temp[2]")
        set sig_bit[3] (math "$sig_bit[3]+$temp[3]")
        set sig_bit[4] (math "$sig_bit[4]+$temp[4]")
    end
    set sig_bit[1] (math "$sig_bit[1]%2")
    set sig_bit[2] (math "$sig_bit[2]%2")
    set sig_bit[3] (math "$sig_bit[3]%2")
    set sig_bit[4] (math "$sig_bit[4]%2")
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
# get indices in binary 
set binarray
for i in $array;set -a binarray (dec2bin_hax $i);end

# echo $binarray
scuffed_xor $binarray
# echo $sig_bit

set sig_bit (string join "" $sig_bit)
echo $sig_bit
set dec (bin2dec_hax $sig_bit)
set dec (math $dec) #indices are fucked, starts from 1

set bits[$dec] (math "abs($bits[$dec]-1)")
echo $bits

set array
for i in (seq 1 16)
    if test $bits[$i] -eq 1;set -a array (math $i-1);end
end
set binarray
for i in $array;set -a binarray (dec2bin_hax $i);end

scuffed_xor $binarray
echo "Testing ==> $sig_bit"

