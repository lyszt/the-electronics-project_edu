# The Electronics Project

A study repository. The goal is to learn PCB design — how to take a circuit idea and turn it into an actual board you can hold.

To get there, I'm working through the fundamentals first. The Arduino sketches are for getting comfortable with physical components: buttons, LEDs, reading signals, that kind of thing. The Verilog side is for understanding digital logic more deeply — how basic building blocks like registers, counters, and memory actually work together. 

The processor is being made so I can learn in the most painful way possible how electronics work at the lowest level. 
> Because apparently suffering is good. 

SAP-1 — Simple as Possible Computer (reference): https://karenok.github.io/SAP-1-Computer/

---

## Structure

```
arduino/      Physical hardware experiments on Arduino
processor/    Verilog modules — building blocks of the SAP-1 processor
```

---

## Processor (Verilog)

Built and simulated using [Digital](https://github.com/hneemann/Digital). Each module is a component of the SAP-1 architecture. The full schematic lives in `main.dig`.

| Module | File | Description |
|--------|------|-------------|
| 8-bit Adder | `adder_8bit.v` | Adds two 8-bit values with carry in/out |
| 8-bit Register | `register_8bit.v` | Clocked register with write enable and synchronous reset |
| Program Counter | `program_counter.v` | Increments each clock tick, supports stop and reset |
| Memory | `memory_256x8.v` | 256-byte synchronous RAM |
| 8-to-1 Mux | `mux_8_to_1.v` | Selects one of 8 data lines |
| 8-bit Counter | `counter_8bit.v` | Counts up on each clock, with load and reset |
| Do Once | `do_once.v` | One-shot latch — lets a signal through exactly once |

---

## Arduino Sketches

Warm-up experiments on real hardware. Build confidence before committing to building a CPU.

### 1. The off-on device (completely useless)

**Description:**
A basic toggle device with a physical button and two LEDs (red and blue).

**Behavior:**
* When powered on, the red LED lights up.
* Pressing the button turns off the red LED and turns on the blue LED.
* Pressing the button again reverts the state.

**Circuit:** button on pin 9 (INPUT_PULLUP), blue LED on pin 2, red LED on pin 7.

> My ancestors waited for the moment this device was invented. And here we finally are.

https://github.com/user-attachments/assets/84a58edd-f701-44ae-ba21-e87acdc27f96

### 2. Button test

Drives a pin HIGH to verify a button circuit is wired correctly. Strictly a sanity check before connecting anything worth breaking.

### 3. Read test

Reads a digital pin and streams the value to serial at 9600 baud. First contact with digital input reading in this setup.
