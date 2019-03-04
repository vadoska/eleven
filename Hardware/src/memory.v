////////////////////////////////////////////////////////////////////////////////
//
// Company:
// Engineer:        Ralnikov Vadim Dmitryevich
//
// Create Date:     20:00 4/03/2019
// Design Name:
// Module Name:     memory
// Project Name:
// Target Devices:
// Tool versions:
// Description:     single port RAM
//
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps
`default_nettype none

/*
memory
    memory_inst
    (
        .CLK                    (),                     //  in, u[ 1], clock
        .EN                     (),                     //  in, u[ 1], clock enable
        .ADDRESS                (),                     //  in, u[11], address
        .WE                     (),                     //  in, u[ 1], write enable
        .DI                     (),                     //  in, u[ 8], data input

        .DO                     ()                      // out, u[ 8], data output
    )
*/

module memory
    (
        input   wire                CLK,                //  in, u[ 1], clock
        input   wire                EN,                 //  in, u[ 1], clock enable
        input   wire    [ 10 :  0 ] ADDRESS,            //  in, u[11], address
        input   wire                WE,                 //  in, u[ 1], write enable
        input   wire    [  7 :  0 ] DI,                 //  in, u[ 8], data input

        output  wire    [  7 :  0 ] DO                  // out, u[ 8], data output
    );


reg     [  7 :  0 ] r_memory    [ 2047 :  0];
reg     [ 10 :  0 ] r_adr_delayed;


assign DO = r_memory[r_adr_delayed];


    always @(posedge CLK)
        if(EN)
            r_adr_delayed <= ADDRESS;


    always @(posedge CLK)
        if(EN)
            if(WE)
                r_memory[ADDRESS] <= DI;

endmodule
