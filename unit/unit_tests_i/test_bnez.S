#include "insns.S" 
#include "utils.S"

.section .data
    val1: .octa 0x26bf5f56d85c76ce7141e1c7d71b77d0
    val2: .octa 0xafb8c0b4f3e85dc236d4f35bb6e1f175
    val3: .octa 0xdf9a9c04623568cd0000000000000000
    val4: .octa 0x72679b604129a5b80000000000000000
    val5: .octa 0x00000000000000000000000000000001
    val6: .octa 0x00000000000000000000000000000000

.section .text.init,"ax",@progbits
.globl _start
_start:
    // Is value non-zero (checking both 64-bit words) ?
    la t0, val1
    lq(t0, 0, t0)

    bnez t0, 1f

    //prgchk err
    nop
1:
    // Is value non-zero (checking upper 64-bit word) ?
    la t0, val3
    lq(t0, 0, t0)

    bnez t0, 1f

    //prgchk err
    nop
1:
    // Is value non-zero (checking lower 64-bit word) ?
    la t0, val5
    lq(t0, 0, t0)

    bnez t0, 1f

    //prgchk err
    nop
1:
    // Is value zero, finally ?
    la t0, val6
    lq(t0, 0, t0)
    
    bnez t0, all_err

    j exit

all_err:
    //prgchk err
    nop
