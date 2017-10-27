http://danluu.com/branch-prediction/

- Always taken branch prediction is already pretty good! ~2x better than no prediction
- In general, static branch prediction can go fairly far
- Better: N 1bit-entries that remember branch taken last time for up to N branches
- Even better: 2-bit entries that store counter; we're branch taken increases and not-taken decreases. (More bits are not worth it; as patterns in branches that repeat after more than 4 iterations are not likely to be caught by larger amount of bits; and added overhead is therefore not worth it)