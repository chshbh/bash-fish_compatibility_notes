#! /usr/bin/env fish

function dec2bin_hax -d "this hax can map binary values upto 2^(#seq), using cross product of (0,1)*"
    set -l BINARYLIST (seq 0 1)(seq 0 1)(seq 0 1)(seq 0 1)
    echo $BINARYLIST[(math $argv + 1)]
end

set -l bits (shuf --input-range=0-1 --repeat --head-count=16)
echo $bits
set -l array
for i in (seq 1 16)
    if test $bits[$i] -eq 1;set -a array (math $i - 1);end
end

echo $array
set -l binarray
for i in $array; set -a binarray (dec2bin_hax $i); end
echo $binarray[1]

