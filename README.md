# 🗳️ Verilog Voting Machine

A simple digital voting machine built using Verilog. It supports:
- Debouncing for each candidate button
- Vote logging and counting
- Mode switching between voting and result display

## 📁 Files

File | Description

`design.sv` | Main Verilog modules: `buttonControl`, `voteLogger`, `modeControl`, `votingMachine` 
`testbench.sv` | Testbench simulating user inputs and checking vote results 
`waveform.png` | Final simulation waveform showing correct vote count and display 
`dump.vcd` | Generated waveform file for viewing in GTKWave 

## ⚙️ Modules Overview

### `buttonControl`
- Debounces button presses.
- Outputs a `valid_vote` when the button is held for a threshold duration.

### `voteLogger`
- Logs and counts votes for 4 candidates.
- Increments only on valid votes in `voting mode`.

### `modeControl`
- Displays `FF` on LEDs during vote registration.
- Shows vote counts on LED when switched to `result mode`.

## 🧪 Simulation Results

- <img width="902" alt="waveform" src="https://github.com/user-attachments/assets/3c70bd7b-4206-4d6f-be27-105f267c1307" />


- ✔️ `cand1_vote_recvd` and `cand2_vote_recvd` increment as expected.
- ✔️ `led` displays `FF` during vote casting and switches to actual count in result mode.

## ▶️ How to Run

1. Install [Icarus Verilog](http://iverilog.icarus.com/) and [GTKWave](http://gtkwave.sourceforge.net/).
2. Compile and simulate:

```bash
iverilog -g2012 -o voting_test design.sv testbench.sv
vvp voting_test
gtkwave dump.vcd
