.global _start
_start:
;  large immediate values (#0x46a1f1b7 and #0x0ffff0000) with MOV,
;  which cannot encode arbitrary 32-bit constants directly in ARM32 (ARMv7
;  and earlier).
  LDR R2, =#0x0ffff0000
  LDR R1, =#0x46a1f1b7
  ; the below lines do the same
  MOV R1, #0x46000000
  ORR R1, #0xa10000
  ORR R1, #0xf100
  ORR R1, #0xb7

  AND R3, R1,R2
  ORR R4, R1,R2
  EOR R5, R1,R2
  BIC R6, R1,R2
  MVN R7, R2
  
  ;;;;; SHIFT ;;;;;
  ; LSL , LSR , ASR, ROR
  ; immediate SHIFT amount is 5 bit immediate (0-31)
  LDR R5, =#0xff1c10e7
  LSL R0, R5, #7  ; R0 = R5 << 7
  LSR R1, R5, #17 ; R1 = R5 >> 17
  ASR R2, R5, #3 ; R2 = R5 >>> 3
  ROR R3, R5, #21 ; R3 = R2 ROR 21
  
  ; Register SHIFT amount is Low 8 bit of Register (0-255)


