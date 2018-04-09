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
// Author: Florian Zaruba <zarubaf@iis.ee.ethz.ch>
// Description: Test utilities for stand-alone core test

class core_test_util #(int DATA_WIDTH = 64) extends uvm_object; /* base class*/;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
    // Provide implementations of virtual methods such as get_type_name and create
    `uvm_object_param_utils(core_test_util#(DATA_WIDTH))

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/

    logic [DATA_WIDTH-1:0] rmem [2**21];
    string file;

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
    // Constructor
    function new(string name = "core_test_util");
        super.new(name);

    endfunction : new

        // parses plusargs from command line to return filename
    function string get_file_name();
        uvm_cmdline_processor uvcl = uvm_cmdline_processor::get_inst();
        string base_dir;
        string file_name;
       // get the file name from a command line plus arg
        void'(uvcl.get_arg_value("+BASEDIR=", base_dir));
        void'(uvcl.get_arg_value("+ASMTEST=", file_name));

        file =  {base_dir, "/", file_name};
        return file;
    endfunction : get_file_name

    function void preload_memories(string file);

        uvm_report_info("Program Loader", $sformatf("Pre-loading memory from file: %s\n", file), UVM_LOW);

        // get the objdump verilog file to load our memorys
        $readmemh({file, ".hex"}, this.rmem);

    endfunction : preload_memories

endclass : core_test_util
