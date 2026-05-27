onerror {quit -f}
vlib work
vlog -work work BUS.vo
vlog -work work BUS.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.BUS_vlg_vec_tst
vcd file -direction BUS.msim.vcd
vcd add -internal BUS_vlg_vec_tst/*
vcd add -internal BUS_vlg_vec_tst/i1/*
add wave /*
run -all
