//4 to1 1 mux
module mux(
    input [3:0]x,
    input [1:0]s,
    output y
);
    wire s_c[1:0];
    not(s_c[1],s[1]);
    not(s_c[0],s[0]);

    and(y0_1,s_c[1],s_c[0],x[0]);
    and(y0_2,s_c[1],s[0],x[1]);
    and(y0_3,s[1],s_c[0],x[2]);
    and(y0_4,s[1],s[0],x[3]);
    or(y,y0_1,y0_2,y0_3,y0_4);
endmodule

//16 to 1 muc
module mux_16_to_1(
    input [15:0]x,
    input [3:0]s,
    output y
);
    wire o[3:0];
    not(s3_c,s[3]);
    not(s2_c,s[2]);
    mux m1(x[3:0],s[1:0],o[0]);
    mux m2(x[7:4],s[1:0],o[1]);
    mux m3(x[11:8],s[1:0],o[2]);
    mux m4(x[15:12],s[1:0],o[3]);

    and(a1,s3_c,s2_c,o[0]);
    and(a2,s3_c,s[2],o[1]);
    and(a3,s[3],s2_c,o[2]);
    and(a4,s[3],s[2],o[3]);
    or(y,a1,a2,a3,a4);

endmodule
