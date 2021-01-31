All praise be to Almighty Allah 
and peace and countless blessings
of Allah be upon our beloved 
Prophet Muhammad!

# x86-64-Assembly-Programming

nasm -f win64 -g file.asm -l file.lst 

gcc -o file.exe file.obj -g -m64

file.exe

| Linux| Windows|
| ---- |:------:|
| RDI  | RCX   |
| RSI  | RDX   |
| RDX  | R8    |
| RCX  | R9    |
|  R8  | STACK |
|  R9  | STACK |
| XMM0 | XMM0  |
| TO   |  TO   |
| XMM7 | XMM3  |


|Volatile| Non-Volatile|
| ------ |:-----------:|
|RAX|RBX|
|RCX|RBP|
|RDX|RDI|
|R8|RSI|
|R9|RSP|
|R10|R12|
|R11|R13|
||R14|
||R15|

x64 Instructions Explained: https://www.officedaytime.com/simd512e/
