module mips_suma (
	input [3:0] addr,
	input clk,
	input buttonWrite,
	input buttonRst,
	output [31:0] out,A,B,instruc,
	output [4:0]adA,adB
	);
	
	//wire [31:0] instruc; // A, B;
	assign adA = instruc[25:21];
	assign adB = instruc[20:16];
	
	memoria_instrucciones mem_inst(.addr(addr), .outInstruc(instruc));
	banco_registros b_reg(
		.addrRa(instruc[25:21]), 
		.addrRb(instruc[20:16]), 
		.datOutRa(A), 
		.datOutRb(B), 
		.addrW(instruc[15:11]), 
		.datW(out), 
		.RegWrite(buttonWrite), 
		.clk(clk), 
		.rst(buttonRst)
	);
	alu32 alu1(
		.A(A),
		.B(B),   
		.Select(instruc[5:0]),
		.Sal(out)
	);
endmodule