# DEUARC – DEU Electronic Universal Automatic Reduced Computer

A basic computer architecture designed and simulated in **Quartus II** as part of the CME 2206 Computer Architecture term project at Dokuz Eylül University.

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

### ALU Operations

Controlled by a 4-bit opcode `X[3..0]`:

| Code | Operation | Description |
|------|-----------|-------------|
| 0000 | DBL | Double Rs, store in Rd |
| 0001 | DBT | Halve Rs, store in Rd |
| 0010 | AND | Rs AND S2, store in Rd |
| 0011 | NOT | Complement Rs, store in Rd |
| 0100 | XOR | Rs XOR S2, store in Rd |
| 0101 | ADD | Rs + S2, store in Rd |
| 0110 | INC | Rs + 1, store in Rd |

### Control Unit

Decodes instructions and generates micro-operation signals for fetch, decode, and execute cycles.

## Project Structure

The repository contains Quartus II project files for three lab assignments:

- **Assignment 1** – Common Bus System and Registers
- **Assignment 2** – ALU design and integration
- **Assignment 3** – Control Unit

## Tools

- Intel Quartus II (design and simulation)
- Waveform files (`.vwf`) included for simulation verification
