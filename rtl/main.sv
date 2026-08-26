module test (
    input clk,
    input rst,
    input en,
    input load,
    input [15:0] load_value,
    output pc
);

    reg [15:0] pc_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_reg <= 16'b0;
        end else if (en) begin
            if (load) begin
                pc_reg <= load_value;
            end else begin
                pc_reg <= pc_reg + 1;
            end
        end
    end

endmodule
