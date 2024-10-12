module priority_encoder(
    input[3:0]i,
    output [1:0]o,
    output v
);
 
    not(c_i0,i[0]);
    not(c_i1,i[1]);
    not(c_i2,i[2]);
    //not(c_i3,i[3]);

    or(v,i[0],i[1],i[2],i[3]);

    and(w1,c_i0,i[1]);
    and(w2,c_i0,c_i2);
    or(o[0],w1,w2);

    and(o[1],c_i0,c_i1);


endmodule