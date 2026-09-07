#! /c/Source/iverilog-install/bin/vvp
:ivl_version "12.0 (devel)" "(s20150603-1110-g18392a46)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision - 12;
:vpi_module "C:\iverilog\lib\ivl\system.vpi";
:vpi_module "C:\iverilog\lib\ivl\vhdl_sys.vpi";
:vpi_module "C:\iverilog\lib\ivl\vhdl_textio.vpi";
:vpi_module "C:\iverilog\lib\ivl\v2005_math.vpi";
:vpi_module "C:\iverilog\lib\ivl\va_math.vpi";
S_0000019de17e8b40 .scope module, "tb_half_adder" "tb_half_adder" 2 4;
 .timescale -9 -12;
v0000019de17e70f0_0 .var "a", 0 0;
v0000019de17eac80_0 .var "b", 0 0;
v0000019de17ead20_0 .net "carry", 0 0, L_0000019de17e7190;  1 drivers
v0000019de17eadc0_0 .net "sum", 0 0, L_0000019de1652f10;  1 drivers
S_0000019de17e9f90 .scope module, "uut" "half_adder" 2 8, 3 1 0, S_0000019de17e8b40;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "a";
    .port_info 1 /INPUT 1 "b";
    .port_info 2 /OUTPUT 1 "sum";
    .port_info 3 /OUTPUT 1 "carry";
L_0000019de1652f10 .functor XOR 1, v0000019de17e70f0_0, v0000019de17eac80_0, C4<0>, C4<0>;
L_0000019de17e7190 .functor AND 1, v0000019de17e70f0_0, v0000019de17eac80_0, C4<1>, C4<1>;
v0000019de1653360_0 .net "a", 0 0, v0000019de17e70f0_0;  1 drivers
v0000019de16866a0_0 .net "b", 0 0, v0000019de17eac80_0;  1 drivers
v0000019de17ea120_0 .net "carry", 0 0, L_0000019de17e7190;  alias, 1 drivers
v0000019de1652e70_0 .net "sum", 0 0, L_0000019de1652f10;  alias, 1 drivers
    .scope S_0000019de17e8b40;
T_0 ;
    %vpi_call 2 16 "$dumpfile", "half_adder_result.vcd" {0 0 0};
    %vpi_call 2 17 "$dumpvars", 32'sb00000000000000000000000000000000, S_0000019de17e8b40 {0 0 0};
    %end;
    .thread T_0;
    .scope S_0000019de17e8b40;
T_1 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000019de17e70f0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000019de17eac80_0, 0, 1;
    %delay 10000, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000019de17e70f0_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0000019de17eac80_0, 0, 1;
    %delay 10000, 0;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0000019de17e70f0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000019de17eac80_0, 0, 1;
    %delay 10000, 0;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0000019de17e70f0_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0000019de17eac80_0, 0, 1;
    %delay 10000, 0;
    %vpi_call 2 26 "$display", "Simulation Finished" {0 0 0};
    %vpi_call 2 27 "$finish" {0 0 0};
    %end;
    .thread T_1;
# The file index is used to find the file name in the following table.
:file_names 4;
    "N/A";
    "<interactive>";
    "adder_tb.v";
    "./adder.v";
