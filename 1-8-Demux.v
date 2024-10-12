//1-4-demux
module demux(input y,input [1:0]s,output [3:0]x);
    wire [1:0]s_c;
    not (s_c[1],s[1]);
    not (s_c[0],s[0]);

    and(x[0],s_c[1],s_c[0]);
    and(x[1],s_c[1],s[0]);
    and(x[2],s[1],s_c[0]);
    and(x[3],s[1],s[0]);
endmodule

//creating 1-8-demux using 1-4 :)
module demux_1x8(output [7:0] out, input in, input [2:0] sel);

    wire [7:0]o;
    not(s2_c,sel[2]);
    demux a1(in,sel[1:0],o[3:0]);
    demux a2(in,sel[1:0],o[7:4]);

    and(out[0],s2_c,o[0]);
    and(out[1],s2_c,o[1]);
    and(out[2],s2_c,o[2]);
    and(out[3],s2_c,o[3]);
    and(out[4],s2,o[4]);
    and(out[5],s2,o[5]);
    and(out[6],s2,o[6]);
    and(out[7],s2,o[7]);

endmodule
