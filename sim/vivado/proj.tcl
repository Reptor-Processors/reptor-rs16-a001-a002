# ============================================================
# Reptor RS16 - Vivado Project
# ============================================================

# ============================================================
# Project configuration
# ============================================================

set project_name "reptor_rs16"

# ============================================================
# Target Board
# ============================================================

# Default target: ZedBoard
set fpga_part  "xc7z020clg484-1"
set board_part "avnet.com:zedboard:part0:1.4"

# ============================================================
# Determine repository location
# ============================================================

# Location of this TCL file:
# <repo>/sim/vivado/proj.tcl
set script_dir [file dirname [file normalize [info script]]]

# Repository root:
# <repo>
set repo_dir [file normalize "$script_dir/../.."]

# ============================================================
# Project and source directories
# ============================================================

set project_dir "$repo_dir/sim/vivado/proj"

set rtl_dir "$repo_dir/rtl"
set tb_dir  "$repo_dir/tb"

# ============================================================
# Create project
# ============================================================

create_project $project_name $project_dir \
    -part $fpga_part \
    -force

# Set target board
set_property board_part $board_part [current_project]

# ============================================================
# Add RTL sources
# ============================================================

set rtl_v_files [glob -nocomplain "$rtl_dir/*.v"]
set rtl_sv_files [glob -nocomplain "$rtl_dir/*.sv"]

if {[llength $rtl_v_files] > 0} {
    add_files $rtl_v_files
}

if {[llength $rtl_sv_files] > 0} {
    add_files $rtl_sv_files
}

# ============================================================
# Add simulation testbench
# ============================================================

set tb_v_files [glob -nocomplain "$tb_dir/*.v"]
set tb_sv_files [glob -nocomplain "$tb_dir/*.sv"]

if {[llength $tb_v_files] > 0} {
    add_files -fileset sim_1 $tb_v_files
}

if {[llength $tb_sv_files] > 0} {
    add_files -fileset sim_1 $tb_sv_files
}

# ============================================================
# Update compile order
# ============================================================

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# ============================================================
# Project information
# ============================================================

puts "============================================"
puts " Reptor RS16 Vivado Project"
puts "============================================"
puts " Project : $project_name"
puts " FPGA    : $fpga_part"
puts " Board   : $board_part"
puts " Repo    : $repo_dir"
puts " RTL     : $rtl_dir"
puts " TB      : $tb_dir"
puts "============================================"