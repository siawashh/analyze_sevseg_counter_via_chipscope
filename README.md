# analyze_sevseg_counter_via_chipscope
# chipscope
ChipScope is a set of tools made by Xilinx that allows you to easily probe the internal signals of your design inside an FPGA, much as you would do with a logic analyzer. For example, while your design is running on the FPGA, you can trigger when certain events take place and view any of your design's internal signals.
ChipScope™ Pro tool inserts logic analyzer, system analyzer, and virtual I/O low-profile software cores directly into your design, allowing you to view any internal signal or node, including embedded hard or soft processors.
# how to use chipscope
In summary must impelemnt a ICON + some ILA (based on project) IP cores to the top module then we must implement the code inside FPGA then we run chipscope software
#chipscope VS simulator
simulators are good for debug during code we can test a few senarios and it may take a few minute to simulator simulate the test
but we can analyzie the code with much more senarios in real time (few minutes) witch can take a decade to do the same job with ISIM or other simulator
# the code is tested,worked,synch and standard 
