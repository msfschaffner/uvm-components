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
// Date: 29.05.2017
// Description: store_queue_if_agent package - compile unit

package store_queue_if_agent_pkg;
    // UVM Import
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Sequence item to model transactions
    `include "store_queue_if_seq_item.svh"
    // Agent configuration object
    `include "store_queue_if_agent_config.svh"
    // Driver
    `include "store_queue_if_driver.svh"
    // Coverage monitor
    // `include "store_queue_if_coverage_monitor.svh"
    // Monitor that includes analysis port
    `include "store_queue_if_monitor.svh"
    // Sequencer
    `include "store_queue_if_sequencer.svh"
    // Main agent
    `include "store_queue_if_agent.svh"
    // Sequence
    `include "store_queue_if_sequence.svh"
endpackage: store_queue_if_agent_pkg
