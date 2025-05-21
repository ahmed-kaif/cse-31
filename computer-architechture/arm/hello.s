.section .data
  msg: .ascii "hello world"
  len = .-msg
.section .text
.global _start
_start:
  @ write : 4
  mov r7, #4
  mov r0, #1
  ldr r1,=msg
  ldr r2,=len
  svc #0

  @ exit : 1
  mov r7, #1
  mov r0, #11
  svc #0
