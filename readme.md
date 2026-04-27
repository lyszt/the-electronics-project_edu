# The Electronics Project

A study repository. The goal is to learn PCB design and digital circuits. Verilog, Arduino, ESP32 and Raspberry PI. I will be posting my progress here as I continue. 

Final objective is to print a real circuit or PCB. 
To get there, I'm working through the fundamentals first. The Arduino sketches are for getting comfortable with physical components: buttons, LEDs, reading signals, that kind of thing. The Verilog side is for understanding digital logic more deeply — how basic building blocks like registers, counters, and memory actually work together. 

The processor is being made so I can learn in the most painful way possible how electronics work at the lowest level. 
> Because apparently suffering is good. 

SAP-1 — Simple as Possible Computer (reference): https://karenok.github.io/SAP-1-Computer/

---

## Structure

```
arduino/      Physical hardware experiments on Arduino
processor/    Verilog modules — digital logic experiments
```

---

## Processor (Verilog)

Built and simulated using [Digital](https://github.com/hneemann/Digital). The full schematic lives in `main.dig`.

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

### 1. The off-on device (completely useless)

**Description:**
A basic toggle device with a physical button and two LEDs (red and blue).

**Behavior:**
* When powered on, the red LED lights up.
* Pressing the button turns off the red LED and turns on the blue LED.
* Letting go of the button reverts the state.

**Circuit:** button on pin 9 (INPUT_PULLUP), blue LED on pin 2, red LED on pin 7.

> My ancestors waited for the moment this device was invented. And here we finally are.

https://github.com/user-attachments/assets/84a58edd-f701-44ae-ba21-e87acdc27f96

### 2. Button test

Sets a pin HIGH. That's it.

### 3. Read test

Reads a pin and prints the value to serial. Basic intro stuff.

### 4. Traffic control

**Description:**
A 3-state automatic traffic signal. Cycles green → yellow → red on a timer. Button interrupts and forces red immediately (pedestrian crossing).

**Behavior:**
* **Green** (state 0): green LED on for 5s, runs 2 cycles (10s total), then advances to yellow.
* **Yellow** (state 1): red + green LEDs on (mixing to yellow), buzzer beeps for 2s, then advances to red.
* **Red** (state 2): red LED on for 5s, runs 2 cycles (10s total), then loops back to green.
* Button press at any time: jumps directly to red with 500ms debounce.
* Button presses are checked mid-delay (`responsiveDelay`) so the signal is always interruptible.

**Circuit:** button on pin 9 (INPUT_PULLUP), red LED on pin 2, green LED on pin 3, blue LED on pin 4, buzzer on pin 7.
