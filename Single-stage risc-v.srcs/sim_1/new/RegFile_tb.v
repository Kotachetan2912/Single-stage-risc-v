module RegFile_tb;
    reg WE3;
    reg clk;
    reg [4:0] A1;
    reg [4:0] A2;
    reg [4:0] A3;
    reg [31:0] WD3;
    wire [31:0] RD1;
    wire [31:0] RD2;

    // Instantiate Unit Under Test
    Register_File uut (
        .WE3(WE3), 
        .clk(clk), 
        .A1(A1), 
        .A2(A2), 
        .A3(A3), 
        .WD3(WD3), 
        .RD1(RD1), 
        .RD2(RD2)
    );

    // 1. Clean Clock Generator (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Setup waveform tracking for Vivado / EDA Playground
        $dumpfile("dump.vcd");
        $dumpvars(0, RegFile_tb);
        
        // Initialize everything to a safe state at t=0
        clk = 0; 
        WE3 = 0; 
        A1 = 0; 
        A2 = 0; 
        A3 = 0; 
        WD3 = 0;
        #10;

        // --- PHASE 1: WRITE DATA INTO REGISTERS ---
        // Write 32'd100 into Register 1 (x1)
        WE3 = 1; A3 = 5'd1; WD3 = 32'd100;
        #10; // Wait for one clock edge to commit write
        
        // Write 32'd200 into Register 2 (x2)
        A3 = 5'd2; WD3 = 32'd200;
        #10;
        
        // Write 32'd500 into Register 3 (x3)
        A3 = 5'd3; WD3 = 32'd500;
        #10;

        // Turn off Write Enable so we don't accidentally corrupt data
        WE3 = 0;
        #10;

        // --- PHASE 2: READ DATA BACK TO VERIFY ---
        // Read Register 1 on RD1, and Register 2 on RD2
        A1 = 5'd1; A2 = 5'd2;
        #20; // Let it sit so you can see it clearly on the wave

        // Read Register 3 on RD1, and look at Register 0 (Should be 0!) on RD2
        A1 = 5'd3; A2 = 5'd8;
        #20;

        // --- PHASE 3: TIMING PROGRESSION PAST 90ns ---
        // Let's perform an active write right around 80ns-90ns to see RD1 jump!
        #10; 
        // At t = 80ns: We enable writing a new value to Register 4
        WE3 = 1; A3 = 5'd4; WD3 = 32'd789;
        #10; // Commits at t = 90ns
        
        // At t = 90ns: Turn off write, and instantly point A1 to read our brand new Register 4!
        WE3 = 1; A1 = 5'd4;
        
        #10;
        WE3 = 1; A2 = 5'd12;
        #10;
        WE3 = 1; A1 = 5'd8; A2 = 5'd8;
        #30; // Let simulation run up to 130ns so you get a full view past 90ns
        $finish();
    end

endmodule