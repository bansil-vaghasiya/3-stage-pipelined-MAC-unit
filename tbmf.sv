// This is the test bench for EE287 HW1 
`timescale 1ns/10ps

`include "mf.sv"

module top();
reg clk,reset;
reg pushin;
reg signed [19:0][31:0] din,win;
reg signed [19:0][63:0] mp;
reg signed [31:0] dini,wini;
reg signed [63:0] mpi;
reg signed [63:0] mp00,mp01,mp02,mp03;
wire pushout;
wire signed [31:0] res;
reg signed [71:0] acc;
reg signed [31:0] cres;

reg signed [31:0] eres[$];

reg opushout,hpushout;
reg [31:0] ores,hres,expected;

reg debug=1;

assign mp00=mp[0];
assign mp01=mp[1];
assign mp02=mp[2];
assign mp03=mp[3];


task srdata(int drange,reg [19:0] mask);
    repeat($urandom_range(drange)) begin
        for(int ix=0; ix < 20; ix=ix+1) begin
            din[ix]=32'hdeaddead;
            win[ix]=32'hb0b11111;
        end
        @(posedge(clk)) #1;
    end
    pushin=1;
    acc=0;
    for(int ix=0; ix < 20; ix=ix+1) begin
        if(mask[ix]) begin
            din[ix]=$random;
            win[ix]=$random;
        end else begin
            din[ix]=0;
            win[ix]=0;
        end
        dini=din[ix];
        wini=win[ix];
        mpi=dini*wini;
        mp[ix]=mpi;
        acc += mpi;
    end
    cres = acc >>> 35;
    eres.push_back(cres);
    @(posedge(clk)) #1;
    pushin=0;
endtask : srdata

task Die(input string msg);
    $display("\n\n\n\nError --- Error --- Error\n%s",msg);
    $display(" at time %t",$realtime);
    $finish;
endtask : Die

initial begin
    forever begin
        @(posedge(clk));
        if(reset) continue;
        opushout=pushout;
        ores=res;
        #0.1;
        hpushout=pushout;
        hres=res;
        if(^opushout===1'bX || ^ores === 1'bX) Die("pushout or res has 'x'");
        if(opushout !== hpushout) Die("No hold time on pushout");
        if(ores !== hres) Die("No hold time on res");
        if(opushout) begin
            if(eres.size()<1) Die("You pushed out and no result expected");
            expected=eres.pop_front();
            if(expected !== ores) Die($sformatf("Expected %08h got %08h",
                expected,ores));
        end
    end
end

initial begin
    clk=1;
    repeat(195_000) begin
        #5 clk=~clk;
        #5 clk=~clk;
    end
    Die("Ran out of clocks");
end

initial begin
    reset=1;
    din=0;
    win=0;
    mp=0;
    acc=0;
    cres=0;
    pushin=0;
    repeat(3) @(posedge(clk)) #1;
    reset=0;
end

initial begin
    repeat(10) @(posedge(clk)) #1;
    for(int ix=0; ix < 20; ix+=1)begin
        repeat(2000) srdata(0,1<<ix);
    end
    for(int ix=0; ix < 20; ix+=1)begin
        repeat(2000) srdata(0,(1<<ix)|(1<<$urandom_range(19)));
    end
    repeat(20000) srdata(2,20'hfffff);
    repeat(20000) srdata($urandom_range(10),20'hfffff);
    repeat(200) @(posedge(clk)) #1;
    if(eres.size()>0) Die("Test completed and not all data pushed out");
    $display("\n\n\n\n\nWith pride, you passed the test\n\n\n\n\n");
    $finish;
end

mf f(clk,reset,pushin,din[0],din[1],din[2],din[3],din[4],din[5],din[6],
    din[7],din[8],din[9],din[10],din[11],din[12],din[13],din[14],din[15],
    din[16],din[17],din[18],din[19],
    win[0],win[1],win[2],win[3],win[4],win[5],win[6],win[7],win[8],win[9],
    win[10],win[11],win[12],win[13],win[14],win[15],win[16],win[17],
    win[18],win[19],pushout,res);

initial begin
    if(debug) begin
        $dumpfile("mf.vcd");
        $dumpvars(9,top);
    end
end


endmodule : top
