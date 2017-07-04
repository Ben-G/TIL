## Efficient Index Lookup in Hash Tables

- https://mobile.twitter.com/luka_bernardi/status/882057681724334081

  - > My favorite trick with hash tables is to have the bucket list size be a power of two - 1 so that you can just AND mask the hash to the size.
    >
    > Both objc_msgSend and Swift’s Dictionary implementations take advantage of this to avoid modulo operation and do that in a single operation.

- Related: https://mikeash.com/pyblog/friday-qa-2017-06-30-dissecting-objc_msgsend-on-arm64.html

>  _mask is important: it describes the size of the hash table as a convenient AND-able mask. Its value is always a power of two minus 1, or in binary terms something that looks like 000000001111111 with a variable number of 1s at the end. This value is needed to figure out the lookup index for a selector, and to wrap around the end when searching the table.

> This instruction computes the starting hash table index for the selector passed in as `_cmd`. `x1` contains `_cmd`, so `w1` contains the bottom 32 bits of `_cmd`. `w11` contains `_mask` as mentioned above. This instruction ANDs the two together and places the result into `w12`. The result is the equivalent of computing `_cmd % table_size` but without the expensive modulo operation.

Underlying idea: when determining in which bucket a hashtable entry should be placed, use a bitmask operation instead of a modulo operation. This is only possible if the bucket count is (n^2)-1 (in that case the bitmask AND is equivalent to the modulo operation).