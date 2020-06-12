// EE287 S'20 HW1 code



module mf(input clk,reset,
        input pushin,
        input signed [31:0] din00,
        input signed [31:0] din01,
        input signed [31:0] din02,
        input signed [31:0] din03,
        input signed [31:0] din04,
        input signed [31:0] din05,
        input signed [31:0] din06,
        input signed [31:0] din07,
        input signed [31:0] din08,
        input signed [31:0] din09,
        input signed [31:0] din10,
        input signed [31:0] din11,
        input signed [31:0] din12,
        input signed [31:0] din13,
        input signed [31:0] din14,
        input signed [31:0] din15,
        input signed [31:0] din16,
        input signed [31:0] din17,
        input signed [31:0] din18,
        input signed [31:0] din19,
        input signed [31:0] win00,
        input signed [31:0] win01,
        input signed [31:0] win02,
        input signed [31:0] win03,
        input signed [31:0] win04,
        input signed [31:0] win05,
        input signed [31:0] win06,
        input signed [31:0] win07,
        input signed [31:0] win08,
        input signed [31:0] win09,
        input signed [31:0] win10,
        input signed [31:0] win11,
        input signed [31:0] win12,
        input signed [31:0] win13,
        input signed [31:0] win14,
        input signed [31:0] win15,
        input signed [31:0] win16,
        input signed [31:0] win17,
        input signed [31:0] win18,
        input signed [31:0] win19,
        output pushout,
        output signed [31:0] res);
    reg signed [71:0] sval;
    reg Lpushin,Lpushout_1,Lpushout_2,Lpushout_3,Lpushout_4,Lpushout;
    reg signed [31:0] Lres,Lres_d;
   wire signed [63:0] mp00_i;
   wire signed [63:0] mp01_i;
   wire signed [63:0] mp02_i;
   wire signed [63:0] mp03_i;
   wire signed [63:0] mp04_i;
   wire signed [63:0] mp05_i;
   wire signed [63:0] mp06_i;
   wire signed [63:0] mp07_i;
   wire signed [63:0] mp08_i;
   wire signed [63:0] mp09_i;
   wire signed [63:0] mp10_i;
   wire signed [63:0] mp11_i;
   wire signed [63:0] mp12_i;
   wire signed [63:0] mp13_i;
   wire signed [63:0] mp14_i;
   wire signed [63:0] mp15_i;
   wire signed [63:0] mp16_i;
   wire signed [63:0] mp17_i;
   wire signed [63:0] mp18_i;
   wire signed [63:0] mp19_i;
    reg signed [63:0] mp00;
    reg signed [63:0] mp01;
    reg signed [63:0] mp02;
    reg signed [63:0] mp03;
    reg signed [63:0] mp04;
    reg signed [63:0] mp05;
    reg signed [63:0] mp06;
    reg signed [63:0] mp07;
    reg signed [63:0] mp08;
    reg signed [63:0] mp09;
    reg signed [63:0] mp10;
    reg signed [63:0] mp11;
    reg signed [63:0] mp12;
    reg signed [63:0] mp13;
    reg signed [63:0] mp14;
    reg signed [63:0] mp15;
    reg signed [63:0] mp16;
    reg signed [63:0] mp17;
    reg signed [63:0] mp18;
    reg signed [63:0] mp19;
    reg signed [64:0] add0;
    reg signed [64:0] add1;
    reg signed [64:0] add2;
    reg signed [64:0] add3;
    reg signed [64:0] add4;
    reg signed [64:0] add5;
    reg signed [64:0] add6;
    reg signed [64:0] add7;
    reg signed [64:0] add8;
    reg signed [64:0] add9;
    reg signed [31:0] Ldin00;
    reg signed [31:0] Ldin01;
    reg signed [31:0] Ldin02;
    reg signed [31:0] Ldin03;
    reg signed [31:0] Ldin04;
    reg signed [31:0] Ldin05;
    reg signed [31:0] Ldin06;
    reg signed [31:0] Ldin07;
    reg signed [31:0] Ldin08;
    reg signed [31:0] Ldin09;
    reg signed [31:0] Ldin10;
    reg signed [31:0] Ldin11;
    reg signed [31:0] Ldin12;
    reg signed [31:0] Ldin13;
    reg signed [31:0] Ldin14;
    reg signed [31:0] Ldin15;
    reg signed [31:0] Ldin16;
    reg signed [31:0] Ldin17;
    reg signed [31:0] Ldin18;
    reg signed [31:0] Ldin19;
    reg signed [31:0] Lwin00;
    reg signed [31:0] Lwin01;
    reg signed [31:0] Lwin02;
    reg signed [31:0] Lwin03;
    reg signed [31:0] Lwin04;
    reg signed [31:0] Lwin05;
    reg signed [31:0] Lwin06;
    reg signed [31:0] Lwin07;
    reg signed [31:0] Lwin08;
    reg signed [31:0] Lwin09;
    reg signed [31:0] Lwin10;
    reg signed [31:0] Lwin11;
    reg signed [31:0] Lwin12;
    reg signed [31:0] Lwin13;
    reg signed [31:0] Lwin14;
    reg signed [31:0] Lwin15;
    reg signed [31:0] Lwin16;
    reg signed [31:0] Lwin17;
    reg signed [31:0] Lwin18;
    reg signed [31:0] Lwin19;
        assign pushout=Lpushout;
        assign res=Lres;

DW02_mult_2_stage #(32,32) u_2_stage_mult_00 (.A(Ldin00),.B(Lwin00),.TC(1'b1),.CLK(clk),.PRODUCT(mp00_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_01 (.A(Ldin01),.B(Lwin01),.TC(1'b1),.CLK(clk),.PRODUCT(mp01_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_02 (.A(Ldin02),.B(Lwin02),.TC(1'b1),.CLK(clk),.PRODUCT(mp02_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_03 (.A(Ldin03),.B(Lwin03),.TC(1'b1),.CLK(clk),.PRODUCT(mp03_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_04 (.A(Ldin04),.B(Lwin04),.TC(1'b1),.CLK(clk),.PRODUCT(mp04_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_05 (.A(Ldin05),.B(Lwin05),.TC(1'b1),.CLK(clk),.PRODUCT(mp05_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_06 (.A(Ldin06),.B(Lwin06),.TC(1'b1),.CLK(clk),.PRODUCT(mp06_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_07 (.A(Ldin07),.B(Lwin07),.TC(1'b1),.CLK(clk),.PRODUCT(mp07_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_08 (.A(Ldin08),.B(Lwin08),.TC(1'b1),.CLK(clk),.PRODUCT(mp08_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_09 (.A(Ldin09),.B(Lwin09),.TC(1'b1),.CLK(clk),.PRODUCT(mp09_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_10 (.A(Ldin10),.B(Lwin10),.TC(1'b1),.CLK(clk),.PRODUCT(mp10_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_11 (.A(Ldin11),.B(Lwin11),.TC(1'b1),.CLK(clk),.PRODUCT(mp11_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_12 (.A(Ldin12),.B(Lwin12),.TC(1'b1),.CLK(clk),.PRODUCT(mp12_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_13 (.A(Ldin13),.B(Lwin13),.TC(1'b1),.CLK(clk),.PRODUCT(mp13_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_14 (.A(Ldin14),.B(Lwin14),.TC(1'b1),.CLK(clk),.PRODUCT(mp14_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_15 (.A(Ldin15),.B(Lwin15),.TC(1'b1),.CLK(clk),.PRODUCT(mp15_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_16 (.A(Ldin16),.B(Lwin16),.TC(1'b1),.CLK(clk),.PRODUCT(mp16_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_17 (.A(Ldin17),.B(Lwin17),.TC(1'b1),.CLK(clk),.PRODUCT(mp17_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_18 (.A(Ldin18),.B(Lwin18),.TC(1'b1),.CLK(clk),.PRODUCT(mp18_i));
DW02_mult_2_stage #(32,32) u_2_stage_mult_19 (.A(Ldin19),.B(Lwin19),.TC(1'b1),.CLK(clk),.PRODUCT(mp19_i));

always @(posedge clk or posedge reset) begin
   if(reset) begin
      mp00 <= 64'b0;
      mp01 <= 64'b0;
      mp02 <= 64'b0;
      mp03 <= 64'b0;
      mp04 <= 64'b0;
      mp05 <= 64'b0;
      mp06 <= 64'b0;
      mp07 <= 64'b0;
      mp08 <= 64'b0;
      mp09 <= 64'b0;
      mp10 <= 64'b0;
      mp11 <= 64'b0;
      mp12 <= 64'b0;
      mp13 <= 64'b0;
      mp14 <= 64'b0;
      mp15 <= 64'b0;
      mp16 <= 64'b0;
      mp17 <= 64'b0;
      mp18 <= 64'b0;
      mp19 <= 64'b0;
   end
   else begin
      mp00 <= mp00_i;
      mp01 <= mp01_i;
      mp02 <= mp02_i;
      mp03 <= mp03_i;
      mp04 <= mp04_i;
      mp05 <= mp05_i;
      mp06 <= mp06_i;
      mp07 <= mp07_i;
      mp08 <= mp08_i;
      mp09 <= mp09_i;
      mp10 <= mp10_i;
      mp11 <= mp11_i;
      mp12 <= mp12_i;
      mp13 <= mp13_i;
      mp14 <= mp14_i;
      mp15 <= mp15_i;
      mp16 <= mp16_i;
      mp17 <= mp17_i;
      mp18 <= mp18_i;
      mp19 <= mp19_i;
   end
end

always @(posedge clk or posedge reset)
begin
   if(reset) begin
      add0 <= 65'b0;
      add1 <= 65'b0;
      add2 <= 65'b0;
      add3 <= 65'b0;
      add4 <= 65'b0;
      add5 <= 65'b0;
      add6 <= 65'b0;
      add7 <= 65'b0;
      add8 <= 65'b0;
      add9 <= 65'b0;
   end
   else begin
      add0 <= mp00+mp01;
      add1 <= mp02+mp03;
      add2 <= mp04+mp05;
      add3 <= mp06+mp07;
      add4 <= mp08+mp09;
      add5 <= mp10+mp11;
      add6 <= mp12+mp13;
      add7 <= mp14+mp15;
      add8 <= mp16+mp17;
      add9 <= mp18+mp19;
   end
end

    always @(*) begin
        sval=add0+add1+add2+add3+add4+add5+add6+add7+add8+add9;
    end // always @(*)
    always @(posedge(clk) or posedge(reset)) begin
        if(reset) begin
            Ldin00<=0;
            Ldin01<=0;
            Ldin02<=0;
            Ldin03<=0;
            Ldin04<=0;
            Ldin05<=0;
            Ldin06<=0;
            Ldin07<=0;
            Ldin08<=0;
            Ldin09<=0;
            Ldin10<=0;
            Ldin11<=0;
            Ldin12<=0;
            Ldin13<=0;
            Ldin14<=0;
            Ldin15<=0;
            Ldin16<=0;
            Ldin17<=0;
            Ldin18<=0;
            Ldin19<=0;
            Lwin00<=0;
            Lwin01<=0;
            Lwin02<=0;
            Lwin03<=0;
            Lwin04<=0;
            Lwin05<=0;
            Lwin06<=0;
            Lwin07<=0;
            Lwin08<=0;
            Lwin09<=0;
            Lwin10<=0;
            Lwin11<=0;
            Lwin12<=0;
            Lwin13<=0;
            Lwin14<=0;
            Lwin15<=0;
            Lwin16<=0;
            Lwin17<=0;
            Lwin18<=0;
            Lwin19<=0;
            Lpushin<=0;
            Lpushout_1 <= 0;
            Lpushout_2 <= 0;
            Lpushout_3 <= 0;
            Lpushout_4 <= 0;
            Lpushout <= 0;
            Lres_d<=0;
            Lres<=0;
        end else begin
            Ldin00<= #1 din00;
            Ldin01<= #1 din01;
            Ldin02<= #1 din02;
            Ldin03<= #1 din03;
            Ldin04<= #1 din04;
            Ldin05<= #1 din05;
            Ldin06<= #1 din06;
            Ldin07<= #1 din07;
            Ldin08<= #1 din08;
            Ldin09<= #1 din09;
            Ldin10<= #1 din10;
            Ldin11<= #1 din11;
            Ldin12<= #1 din12;
            Ldin13<= #1 din13;
            Ldin14<= #1 din14;
            Ldin15<= #1 din15;
            Ldin16<= #1 din16;
            Ldin17<= #1 din17;
            Ldin18<= #1 din18;
            Ldin19<= #1 din19;
            Lwin00<= #1 win00;
            Lwin01<= #1 win01;
            Lwin02<= #1 win02;
            Lwin03<= #1 win03;
            Lwin04<= #1 win04;
            Lwin05<= #1 win05;
            Lwin06<= #1 win06;
            Lwin07<= #1 win07;
            Lwin08<= #1 win08;
            Lwin09<= #1 win09;
            Lwin10<= #1 win10;
            Lwin11<= #1 win11;
            Lwin12<= #1 win12;
            Lwin13<= #1 win13;
            Lwin14<= #1 win14;
            Lwin15<= #1 win15;
            Lwin16<= #1 win16;
            Lwin17<= #1 win17;
            Lwin18<= #1 win18;
            Lwin19<= #1 win19;
            Lpushin<= #1 pushin;
            Lres_d<=sval >>> 35;
            Lres<= #1 Lres_d;
// Changed by rahul: Delayed Lpushout because Lres_d got pushed because of pipelining mp*
            Lpushout_1 <= #1 Lpushin;
            Lpushout_2 <= #1 Lpushout_1;
            Lpushout_3 <= #1 Lpushout_2;
            Lpushout_4 <= #1 Lpushout_3;
            Lpushout <= #1 Lpushout_4;
        end
    end // posedge(clk)

endmodule 
