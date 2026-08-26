`timescale 1ns / 1ps

module test_tb ();

    logic clk;
    logic rst;
    logic en;
    logic load;
    logic [15:0] load_value;
    logic [15:0] pc;

    test dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .load(load),
        .load_value(load_value),
        .pc(pc)
    );

    always begin
        clk = 0;
        #5 clk = ~clk;
    end


    initial begin
        // Initialize signals
        rst = 1;
        en = 0;
        load = 0;
        load_value = 16'h0000;

        // Wait for a few clock cycles
        #10;
        rst = 0;

        // Test case 1: Enable counting
        en  = 1;
        #20;  // Wait for a few clock cycles

        // Test case 2: Load a value
        load = 1;
        load_value = 16'h1234;
        #10;  // Wait for a clock cycle
        load = 0;

        // Test case 3: Continue counting
        #20;  // Wait for a few clock cycles

        // Finish simulation
        $finish;
    end

endmodule
