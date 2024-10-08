//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_BUF(A, Y)
//-
//- A buffer. This cell type is always optimized away by the opt_clean pass.
//-
//- Truth table:    A | Y
//-                ---+---
//-                 0 | 0
//-                 1 | 1
//-
module BUF(A, Y);
input A;
output Y;
assign Y = A;
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_NOT(A, Y)
//-
//- An inverter gate.
//-
//- Truth table:    A | Y
//-                ---+---
//-                 0 | 1
//-                 1 | 0
//-
module NOT(A, Y);
input A;
output Y;
assign Y = ~A;
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_AND(A, B, Y)
//-
//- A 2-input AND gate.
//-
//- Truth table:    A B | Y
//-                -----+---
//-                 0 0 | 0
//-                 0 1 | 0
//-                 1 0 | 0
//-                 1 1 | 1
//-
module AND(A, B, Y);
input A, B;
output Y;
assign Y = A & B;
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_NAND(A, B, Y)
//-
//- A 2-input NAND gate.
//-
//- Truth table:    A B | Y
//-                -----+---
//-                 0 0 | 1
//-                 0 1 | 1
//-                 1 0 | 1
//-                 1 1 | 0
//-
module NAND(A, B, Y);
input A, B;
output Y;
assign Y = ~(A & B);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_OR(A, B, Y)
//-
//- A 2-input OR gate.
//-
//- Truth table:    A B | Y
//-                -----+---
//-                 0 0 | 0
//-                 0 1 | 1
//-                 1 0 | 1
//-                 1 1 | 1
//-
module OR(A, B, Y);
input A, B;
output Y;
assign Y = A | B;
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_NOR(A, B, Y)
//-
//- A 2-input NOR gate.
//-
//- Truth table:    A B | Y
//-                -----+---
//-                 0 0 | 1
//-                 0 1 | 0
//-                 1 0 | 0
//-                 1 1 | 0
//-
module NOR(A, B, Y);
input A, B;
output Y;
assign Y = ~(A | B);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_XOR(A, B, Y)
//-
//- A 2-input XOR gate.
//-
//- Truth table:    A B | Y
//-                -----+---
//-                 0 0 | 0
//-                 0 1 | 1
//-                 1 0 | 1
//-                 1 1 | 0
//-
module XOR(A, B, Y);
input A, B;
output Y;
assign Y = A ^ B;
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_XNOR(A, B, Y)
//-
//- A 2-input XNOR gate.
//-
//- Truth table:    A B | Y
//-                -----+---
//-                 0 0 | 1
//-                 0 1 | 0
//-                 1 0 | 0
//-                 1 1 | 1
//-
module XNOR(A, B, Y);
input A, B;
output Y;
assign Y = ~(A ^ B);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ANDNOT(A, B, Y)
//-
//- A 2-input AND-NOT gate.
//-
//- Truth table:    A B | Y
//-                -----+---
//-                 0 0 | 0
//-                 0 1 | 0
//-                 1 0 | 1
//-                 1 1 | 0
//-
module ANDNOT(A, B, Y);
input A, B;
output Y;
assign Y = A & (~B);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ORNOT(A, B, Y)
//-
//- A 2-input OR-NOT gate.
//-
//- Truth table:    A B | Y
//-                -----+---
//-                 0 0 | 1
//-                 0 1 | 0
//-                 1 0 | 1
//-                 1 1 | 1
//-
module ORNOT(A, B, Y);
input A, B;
output Y;
assign Y = A | (~B);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_MUX(A, B, S, Y)
//-
//- A 2-input MUX gate.
//-
//- Truth table:    A B S | Y
//-                -------+---
//-                 a - 0 | a
//-                 - b 1 | b
//-
module MUX(A, B, S, Y);
input A, B, S;
output Y;
assign Y = S ? B : A;
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_NMUX(A, B, S, Y)
//-
//- A 2-input inverting MUX gate.
//-
//- Truth table:    A B S | Y
//-                -------+---
//-                 0 - 0 | 1
//-                 1 - 0 | 0
//-                 - 0 1 | 1
//-                 - 1 1 | 0
//-
module NMUX(A, B, S, Y);
input A, B, S;
output Y;
assign Y = S ? !B : !A;
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_MUX4(A, B, C, D, S, T, Y)
//-
//- A 4-input MUX gate.
//-
//- Truth table:    A B C D S T | Y
//-                -------------+---
//-                 a - - - 0 0 | a
//-                 - b - - 1 0 | b
//-                 - - c - 0 1 | c
//-                 - - - d 1 1 | d
//-
module MUX4(A, B, C, D, S, T, Y);
input A, B, C, D, S, T;
output Y;
assign Y = T ? (S ? D : C) :
               (S ? B : A);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_MUX8(A, B, C, D, E, F, G, H, S, T, U, Y)
//-
//- An 8-input MUX gate.
//-
//- Truth table:    A B C D E F G H S T U | Y
//-                -----------------------+---
//-                 a - - - - - - - 0 0 0 | a
//-                 - b - - - - - - 1 0 0 | b
//-                 - - c - - - - - 0 1 0 | c
//-                 - - - d - - - - 1 1 0 | d
//-                 - - - - e - - - 0 0 1 | e
//-                 - - - - - f - - 1 0 1 | f
//-                 - - - - - - g - 0 1 1 | g
//-                 - - - - - - - h 1 1 1 | h
//-
module MUX8(A, B, C, D, E, F, G, H, S, T, U, Y);
input A, B, C, D, E, F, G, H, S, T, U;
output Y;
assign Y = U ? T ? (S ? H : G) :
                   (S ? F : E) :
               T ? (S ? D : C) :
                   (S ? B : A);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_MUX16(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, S, T, U, V, Y)
//-
//- A 16-input MUX gate.
//-
//- Truth table:    A B C D E F G H I J K L M N O P S T U V | Y
//-                -----------------------------------------+---
//-                 a - - - - - - - - - - - - - - - 0 0 0 0 | a
//-                 - b - - - - - - - - - - - - - - 1 0 0 0 | b
//-                 - - c - - - - - - - - - - - - - 0 1 0 0 | c
//-                 - - - d - - - - - - - - - - - - 1 1 0 0 | d
//-                 - - - - e - - - - - - - - - - - 0 0 1 0 | e
//-                 - - - - - f - - - - - - - - - - 1 0 1 0 | f
//-                 - - - - - - g - - - - - - - - - 0 1 1 0 | g
//-                 - - - - - - - h - - - - - - - - 1 1 1 0 | h
//-                 - - - - - - - - i - - - - - - - 0 0 0 1 | i
//-                 - - - - - - - - - j - - - - - - 1 0 0 1 | j
//-                 - - - - - - - - - - k - - - - - 0 1 0 1 | k
//-                 - - - - - - - - - - - l - - - - 1 1 0 1 | l
//-                 - - - - - - - - - - - - m - - - 0 0 1 1 | m
//-                 - - - - - - - - - - - - - n - - 1 0 1 1 | n
//-                 - - - - - - - - - - - - - - o - 0 1 1 1 | o
//-                 - - - - - - - - - - - - - - - p 1 1 1 1 | p
//-
module MUX16(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, S, T, U, V, Y);
input A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, S, T, U, V;
output Y;
assign Y = V ? U ? T ? (S ? P : O) :
                       (S ? N : M) :
                   T ? (S ? L : K) :
                       (S ? J : I) :
               U ? T ? (S ? H : G) :
                       (S ? F : E) :
                   T ? (S ? D : C) :
                       (S ? B : A);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_AOI3(A, B, C, Y)
//-
//- A 3-input And-Or-Invert gate.
//-
//- Truth table:    A B C | Y
//-                -------+---
//-                 0 0 0 | 1
//-                 0 0 1 | 0
//-                 0 1 0 | 1
//-                 0 1 1 | 0
//-                 1 0 0 | 1
//-                 1 0 1 | 0
//-                 1 1 0 | 0
//-                 1 1 1 | 0
//-
module AOI3(A, B, C, Y);
input A, B, C;
output Y;
assign Y = ~((A & B) | C);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_OAI3(A, B, C, Y)
//-
//- A 3-input Or-And-Invert gate.
//-
//- Truth table:    A B C | Y
//-                -------+---
//-                 0 0 0 | 1
//-                 0 0 1 | 1
//-                 0 1 0 | 1
//-                 0 1 1 | 0
//-                 1 0 0 | 1
//-                 1 0 1 | 0
//-                 1 1 0 | 1
//-                 1 1 1 | 0
//-
module OAI3(A, B, C, Y);
input A, B, C;
output Y;
assign Y = ~((A | B) & C);
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_AOI4(A, B, C, Y)
//-
//- A 4-input And-Or-Invert gate.
//-
//- Truth table:    A B C D | Y
//-                ---------+---
//-                 0 0 0 0 | 1
//-                 0 0 0 1 | 1
//-                 0 0 1 0 | 1
//-                 0 0 1 1 | 0
//-                 0 1 0 0 | 1
//-                 0 1 0 1 | 1
//-                 0 1 1 0 | 1
//-                 0 1 1 1 | 0
//-                 1 0 0 0 | 1
//-                 1 0 0 1 | 1
//-                 1 0 1 0 | 1
//-                 1 0 1 1 | 0
//-                 1 1 0 0 | 0
//-                 1 1 0 1 | 0
//-                 1 1 1 0 | 0
//-                 1 1 1 1 | 0
//-
module AOI4(A, B, C, D, Y);
input A, B, C, D;
output Y;
assign Y = ~((A & B) | (C & D));
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_OAI4(A, B, C, Y)
//-
//- A 4-input Or-And-Invert gate.
//-
//- Truth table:    A B C D | Y
//-                ---------+---
//-                 0 0 0 0 | 1
//-                 0 0 0 1 | 1
//-                 0 0 1 0 | 1
//-                 0 0 1 1 | 1
//-                 0 1 0 0 | 1
//-                 0 1 0 1 | 0
//-                 0 1 1 0 | 0
//-                 0 1 1 1 | 0
//-                 1 0 0 0 | 1
//-                 1 0 0 1 | 0
//-                 1 0 1 0 | 0
//-                 1 0 1 1 | 0
//-                 1 1 0 0 | 1
//-                 1 1 0 1 | 0
//-                 1 1 1 0 | 0
//-                 1 1 1 1 | 0
//-
module OAI4(A, B, C, D, Y);
input A, B, C, D;
output Y;
assign Y = ~((A | B) & (C | D));
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_TBUF(A, E, Y)
//-
//- A tri-state buffer.
//-
//- Truth table:    A E | Y
//-                -----+---
//-                 a 1 | a
//-                 - 0 | z
//-
module TBUF(A, E, Y);
input A, E;
output Y;
assign Y = E ? A : 1'bz;
endmodule

// NOTE: the following cell types are autogenerated.  DO NOT EDIT them manually,
// instead edit the templates in gen_ff_types.py and rerun it.

// START AUTOGENERATED CELL TYPES

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SR_NN(S, R, Q)
//-
//- A set-reset latch with negative polarity SET and negative polarity RESET.
//-
//- Truth table:    S R | Q
//-                -----+---
//-                 - 0 | 0
//-                 0 - | 1
//-                 - - | q
//-
module SR_NN(S, R, Q);
input S, R;
output reg Q;
always @* begin
	if (R == 0)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SR_NP(S, R, Q)
//-
//- A set-reset latch with negative polarity SET and positive polarity RESET.
//-
//- Truth table:    S R | Q
//-                -----+---
//-                 - 1 | 0
//-                 0 - | 1
//-                 - - | q
//-
module SR_NP(S, R, Q);
input S, R;
output reg Q;
always @* begin
	if (R == 1)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SR_PN(S, R, Q)
//-
//- A set-reset latch with positive polarity SET and negative polarity RESET.
//-
//- Truth table:    S R | Q
//-                -----+---
//-                 - 0 | 0
//-                 1 - | 1
//-                 - - | q
//-
module SR_PN(S, R, Q);
input S, R;
output reg Q;
always @* begin
	if (R == 0)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SR_PP(S, R, Q)
//-
//- A set-reset latch with positive polarity SET and positive polarity RESET.
//-
//- Truth table:    S R | Q
//-                -----+---
//-                 - 1 | 0
//-                 1 - | 1
//-                 - - | q
//-
module SR_PP(S, R, Q);
input S, R;
output reg Q;
always @* begin
	if (R == 1)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
end
endmodule

`ifdef SIMCELLS_FF
//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_FF(D, Q)
//-
//- A D-type flip-flop that is clocked from the implicit global clock. (This cell
//- type is usually only used in netlists for formal verification.)
//-
module FF(D, Q);
input D;
output reg Q;
always @($global_clock) begin
	Q <= D;
end
endmodule
`endif

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFF_N(D, C, Q)
//-
//- A negative edge D-type flip-flop.
//-
//- Truth table:    D C | Q
//-                -----+---
//-                 d \ | d
//-                 - - | q
//-
module DFF_N(D, C, Q);
input D, C;
output reg Q;
always @(negedge C) begin
	Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFF_P(D, C, Q)
//-
//- A positive edge D-type flip-flop.
//-
//- Truth table:    D C | Q
//-                -----+---
//-                 d / | d
//-                 - - | q
//-
module DFF_P(D, C, Q);
input D, C;
output reg Q;
always @(posedge C) begin
	Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NN(D, C, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity enable.
//-
//- Truth table:    D C E | Q
//-                -------+---
//-                 d \ 0 | d
//-                 - - - | q
//-
module DFFE_NN(D, C, E, Q);
input D, C, E;
output reg Q;
always @(negedge C) begin
	if (!E) Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NP(D, C, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity enable.
//-
//- Truth table:    D C E | Q
//-                -------+---
//-                 d \ 1 | d
//-                 - - - | q
//-
module DFFE_NP(D, C, E, Q);
input D, C, E;
output reg Q;
always @(negedge C) begin
	if (E) Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PN(D, C, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity enable.
//-
//- Truth table:    D C E | Q
//-                -------+---
//-                 d / 0 | d
//-                 - - - | q
//-
module DFFE_PN(D, C, E, Q);
input D, C, E;
output reg Q;
always @(posedge C) begin
	if (!E) Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PP(D, C, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity enable.
//-
//- Truth table:    D C E | Q
//-                -------+---
//-                 d / 1 | d
//-                 - - - | q
//-
module DFFE_PP(D, C, E, Q);
input D, C, E;
output reg Q;
always @(posedge C) begin
	if (E) Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFF_NN0(D, C, R, Q)
//-
//- A negative edge D-type flip-flop with negative polarity reset.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - - 0 | 0
//-                 d \ - | d
//-                 - - - | q
//-
module DFF_NN0(D, C, R, Q);
input D, C, R;
output reg Q;
always @(negedge C or negedge R) begin
	if (R == 0)
		Q <= 0;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFF_NN1(D, C, R, Q)
//-
//- A negative edge D-type flip-flop with negative polarity set.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - - 0 | 1
//-                 d \ - | d
//-                 - - - | q
//-
module DFF_NN1(D, C, R, Q);
input D, C, R;
output reg Q;
always @(negedge C or negedge R) begin
	if (R == 0)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFF_NP0(D, C, R, Q)
//-
//- A negative edge D-type flip-flop with positive polarity reset.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - - 1 | 0
//-                 d \ - | d
//-                 - - - | q
//-
module DFF_NP0(D, C, R, Q);
input D, C, R;
output reg Q;
always @(negedge C or posedge R) begin
	if (R == 1)
		Q <= 0;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFF_NP1(D, C, R, Q)
//-
//- A negative edge D-type flip-flop with positive polarity set.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - - 1 | 1
//-                 d \ - | d
//-                 - - - | q
//-
module DFF_NP1(D, C, R, Q);
input D, C, R;
output reg Q;
always @(negedge C or posedge R) begin
	if (R == 1)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     DFF_PN0 (D, C, R, Q)
//-
//- A positive edge D-type flip-flop with negative polarity reset.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - - 0 | 0
//-                 d / - | d
//-                 - - - | q
//-
module DFF_PN0 (D, C, R, Q);
input D, C, R;
output reg Q;
always @(posedge C or negedge R) begin
	if (R == 0)
		Q <= 0;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     DFF_PN1 (D, C, R, Q)
//-
//- A positive edge D-type flip-flop with negative polarity set.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - - 0 | 1
//-                 d / - | d
//-                 - - - | q
//-
module DFF_PN1(D, C, R, Q);
input D, C, R;
output reg Q;
always @(posedge C or negedge R) begin
	if (R == 0)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFF_PP0(D, C, R, Q)
//-
//- A positive edge D-type flip-flop with positive polarity reset.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - - 1 | 0
//-                 d / - | d
//-                 - - - | q
//-
module DFF_PP0(D, C, R, Q);
input D, C, R;
output reg Q;
always @(posedge C or posedge R) begin
	if (R == 1)
		Q <= 0;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFF_PP1(D, C, R, Q)
//-
//- A positive edge D-type flip-flop with positive polarity set.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - - 1 | 1
//-                 d / - | d
//-                 - - - | q
//-
module DFF_PP1(D, C, R, Q);
input D, C, R;
output reg Q;
always @(posedge C or posedge R) begin
	if (R == 1)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NN0N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity reset and negative
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module DFFE_NN0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C or negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NN0P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity reset and positive
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module DFFE_NN0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C or negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NN1N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity set and negative
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 0 - | 1
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module DFFE_NN1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C or negedge R) begin
	if (R == 0)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NN1P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity set and positive
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 0 - | 1
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module DFFE_NN1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C or negedge R) begin
	if (R == 0)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NP0N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity reset and negative
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module DFFE_NP0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C or posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NP0P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity reset and positive
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module DFFE_NP0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C or posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NP1N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity set and negative
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 1 - | 1
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module DFFE_NP1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C or posedge R) begin
	if (R == 1)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_NP1P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity set and positive
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 1 - | 1
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module DFFE_NP1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C or posedge R) begin
	if (R == 1)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PN0N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity reset and negative
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 d / - 0 | d
//-                 - - - - | q
//-
module DFFE_PN0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C or negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PN0P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity reset and positive
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 d / - 1 | d
//-                 - - - - | q
//-
module DFFE_PN0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C or negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PN1N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity set and negative
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 0 - | 1
//-                 d / - 0 | d
//-                 - - - - | q
//-
module DFFE_PN1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C or negedge R) begin
	if (R == 0)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PN1P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity set and positive
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 0 - | 1
//-                 d / - 1 | d
//-                 - - - - | q
//-
module DFFE_PN1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C or negedge R) begin
	if (R == 0)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PP0N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity reset and negative
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 d / - 0 | d
//-                 - - - - | q
//-
module DFFE_PP0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C or posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PP0P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity reset and positive
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 d / - 1 | d
//-                 - - - - | q
//-
module DFFE_PP0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C or posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PP1N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity set and negative
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 1 - | 1
//-                 d / - 0 | d
//-                 - - - - | q
//-
module DFFE_PP1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C or posedge R) begin
	if (R == 1)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFE_PP1P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity set and positive
//- polarity clock enable.
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - - 1 - | 1
//-                 d / - 1 | d
//-                 - - - - | q
//-
module DFFE_PP1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C or posedge R) begin
	if (R == 1)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFF_NN(D, C, L, AD, Q)
//-
//- A negative edge D-type flip-flop with negative polarity async load.
//-
//- Truth table:    D C L AD | Q
//-                ----------+---
//-                 - - 0 a  | a
//-                 d \ - -  | d
//-                 - - - -  | q
//-
module ALDFF_NN(D, C, L, AD, Q);
input D, C, L, AD;
output reg Q;
always @(negedge C or negedge L) begin
	if (L == 0)
		Q <= AD;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFF_NP(D, C, L, AD, Q)
//-
//- A negative edge D-type flip-flop with positive polarity async load.
//-
//- Truth table:    D C L AD | Q
//-                ----------+---
//-                 - - 1 a  | a
//-                 d \ - -  | d
//-                 - - - -  | q
//-
module ALDFF_NP(D, C, L, AD, Q);
input D, C, L, AD;
output reg Q;
always @(negedge C or posedge L) begin
	if (L == 1)
		Q <= AD;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFF_PN(D, C, L, AD, Q)
//-
//- A positive edge D-type flip-flop with negative polarity async load.
//-
//- Truth table:    D C L AD | Q
//-                ----------+---
//-                 - - 0 a  | a
//-                 d / - -  | d
//-                 - - - -  | q
//-
module ALDFF_PN(D, C, L, AD, Q);
input D, C, L, AD;
output reg Q;
always @(posedge C or negedge L) begin
	if (L == 0)
		Q <= AD;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFF_PP(D, C, L, AD, Q)
//-
//- A positive edge D-type flip-flop with positive polarity async load.
//-
//- Truth table:    D C L AD | Q
//-                ----------+---
//-                 - - 1 a  | a
//-                 d / - -  | d
//-                 - - - -  | q
//-
module ALDFF_PP(D, C, L, AD, Q);
input D, C, L, AD;
output reg Q;
always @(posedge C or posedge L) begin
	if (L == 1)
		Q <= AD;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFFE_NNN(D, C, L, AD, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity async load and negative
//- polarity clock enable.
//-
//- Truth table:    D C L AD E | Q
//-                ------------+---
//-                 - - 0 a  - | a
//-                 d \ - -  0 | d
//-                 - - - -  - | q
//-
module ALDFFE_NNN(D, C, L, AD, E, Q);
input D, C, L, AD, E;
output reg Q;
always @(negedge C or negedge L) begin
	if (L == 0)
		Q <= AD;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFFE_NNP(D, C, L, AD, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity async load and positive
//- polarity clock enable.
//-
//- Truth table:    D C L AD E | Q
//-                ------------+---
//-                 - - 0 a  - | a
//-                 d \ - -  1 | d
//-                 - - - -  - | q
//-
module ALDFFE_NNP(D, C, L, AD, E, Q);
input D, C, L, AD, E;
output reg Q;
always @(negedge C or negedge L) begin
	if (L == 0)
		Q <= AD;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFFE_NPN(D, C, L, AD, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity async load and negative
//- polarity clock enable.
//-
//- Truth table:    D C L AD E | Q
//-                ------------+---
//-                 - - 1 a  - | a
//-                 d \ - -  0 | d
//-                 - - - -  - | q
//-
module ALDFFE_NPN(D, C, L, AD, E, Q);
input D, C, L, AD, E;
output reg Q;
always @(negedge C or posedge L) begin
	if (L == 1)
		Q <= AD;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFFE_NPP(D, C, L, AD, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity async load and positive
//- polarity clock enable.
//-
//- Truth table:    D C L AD E | Q
//-                ------------+---
//-                 - - 1 a  - | a
//-                 d \ - -  1 | d
//-                 - - - -  - | q
//-
module ALDFFE_NPP(D, C, L, AD, E, Q);
input D, C, L, AD, E;
output reg Q;
always @(negedge C or posedge L) begin
	if (L == 1)
		Q <= AD;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFFE_PNN(D, C, L, AD, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity async load and negative
//- polarity clock enable.
//-
//- Truth table:    D C L AD E | Q
//-                ------------+---
//-                 - - 0 a  - | a
//-                 d / - -  0 | d
//-                 - - - -  - | q
//-
module ALDFFE_PNN(D, C, L, AD, E, Q);
input D, C, L, AD, E;
output reg Q;
always @(posedge C or negedge L) begin
	if (L == 0)
		Q <= AD;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFFE_PNP(D, C, L, AD, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity async load and positive
//- polarity clock enable.
//-
//- Truth table:    D C L AD E | Q
//-                ------------+---
//-                 - - 0 a  - | a
//-                 d / - -  1 | d
//-                 - - - -  - | q
//-
module ALDFFE_PNP(D, C, L, AD, E, Q);
input D, C, L, AD, E;
output reg Q;
always @(posedge C or negedge L) begin
	if (L == 0)
		Q <= AD;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFFE_PPN(D, C, L, AD, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity async load and negative
//- polarity clock enable.
//-
//- Truth table:    D C L AD E | Q
//-                ------------+---
//-                 - - 1 a  - | a
//-                 d / - -  0 | d
//-                 - - - -  - | q
//-
module ALDFFE_PPN(D, C, L, AD, E, Q);
input D, C, L, AD, E;
output reg Q;
always @(posedge C or posedge L) begin
	if (L == 1)
		Q <= AD;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_ALDFFE_PPP(D, C, L, AD, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity async load and positive
//- polarity clock enable.
//-
//- Truth table:    D C L AD E | Q
//-                ------------+---
//-                 - - 1 a  - | a
//-                 d / - -  1 | d
//-                 - - - -  - | q
//-
module ALDFFE_PPP(D, C, L, AD, E, Q);
input D, C, L, AD, E;
output reg Q;
always @(posedge C or posedge L) begin
	if (L == 1)
		Q <= AD;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSR_NNN(C, S, R, D, Q)
//-
//- A negative edge D-type flip-flop with negative polarity set and negative
//- polarity reset.
//-
//- Truth table:    C S R D | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 - 0 - - | 1
//-                 \ - - d | d
//-                 - - - - | q
//-
module DFFSR_NNN(C, S, R, D, Q);
input C, S, R, D;
output reg Q;
always @(negedge C, negedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSR_NNP(C, S, R, D, Q)
//-
//- A negative edge D-type flip-flop with negative polarity set and positive
//- polarity reset.
//-
//- Truth table:    C S R D | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 - 0 - - | 1
//-                 \ - - d | d
//-                 - - - - | q
//-
module DFFSR_NNP(C, S, R, D, Q);
input C, S, R, D;
output reg Q;
always @(negedge C, negedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSR_NPN(C, S, R, D, Q)
//-
//- A negative edge D-type flip-flop with positive polarity set and negative
//- polarity reset.
//-
//- Truth table:    C S R D | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 - 1 - - | 1
//-                 \ - - d | d
//-                 - - - - | q
//-
module DFFSR_NPN(C, S, R, D, Q);
input C, S, R, D;
output reg Q;
always @(negedge C, posedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSR_NPP(C, S, R, D, Q)
//-
//- A negative edge D-type flip-flop with positive polarity set and positive
//- polarity reset.
//-
//- Truth table:    C S R D | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 - 1 - - | 1
//-                 \ - - d | d
//-                 - - - - | q
//-
module DFFSR_NPP(C, S, R, D, Q);
input C, S, R, D;
output reg Q;
always @(negedge C, posedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSR_PNN(C, S, R, D, Q)
//-
//- A positive edge D-type flip-flop with negative polarity set and negative
//- polarity reset.
//-
//- Truth table:    C S R D | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 - 0 - - | 1
//-                 / - - d | d
//-                 - - - - | q
//-
module DFFSR_PNN(C, S, R, D, Q);
input C, S, R, D;
output reg Q;
always @(posedge C, negedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSR_PNP(C, S, R, D, Q)
//-
//- A positive edge D-type flip-flop with negative polarity set and positive
//- polarity reset.
//-
//- Truth table:    C S R D | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 - 0 - - | 1
//-                 / - - d | d
//-                 - - - - | q
//-
module DFFSR_PNP(C, S, R, D, Q);
input C, S, R, D;
output reg Q;
always @(posedge C, negedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSR_PPN(C, S, R, D, Q)
//-
//- A positive edge D-type flip-flop with positive polarity set and negative
//- polarity reset.
//-
//- Truth table:    C S R D | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 - 1 - - | 1
//-                 / - - d | d
//-                 - - - - | q
//-
module DFFSR_PPN(C, S, R, D, Q);
input C, S, R, D;
output reg Q;
always @(posedge C, posedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSR_PPP(C, S, R, D, Q)
//-
//- A positive edge D-type flip-flop with positive polarity set and positive
//- polarity reset.
//-
//- Truth table:    C S R D | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 - 1 - - | 1
//-                 / - - d | d
//-                 - - - - | q
//-
module DFFSR_PPP(C, S, R, D, Q);
input C, S, R, D;
output reg Q;
always @(posedge C, posedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_NNNN(C, S, R, E, D, Q)
//-
//- A negative edge D-type flip-flop with negative polarity set, negative
//- polarity reset and negative polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 0 - - | 0
//-                 - 0 - - - | 1
//-                 \ - - 0 d | d
//-                 - - - - - | q
//-
module DFFSRE_NNNN(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(negedge C, negedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
        else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_NNNP(C, S, R, E, D, Q)
//-
//- A negative edge D-type flip-flop with negative polarity set, negative
//- polarity reset and positive polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 0 - - | 0
//-                 - 0 - - - | 1
//-                 \ - - 1 d | d
//-                 - - - - - | q
//-
module DFFSRE_NNNP(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(negedge C, negedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
        else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_NNPN(C, S, R, E, D, Q)
//-
//- A negative edge D-type flip-flop with negative polarity set, positive
//- polarity reset and negative polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 1 - - | 0
//-                 - 0 - - - | 1
//-                 \ - - 0 d | d
//-                 - - - - - | q
//-
module DFFSRE_NNPN(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(negedge C, negedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
        else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_NNPP(C, S, R, E, D, Q)
//-
//- A negative edge D-type flip-flop with negative polarity set, positive
//- polarity reset and positive polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 1 - - | 0
//-                 - 0 - - - | 1
//-                 \ - - 1 d | d
//-                 - - - - - | q
//-
module DFFSRE_NNPP(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(negedge C, negedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
        else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_NPNN(C, S, R, E, D, Q)
//-
//- A negative edge D-type flip-flop with positive polarity set, negative
//- polarity reset and negative polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 0 - - | 0
//-                 - 1 - - - | 1
//-                 \ - - 0 d | d
//-                 - - - - - | q
//-
module DFFSRE_NPNN(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(negedge C, posedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
        else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_NPNP(C, S, R, E, D, Q)
//-
//- A negative edge D-type flip-flop with positive polarity set, negative
//- polarity reset and positive polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 0 - - | 0
//-                 - 1 - - - | 1
//-                 \ - - 1 d | d
//-                 - - - - - | q
//-
module DFFSRE_NPNP(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(negedge C, posedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
        else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_NPPN(C, S, R, E, D, Q)
//-
//- A negative edge D-type flip-flop with positive polarity set, positive
//- polarity reset and negative polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 1 - - | 0
//-                 - 1 - - - | 1
//-                 \ - - 0 d | d
//-                 - - - - - | q
//-
module DFFSRE_NPPN(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(negedge C, posedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
        else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_NPPP(C, S, R, E, D, Q)
//-
//- A negative edge D-type flip-flop with positive polarity set, positive
//- polarity reset and positive polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 1 - - | 0
//-                 - 1 - - - | 1
//-                 \ - - 1 d | d
//-                 - - - - - | q
//-
module DFFSRE_NPPP(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(negedge C, posedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
        else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_PNNN(C, S, R, E, D, Q)
//-
//- A positive edge D-type flip-flop with negative polarity set, negative
//- polarity reset and negative polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 0 - - | 0
//-                 - 0 - - - | 1
//-                 / - - 0 d | d
//-                 - - - - - | q
//-
module DFFSRE_PNNN(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(posedge C, negedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
        else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_PNNP(C, S, R, E, D, Q)
//-
//- A positive edge D-type flip-flop with negative polarity set, negative
//- polarity reset and positive polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 0 - - | 0
//-                 - 0 - - - | 1
//-                 / - - 1 d | d
//-                 - - - - - | q
//-
module DFFSRE_PNNP(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(posedge C, negedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
        else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_PNPN(C, S, R, E, D, Q)
//-
//- A positive edge D-type flip-flop with negative polarity set, positive
//- polarity reset and negative polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 1 - - | 0
//-                 - 0 - - - | 1
//-                 / - - 0 d | d
//-                 - - - - - | q
//-
module DFFSRE_PNPN(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(posedge C, negedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
        else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_PNPP(C, S, R, E, D, Q)
//-
//- A positive edge D-type flip-flop with negative polarity set, positive
//- polarity reset and positive polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 1 - - | 0
//-                 - 0 - - - | 1
//-                 / - - 1 d | d
//-                 - - - - - | q
//-
module DFFSRE_PNPP(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(posedge C, negedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
        else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_PPNN(C, S, R, E, D, Q)
//-
//- A positive edge D-type flip-flop with positive polarity set, negative
//- polarity reset and negative polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 0 - - | 0
//-                 - 1 - - - | 1
//-                 / - - 0 d | d
//-                 - - - - - | q
//-
module DFFSRE_PPNN(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(posedge C, posedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
        else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_PPNP(C, S, R, E, D, Q)
//-
//- A positive edge D-type flip-flop with positive polarity set, negative
//- polarity reset and positive polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 0 - - | 0
//-                 - 1 - - - | 1
//-                 / - - 1 d | d
//-                 - - - - - | q
//-
module DFFSRE_PPNP(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(posedge C, posedge S, negedge R) begin
	if (R == 0)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
        else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_PPPN(C, S, R, E, D, Q)
//-
//- A positive edge D-type flip-flop with positive polarity set, positive
//- polarity reset and negative polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 1 - - | 0
//-                 - 1 - - - | 1
//-                 / - - 0 d | d
//-                 - - - - - | q
//-
module DFFSRE_PPPN(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(posedge C, posedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
        else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DFFSRE_PPPP(C, S, R, E, D, Q)
//-
//- A positive edge D-type flip-flop with positive polarity set, positive
//- polarity reset and positive polarity clock enable.
//-
//- Truth table:    C S R E D | Q
//-                -----------+---
//-                 - - 1 - - | 0
//-                 - 1 - - - | 1
//-                 / - - 1 d | d
//-                 - - - - - | q
//-
module DFFSRE_PPPP(C, S, R, E, D, Q);
input C, S, R, E, D;
output reg Q;
always @(posedge C, posedge S, posedge R) begin
	if (R == 1)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
        else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFF_NN0(D, C, R, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous reset.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - \ 0 | 0
//-                 d \ - | d
//-                 - - - | q
//-
module SDFF_NN0(D, C, R, Q);
input D, C, R;
output reg Q;
always @(negedge C) begin
	if (R == 0)
		Q <= 0;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFF_NN1(D, C, R, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous set.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - \ 0 | 1
//-                 d \ - | d
//-                 - - - | q
//-
module SDFF_NN1(D, C, R, Q);
input D, C, R;
output reg Q;
always @(negedge C) begin
	if (R == 0)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFF_NP0(D, C, R, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous reset.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - \ 1 | 0
//-                 d \ - | d
//-                 - - - | q
//-
module SDFF_NP0(D, C, R, Q);
input D, C, R;
output reg Q;
always @(negedge C) begin
	if (R == 1)
		Q <= 0;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFF_NP1(D, C, R, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous set.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - \ 1 | 1
//-                 d \ - | d
//-                 - - - | q
//-
module SDFF_NP1(D, C, R, Q);
input D, C, R;
output reg Q;
always @(negedge C) begin
	if (R == 1)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFF_PN0(D, C, R, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous reset.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - / 0 | 0
//-                 d / - | d
//-                 - - - | q
//-
module SDFF_PN0(D, C, R, Q);
input D, C, R;
output reg Q;
always @(posedge C) begin
	if (R == 0)
		Q <= 0;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFF_PN1(D, C, R, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous set.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - / 0 | 1
//-                 d / - | d
//-                 - - - | q
//-
module SDFF_PN1(D, C, R, Q);
input D, C, R;
output reg Q;
always @(posedge C) begin
	if (R == 0)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFF_PP0(D, C, R, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous reset.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - / 1 | 0
//-                 d / - | d
//-                 - - - | q
//-
module SDFF_PP0(D, C, R, Q);
input D, C, R;
output reg Q;
always @(posedge C) begin
	if (R == 1)
		Q <= 0;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFF_PP1(D, C, R, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous set.
//-
//- Truth table:    D C R | Q
//-                -------+---
//-                 - / 1 | 1
//-                 d / - | d
//-                 - - - | q
//-
module SDFF_PP1(D, C, R, Q);
input D, C, R;
output reg Q;
always @(posedge C) begin
	if (R == 1)
		Q <= 1;
	else
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_NN0N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous reset and negative
//- polarity clock enable (with reset having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 0 - | 0
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module SDFFE_NN0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (R == 0)
		Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_NN0P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous reset and positive
//- polarity clock enable (with reset having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 0 - | 0
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module SDFFE_NN0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (R == 0)
		Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_NN1N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous set and negative
//- polarity clock enable (with set having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 0 - | 1
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module SDFFE_NN1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (R == 0)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_NN1P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous set and positive
//- polarity clock enable (with set having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 0 - | 1
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module SDFFE_NN1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (R == 0)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_NP0N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous reset and negative
//- polarity clock enable (with reset having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 1 - | 0
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module SDFFE_NP0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (R == 1)
		Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_NP0P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous reset and positive
//- polarity clock enable (with reset having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 1 - | 0
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module SDFFE_NP0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (R == 1)
		Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_NP1N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous set and negative
//- polarity clock enable (with set having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 1 - | 1
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module SDFFE_NP1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (R == 1)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_NP1P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous set and positive
//- polarity clock enable (with set having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 1 - | 1
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module SDFFE_NP1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (R == 1)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_PN0N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous reset and negative
//- polarity clock enable (with reset having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 0 - | 0
//-                 d / - 0 | d
//-                 - - - - | q
//-
module SDFFE_PN0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (R == 0)
		Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_PN0P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous reset and positive
//- polarity clock enable (with reset having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 0 - | 0
//-                 d / - 1 | d
//-                 - - - - | q
//-
module SDFFE_PN0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (R == 0)
		Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_PN1N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous set and negative
//- polarity clock enable (with set having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 0 - | 1
//-                 d / - 0 | d
//-                 - - - - | q
//-
module SDFFE_PN1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (R == 0)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_PN1P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous set and positive
//- polarity clock enable (with set having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 0 - | 1
//-                 d / - 1 | d
//-                 - - - - | q
//-
module SDFFE_PN1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (R == 0)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_PP0N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous reset and negative
//- polarity clock enable (with reset having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 1 - | 0
//-                 d / - 0 | d
//-                 - - - - | q
//-
module SDFFE_PP0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (R == 1)
		Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_PP0P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous reset and positive
//- polarity clock enable (with reset having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 1 - | 0
//-                 d / - 1 | d
//-                 - - - - | q
//-
module SDFFE_PP0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (R == 1)
		Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_PP1N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous set and negative
//- polarity clock enable (with set having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 1 - | 1
//-                 d / - 0 | d
//-                 - - - - | q
//-
module SDFFE_PP1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (R == 1)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFE_PP1P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous set and positive
//- polarity clock enable (with set having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 1 - | 1
//-                 d / - 1 | d
//-                 - - - - | q
//-
module SDFFE_PP1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (R == 1)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_NN0N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous reset and negative
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 0 0 | 0
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module SDFFCE_NN0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (E == 0) begin
		if (R == 0)
			Q <= 0;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_NN0P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous reset and positive
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 0 1 | 0
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module SDFFCE_NN0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (E == 1) begin
		if (R == 0)
			Q <= 0;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_NN1N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous set and negative
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 0 0 | 1
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module SDFFCE_NN1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (E == 0) begin
		if (R == 0)
			Q <= 1;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_NN1P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with negative polarity synchronous set and positive
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 0 1 | 1
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module SDFFCE_NN1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (E == 1) begin
		if (R == 0)
			Q <= 1;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_NP0N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous reset and negative
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 1 0 | 0
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module SDFFCE_NP0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (E == 0) begin
		if (R == 1)
			Q <= 0;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_NP0P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous reset and positive
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 1 1 | 0
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module SDFFCE_NP0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (E == 1) begin
		if (R == 1)
			Q <= 0;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_NP1N(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous set and negative
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 1 0 | 1
//-                 d \ - 0 | d
//-                 - - - - | q
//-
module SDFFCE_NP1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (E == 0) begin
		if (R == 1)
			Q <= 1;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_NP1P(D, C, R, E, Q)
//-
//- A negative edge D-type flip-flop with positive polarity synchronous set and positive
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - \ 1 1 | 1
//-                 d \ - 1 | d
//-                 - - - - | q
//-
module SDFFCE_NP1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(negedge C) begin
	if (E == 1) begin
		if (R == 1)
			Q <= 1;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_PN0N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous reset and negative
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 0 0 | 0
//-                 d / - 0 | d
//-                 - - - - | q
//-
module SDFFCE_PN0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (E == 0) begin
		if (R == 0)
			Q <= 0;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_PN0P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous reset and positive
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 0 1 | 0
//-                 d / - 1 | d
//-                 - - - - | q
//-
module SDFFCE_PN0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (E == 1) begin
		if (R == 0)
			Q <= 0;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_PN1N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous set and negative
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 0 0 | 1
//-                 d / - 0 | d
//-                 - - - - | q
//-
module SDFFCE_PN1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (E == 0) begin
		if (R == 0)
			Q <= 1;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_PN1P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with negative polarity synchronous set and positive
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 0 1 | 1
//-                 d / - 1 | d
//-                 - - - - | q
//-
module SDFFCE_PN1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (E == 1) begin
		if (R == 0)
			Q <= 1;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_PP0N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous reset and negative
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 1 0 | 0
//-                 d / - 0 | d
//-                 - - - - | q
//-
module SDFFCE_PP0N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (E == 0) begin
		if (R == 1)
			Q <= 0;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_PP0P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous reset and positive
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 1 1 | 0
//-                 d / - 1 | d
//-                 - - - - | q
//-
module SDFFCE_PP0P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (E == 1) begin
		if (R == 1)
			Q <= 0;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_PP1N(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous set and negative
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 1 0 | 1
//-                 d / - 0 | d
//-                 - - - - | q
//-
module SDFFCE_PP1N(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (E == 0) begin
		if (R == 1)
			Q <= 1;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_SDFFCE_PP1P(D, C, R, E, Q)
//-
//- A positive edge D-type flip-flop with positive polarity synchronous set and positive
//- polarity clock enable (with clock enable having priority).
//-
//- Truth table:    D C R E | Q
//-                ---------+---
//-                 - / 1 1 | 1
//-                 d / - 1 | d
//-                 - - - - | q
//-
module SDFFCE_PP1P(D, C, R, E, Q);
input D, C, R, E;
output reg Q;
always @(posedge C) begin
	if (E == 1) begin
		if (R == 1)
			Q <= 1;
		else
			Q <= D;
	end
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_N(E, D, Q)
//-
//- A negative enable D-type latch.
//-
//- Truth table:    E D | Q
//-                -----+---
//-                 0 d | d
//-                 - - | q
//-
module DLATCH_N(E, D, Q);
input E, D;
output reg Q;
always @* begin
	if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_P(E, D, Q)
//-
//- A positive enable D-type latch.
//-
//- Truth table:    E D | Q
//-                -----+---
//-                 1 d | d
//-                 - - | q
//-
module DLATCH_P(E, D, Q);
input E, D;
output reg Q;
always @* begin
	if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_NN0(E, R, D, Q)
//-
//- A negative enable D-type latch with negative polarity reset.
//-
//- Truth table:    E R D | Q
//-                -------+---
//-                 - 0 - | 0
//-                 0 - d | d
//-                 - - - | q
//-
module DLATCH_NN0(E, R, D, Q);
input E, R, D;
output reg Q;
always @* begin
	if (R == 0)
                Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_NN1(E, R, D, Q)
//-
//- A negative enable D-type latch with negative polarity set.
//-
//- Truth table:    E R D | Q
//-                -------+---
//-                 - 0 - | 1
//-                 0 - d | d
//-                 - - - | q
//-
module DLATCH_NN1(E, R, D, Q);
input E, R, D;
output reg Q;
always @* begin
	if (R == 0)
                Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_NP0(E, R, D, Q)
//-
//- A negative enable D-type latch with positive polarity reset.
//-
//- Truth table:    E R D | Q
//-                -------+---
//-                 - 1 - | 0
//-                 0 - d | d
//-                 - - - | q
//-
module DLATCH_NP0(E, R, D, Q);
input E, R, D;
output reg Q;
always @* begin
	if (R == 1)
                Q <= 0;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_NP1(E, R, D, Q)
//-
//- A negative enable D-type latch with positive polarity set.
//-
//- Truth table:    E R D | Q
//-                -------+---
//-                 - 1 - | 1
//-                 0 - d | d
//-                 - - - | q
//-
module DLATCH_NP1(E, R, D, Q);
input E, R, D;
output reg Q;
always @* begin
	if (R == 1)
                Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_PN0(E, R, D, Q)
//-
//- A positive enable D-type latch with negative polarity reset.
//-
//- Truth table:    E R D | Q
//-                -------+---
//-                 - 0 - | 0
//-                 1 - d | d
//-                 - - - | q
//-
module DLATCH_PN0(E, R, D, Q);
input E, R, D;
output reg Q;
always @* begin
	if (R == 0)
                Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_PN1(E, R, D, Q)
//-
//- A positive enable D-type latch with negative polarity set.
//-
//- Truth table:    E R D | Q
//-                -------+---
//-                 - 0 - | 1
//-                 1 - d | d
//-                 - - - | q
//-
module DLATCH_PN1(E, R, D, Q);
input E, R, D;
output reg Q;
always @* begin
	if (R == 0)
                Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_PP0(E, R, D, Q)
//-
//- A positive enable D-type latch with positive polarity reset.
//-
//- Truth table:    E R D | Q
//-                -------+---
//-                 - 1 - | 0
//-                 1 - d | d
//-                 - - - | q
//-
module DLATCH_PP0(E, R, D, Q);
input E, R, D;
output reg Q;
always @* begin
	if (R == 1)
                Q <= 0;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCH_PP1(E, R, D, Q)
//-
//- A positive enable D-type latch with positive polarity set.
//-
//- Truth table:    E R D | Q
//-                -------+---
//-                 - 1 - | 1
//-                 1 - d | d
//-                 - - - | q
//-
module DLATCH_PP1(E, R, D, Q);
input E, R, D;
output reg Q;
always @* begin
	if (R == 1)
                Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCHSR_NNN(E, S, R, D, Q)
//-
//- A negative enable D-type latch with negative polarity set and negative
//- polarity reset.
//-
//- Truth table:    E S R D | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 - 0 - - | 1
//-                 0 - - d | d
//-                 - - - - | q
//-
module DLATCHSR_NNN(E, S, R, D, Q);
input E, S, R, D;
output reg Q;
always @* begin
	if (R == 0)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCHSR_NNP(E, S, R, D, Q)
//-
//- A negative enable D-type latch with negative polarity set and positive
//- polarity reset.
//-
//- Truth table:    E S R D | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 - 0 - - | 1
//-                 0 - - d | d
//-                 - - - - | q
//-
module DLATCHSR_NNP(E, S, R, D, Q);
input E, S, R, D;
output reg Q;
always @* begin
	if (R == 1)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCHSR_NPN(E, S, R, D, Q)
//-
//- A negative enable D-type latch with positive polarity set and negative
//- polarity reset.
//-
//- Truth table:    E S R D | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 - 1 - - | 1
//-                 0 - - d | d
//-                 - - - - | q
//-
module DLATCHSR_NPN(E, S, R, D, Q);
input E, S, R, D;
output reg Q;
always @* begin
	if (R == 0)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCHSR_NPP(E, S, R, D, Q)
//-
//- A negative enable D-type latch with positive polarity set and positive
//- polarity reset.
//-
//- Truth table:    E S R D | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 - 1 - - | 1
//-                 0 - - d | d
//-                 - - - - | q
//-
module DLATCHSR_NPP(E, S, R, D, Q);
input E, S, R, D;
output reg Q;
always @* begin
	if (R == 1)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
	else if (E == 0)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCHSR_PNN(E, S, R, D, Q)
//-
//- A positive enable D-type latch with negative polarity set and negative
//- polarity reset.
//-
//- Truth table:    E S R D | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 - 0 - - | 1
//-                 1 - - d | d
//-                 - - - - | q
//-
module DLATCHSR_PNN(E, S, R, D, Q);
input E, S, R, D;
output reg Q;
always @* begin
	if (R == 0)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCHSR_PNP(E, S, R, D, Q)
//-
//- A positive enable D-type latch with negative polarity set and positive
//- polarity reset.
//-
//- Truth table:    E S R D | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 - 0 - - | 1
//-                 1 - - d | d
//-                 - - - - | q
//-
module DLATCHSR_PNP(E, S, R, D, Q);
input E, S, R, D;
output reg Q;
always @* begin
	if (R == 1)
		Q <= 0;
	else if (S == 0)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCHSR_PPN(E, S, R, D, Q)
//-
//- A positive enable D-type latch with positive polarity set and negative
//- polarity reset.
//-
//- Truth table:    E S R D | Q
//-                ---------+---
//-                 - - 0 - | 0
//-                 - 1 - - | 1
//-                 1 - - d | d
//-                 - - - - | q
//-
module DLATCHSR_PPN(E, S, R, D, Q);
input E, S, R, D;
output reg Q;
always @* begin
	if (R == 0)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $_DLATCHSR_PPP(E, S, R, D, Q)
//-
//- A positive enable D-type latch with positive polarity set and positive
//- polarity reset.
//-
//- Truth table:    E S R D | Q
//-                ---------+---
//-                 - - 1 - | 0
//-                 - 1 - - | 1
//-                 1 - - d | d
//-                 - - - - | q
//-
module DLATCHSR_PPP(E, S, R, D, Q);
input E, S, R, D;
output reg Q;
always @* begin
	if (R == 1)
		Q <= 0;
	else if (S == 1)
		Q <= 1;
	else if (E == 1)
		Q <= D;
end
endmodule
