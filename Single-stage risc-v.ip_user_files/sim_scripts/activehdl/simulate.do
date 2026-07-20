transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+Datapath_tb  -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Datapath_tb xil_defaultlib.glbl

do {Datapath_tb.udo}

run 1000ns

endsim

quit -force
