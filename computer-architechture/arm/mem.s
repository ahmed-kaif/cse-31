.global _start
_start:
  MOV R1, #0x20000000
  mov r9, #42
  str r9, [r1, #2]
  ldr r4, [r1, #2]

