# ⚒️ End-to-End Digital Design Flow of a 2’s Complement Mealy FSM: RTL Design, Verification, Synthesis & Gate-Level Simulation using Verilog

Tools used: 
Vivado Design Suite (for RTL design, synthesis, and netlist generation) & Vivado XSim for simulation

Process Flow:
- Make State Diagram & Truth Table
- Make logic Equation using K-Maps
- Write RTL Code in Verilog (Design)
- Write Testbench
- Run Simulation (Behavioural)
- Synthesis
- Export Gate-Level Netlist
- Gate-Level Simulation (including Functional & Timing Simulation)

# I. State Diagram and Logic Equations

<img width="3840" height="2160" alt="Image" src="https://github.com/user-attachments/assets/38dbde53-bad3-49c0-ab8a-7d0584093aef" />

Q & X are Present State & Input

Equations for Next State (D) & Output (Z) are:

D = Q OR X			

Z = Q XOR X

# II. RTL Code & Testbench
Both are present in the respective files.

Logic Implemented using the Derived Equations for D & Z in the RTL Code.

This testbench is designed to verify the functionality of an FSM implemented in the RTL design module. The simulation begins by asserting the reset signal for 30 ns. Following this, the clock is held low for 20 ns, resulting in a total reset duration of 50 ns. After reset is deasserted, the clock starts toggling with a period of 100 ns (toggling every 50 ns). The input to the FSM is a 6-bit pattern which is fed bit by bit from the least significant bit (LSB) to the most significant bit (MSB). 

Each bit is applied on the falling edge of the clock, and the FSM processes it on the following rising edge. The output is then compared against an expected 6-bit output pattern for validation. If the output matches the expected value, a confirmation message is displayed; otherwise, a mismatched message with the bit index and actual vs expected output is printed. The test completes after processing all bits.

	
# III. Behavioural Simulation 

Waveform for Behaviural Simulation:
<img width="1238" height="322" alt="Image" src="https://github.com/user-attachments/assets/a73887a6-46ef-4292-b8fa-0152621bad0b" />

Schematic (Behavioural):
<img width="1041" height="345" alt="Image" src="https://github.com/user-attachments/assets/8d7c9ab2-8535-495d-9a8d-eb773dd9be34" />

# IV. Synthesis 

Synthesized Schematic
<img width="1098" height="372" alt="Image" src="https://github.com/user-attachments/assets/825566d6-d80c-44c4-8f56-6b8b1ca5fb55" />

# V. Gate-Level Netlist
After verifying that the FSM worked correctly through RTL functional simulation, the design was synthesized in Vivado to generate a gate-level netlist, which represents the FSM's hardware implementation using logic gates and interconnections.

Next, a post-synthesis functional simulation was performed using this gate-level netlist. This simulation confirmed that the synthesized design maintained the same logical behavior as the RTL design, though without accounting for timing delays.

To validate the design under realistic timing conditions, a post-synthesis timing simulation was run. This simulation incorporated estimated gate and interconnect delays from the synthesis process. The results showed that the FSM's outputs matched the expected behavior, confirming that the design was not only functionally correct but also met the required timing constraints.

Output for Gate-Level Simulation (or Post-Synthesis Functional Simulation):
<img width="1268" height="338" alt="Image" src="https://github.com/user-attachments/assets/3bfeb7c6-9db6-4a84-85a4-f203d3611b83" />
Gate-Level Simulation had a delay of 0.1ns.


Output for Post-Synthesis Timing Simulation:
<img width="1178" height="303" alt="Image" src="https://github.com/user-attachments/assets/a8a70fa4-655f-43aa-840b-88cfe50b28ed" />
The Post-Synthesis Timing Simulation had a delay of 5.462ns.



# CONCLUSION
The FSM design meets the functional and timing requirements. The consistent output across functional and post-synthesis simulations confirms that the RTL logic is synthesizable and performs correctly under real-world conditions. The project successfully demonstrates the full design and verification flow of a sequential digital circuit.
