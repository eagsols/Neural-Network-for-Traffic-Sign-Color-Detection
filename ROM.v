module ROM_r (
    input  wire        CLK, RST,    // active-low RST
    input  wire [13:0] addr,
    output reg  [7:0]  data
);
    reg [7:0] mem [0:16383];
 
    initial $readmemh("sigmoid_14_bit.hex", mem);
 
    always @(posedge CLK or negedge RST)
        if (!RST) data <= 8'd0;
        else      data <= mem[addr];
endmodule