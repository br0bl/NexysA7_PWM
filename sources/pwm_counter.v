`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Ben Robles
// 
// Create Date: 08/17/2026 6:08:20 PM
// Design Name: PWM counter
// Module Name: pwm_counter
// Project Name: NexysA7_PWM
// Target Devices: Nexys A7
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

module pwm_counter#(parameter freq = 25_000) 
                   (
                      input clk100mhz,
                      input rst_n,
                      output wire period_tick,
                      output reg [$clog2(100_000_000/freq)-1:0] pwm_count
                   );
                  	
  	assign period_tick = (pwm_count == (100_000_000/freq) - 1);
  	
    always@(posedge clk100mhz or negedge rst_n) begin
      if(!rst_n) begin
        pwm_count <= 0;
      end
      else begin
        if(period_tick) begin
          pwm_count <= 0;
        end
        else begin
          pwm_count <= pwm_count + 1;
        end
      end
      
    end
  
endmodule