module memoria_instrucciones #(      		 //   #( Parametros
	parameter BIT_ADDR = 32,  //   BIT_ADDR Número de bit para la dirección
	parameter BIT_DATO = 32,  //  BIT_DATO  Número de bit para el dato
	parameter   RegFILE= "Reg16.mem")
	(
    input [BIT_ADDR-1:0] addr,
	 
    output [BIT_DATO-1:0] outInstruc,
    
    input clk,
    input rst
    );

	// La cantidad de registros es igual a: 
	localparam NREG = 2 ** BIT_ADDR;
	  
	//configiración del banco de registro 
	reg [BIT_DATO-1: 0] breg [NREG-1:0];

	assign outInstruc = breg[addr];

	initial begin
		$readmemh(RegFILE, breg);
	end

endmodule