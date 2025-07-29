`ifndef UVM_HDL_BACKDOOR_ROUTINES_PKG_SV
`define UVM_HDL_BACKDOOR_ROUTINES_PKG_SV

package uvm_hdl_backdoor_routines_pkg;

    `define UVM_HDL_CHECK_PATH(PATH) \
        if(!uvm_hdl_check_path(PATH))begin \
            `uvm_fatal("uvm_hdl_check_path", $sformatf("the given HDL path(%s) not found", PATH)) \
        end else begin
            `uvm_info("uvm_hdl_check_path", $sformatf("the given HDL path(%s) is found", PATH), UVM_DEBUG) \
        end

    `define UVM_HDL_DEPOSIT(PATH, VALUE) \
        if(!uvm_hdl_check_path(PATH))begin \
            `uvm_fatal("uvm_hdl_check_path", $sformatf("the given HDL path(%s) not found", PATH)) \
        end else begin  \
            if(!uvm_hdl_deposit(PATH, VALUE))begin \
                `uvm_fatal("uvm_hdl_deposit", $sformatf("sets the the given HDL path(%s) to the specified value(0x%0h) failed", PATH, VALUE)) \
            end else begin \
                `uvm_info("uvm_hdl_deposit", $sformatf("sets the the given HDL path(%s) to the specified value(0x%0h) succeeded", PATH, VALUE), UVM_DEBUG) \
            end \
        end

    `define UVM_HDL_FORCE(PATH, VALUE) \
        if(!uvm_hdl_check_path(PATH))begin \
            `uvm_fatal("uvm_hdl_check_path", $sformatf("the given HDL path(%s) not found", PATH)) \
        end else begin  \
            if(!uvm_hdl_force(PATH, VALUE))begin \
                `uvm_fatal("uvm_hdl_force", $sformatf("forces the value(0x%0h) on the the given HDL path(%s) failed", VALUE, PATH)) \
            end else begin \
                `uvm_info("uvm_hdl_force", $sformatf("forces the value(0x%0h) on the the given HDL path(%s) failed", VALUE, PATH), UVM_DEBUG) \
            end \
        end

    `define UVM_HDL_FORCE_TIME(PATH, VALUE, TIME) \
        if(!uvm_hdl_check_path(PATH))begin \
            `uvm_fatal("uvm_hdl_check_path", $sformatf("the given HDL path(%s) not found", PATH)) \
        end else begin  \
            if(!uvm_hdl_force_time(PATH, VALUE, TIME))begin \
                `uvm_fatal("uvm_hdl_force_time", $sformatf("forces the value(0x%0h) on the the given HDL path(%s) for the specified of force_time(0x%0h) failed", VALUE, PATH, TIME)) \
            end else begin \
                `uvm_info("uvm_hdl_force_time", $sformatf("forces the value(0x%0h) on the the given HDL path(%s) for the specified of force_time(0x%0h) succeeded", VALUE, PATH, TIME)) \
            end \
        end

    `define UVM_HDL_RELEASE_AND_READ(PATH, VALUE) \
        if(!uvm_hdl_check_path(PATH))begin \
            `uvm_fatal("uvm_hdl_check_path", $sformatf("the given HDL path(%s) not found", PATH)) \
        end else begin \
            if(!uvm_hdl_release_and_read(PATH, VALUE))begin \
                `uvm_fatal("uvm_hdl_release_and_read", $sformatf("releases a value previously set with uvm_hdl_force on the given HDL path(%s) failed", PATH)) \
            end else begin \
                `uvm_info("uvm_hdl_release_and_read", $sformatf("releases a value previously set with uvm_hdl_force on the given HDL path(%s) failed", PATH), UVM_DEBUG) \
            end \
        end

    `define UVM_HDL_RELEASE(PATH) \
        if(!uvm_hdl_check_path(PATH))begin \
            `uvm_fatal("uvm_hdl_check_path", $sformatf("the given HDL path(%s) not found", PATH)) \
        end else begin \
            if(!uvm_hdl_release(PATH))begin \
                `uvm_fatal("uvm_hdl_release", $sformatf("releases a value previously set with uvm_hdl_force on the given HDL path(%s) failed", PATH)) \
            end else begin \
                `uvm_info("uvm_hdl_release", $sformatf("releases a value previously set with uvm_hdl_force on the given HDL path(%s) failed", PATH), UVM_DEBUG) \
            end
        end

    `define UVM_HDL_READ_AND_CMP(PATH, EXP_VALUE) \
        if(!uvm_hdl_check_path(PATH))begin \
            `uvm_fatal("uvm_hdl_check_path", $sformatf("the given HDL path(%s) not found", PATH)) \
        end else begin \
            if(!uvm_hdl_read(PATH, ACT_VALUE))begin \
                `uvm_fatal("uvm_hdl_read", $sformatf("gets the value at the given path(%s) failed", PATH)) \
            end else begin \
                if(EXP_VALUE !== ACT_VALUE)begin \
                    `uvm_error("uvm_hdl_read", $sformatf("gets the value(0x%0h) at the given path(%s) is not equal to expected value(0x%0h)", ACT_VALUE, PATH, EXP_VALUE)) \
                end else begin \
                    `uvm_info("uvm_hdl_read", $sformatf("gets the value(0x%0h) at the given path(%s) is equal to expected value(0x%0h)", ACT_VALUE, PATH, EXP_VALUE), UVM_DEBUG) \
                end \
            end \
        end

    `define UVM_HDL_READ(PATH, VALUE) \
        if(!uvm_hdl_check_path(PATH))begin \
            `uvm_fatal("uvm_hdl_check_path", $sformatf("the given HDL path(%s) not found", PATH)) \
        end else begin \
            if(!uvm_hdl_read(PATH, VALUE))begin \
                `uvm_fatal("uvm_hdl_read", $sformatf("gets the value at the given path(%s) failed", PATH)) \
            end \
        end

endpackage : uvm_hdl_backdoor_routines_pkg

`endif // UVM_HDL_BACKDOOR_ROUTINES_PKG_SV