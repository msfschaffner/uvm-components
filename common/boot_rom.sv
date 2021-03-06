// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// Author: Florian Zaruba, ETH Zurich
// Date: 12.07.2017
// Description: Boot ROM, similar to Spike

module boot_rom (
    input  logic        clk_i,
    input  logic        rst_ni,
    input  logic [63:0] address_i,
    output logic [63:0] data_o // combinatorial output
);

    always_comb begin

        data_o = 64'hx;
        // auipc   t0, 0x0
        // addi    a1, t0, 32
        // csrr    a0, mhartid
        // ld      t0, 24(t0)
        // jr      t0
        case (address_i & (~3'h7))
            64'h1000: data_o = 64'h00a2a02345056291;
            64'h1008: data_o = 64'h0202859302fe4285;
            64'h1010: data_o = 64'h00028067f1402573;
            64'h1018: data_o = 64'h0000000000000000;
            // device tree
            default: begin
                data_o = 64'hx; //fdt[fdt_address[63:3]];
            end
        endcase
    end
endmodule
