`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 10:50:34 PM
// Design Name: 
// Module Name: display_led
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display_led
    (
        input logic clk, reset,
        input logic top,
        input logic[7:0] disp_0, disp_1, disp_2, disp_3,
        output logic[7:0] an, sseg
    );
   
    localparam N = 100;
    localparam TOP_SQUARE = 7'b0011100;
    localparam BOTTOM_SQUARE = 7'b0100011;
    logic[7:0] disp0_reg, disp1_reg, disp2_reg, disp3_reg;
    logic[7:0] disp0_next, disp1_next, disp2_next, disp3_next;
    logic[N - 1:0] count_reg, count_next;
    
    always_ff @(posedge clk) begin
        if(reset) begin
            count_reg <= 0;
            disp0_reg <= 0;
            disp1_reg <= 0;
            disp2_reg <= 0;
            disp3_reg <= 0;
        end else begin
            count_reg <= count_next;
            disp0_reg <= disp0_next;
            disp1_reg <= disp1_next;
            disp2_reg <= disp2_next;
            disp3_reg <= disp3_next;
        end
    end
    
    always_comb begin
        disp0_next = 7'b1111111;
        disp1_next = 7'b1111111;
        disp2_next = 7'b1111111;
        disp3_next = 7'b1111111;
        
        case(count_reg[N - 1:N - 3])
            3'b000: begin
                disp0_next = TOP_SQUARE;
            end
            3'b001: begin
                disp1_next = TOP_SQUARE;
            end
            3'b010: begin
                disp2_next = TOP_SQUARE;
            end
            3'b011: begin
                disp3_next = TOP_SQUARE;
            end
            3'b100: begin
                disp0_next = BOTTOM_SQUARE;
            end
            3'b101: begin
                disp1_next = BOTTOM_SQUARE;
            end
            3'b110: begin
                disp2_next = BOTTOM_SQUARE;
            end
            3'b101: begin
                disp3_next = BOTTOM_SQUARE;
            end
        endcase
        
        count_next = count_reg + 1;
    end
    
    assign disp_0 = disp0_reg;
    assign disp_1 = disp1_reg;
    assign disp_2 = disp2_reg;
    assign disp_3 = disp3_reg;
endmodule
