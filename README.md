# DEUARC – DEU Electronic Universal Automatic Reduced Computer

A basic computer architecture designed and simulated in **Quartus II** as part of the CME 2206 Computer Architecture term project.

## Overview

DEUARC is a reduced computer consisting of a register file, memory subsystem, common bus, ALU, and control unit -- all designed as block diagrams and verified via waveform simulation.

## Architecture

### Registers (9 total)

| Symbol | Name | Bits | Description |
|--------|------|------|-------------|
| AR | Address Register | 4 | Holds data memory address |
| PC | Program Counter | 5 | Holds instruction address; supports CLR and INC |
| IR | Instruction Register | 11 | Holds current instruction code |
| SP | Stack Pointer | 4 | Holds stack memory address; supports CLR, INC, DEC |
| InpR | Input Register | 4 | Holds input data |
| OutR | Output Register | 4 | Holds output data |
| R0, R1, R2 | General Purpose | 4 | Hold operands and intermediate data |

### Memory

| Name | Size | Access |
|------|------|--------|
| Instruction Memory | 32×11 | Read only |
| Data Memory | 16×4 | Read / Write |
| Stack Memory | 16×5 | Read / Write |

## Instruction Set

Instructions are 11 bits wide. Format varies by type.

### Arithmetic and Logic Operations
Format: `Q(1) | Opcode(4) | Rd(2) | S1(2) | S2(2)`

| Opcode | Symbol | Description |
|--------|--------|-------------|
| 0000 | DBL | Double S1, store in Rd |
| 0001 | DBT | Halve S1, store in Rd |
| 0010 | AND | S1 AND S2, store in Rd |
| 0011 | NOT | Complement S1, store in Rd |
| 0100 | XOR | S1 XOR S2, store in Rd |
| 0101 | ADD | S1 + S2, store in Rd |
| 0110 | INC | S1 + 1, store in Rd |

Register encoding for Rd, S1, S2: `00`→R0, `01`→R1, `10`→R2

### Data Transfer Operations
Format: `Q(1) | Opcode(4) | Rd(2) | S1(2) | S2(2)`

| Opcode | Symbol | Description |
|--------|--------|-------------|
| 1000 | ST | Q=0: write Rd to memory address S1S2; Q=1: write data S1S2 to address in Rd |
| 1001 | LD | Q=1: read memory at S1S2, load into Rd; Q=0: load data S1S2 directly into Rd |
| 1010 | IO | Q=0: transfer S1 into OUTR; Q=1: transfer INPR into Rd |
| 1011 | TSF | Transfer S1 into Rd |

### Program Control Operations
Format: `-(1) | Opcode(4) | -(1) | Address(5)`

| Opcode | Symbol | Description |
|--------|--------|-------------|
| 1100 | JMP | Q=0: jump to address; Q=1: jump if V=1 |
| 1101 | CAL | Call subroutine (PUSH PC to stack, jump to address) |
| 1110 | RET | Return from subroutine (POP PC from stack) |
| 1111 | HLT | Halt the computer |

JMR uses format `-(1) | Opcode(4) | -(2) | Address(4, signed)` -- jumps relative to current PC.

## Tools

- Intel Quartus II (design and simulation)
- Waveform files (`.vwf`) included for simulation verification
