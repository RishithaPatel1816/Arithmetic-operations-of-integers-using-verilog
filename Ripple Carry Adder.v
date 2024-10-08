module full_adder(input x,input y,input cin,output cout,output sum);
    not(x_c,x);
    not(c_c,cin);
    not(y_c,y);

    and(t1,x_c,y_c,cin);
    and(t2,x_c,y,c_c);
    and(t3,x,y_c,c_c);
    and(t4,x,y,cin);
    or(sum,t1,t2,t3,t4);

    and(a1,x,cin);
    and(a2,y,cin);
    and(a3,x,y);
    or(cout,a1,a2,a3);

endmodule

module RCA4 (input [3:0]A,input [3:0]B,input Cin, output Cout, output [3:0] sum);
    wire c[3:1];
    full_adder f1(A[0],B[0],Cin,c[1],sum[0]);
    full_adder f2(A[1],B[1],c[1],c[2],sum[1]);
    full_adder f3(A[2],B[2],c[2],c[3],sum[2]);
    full_adder f4(A[3],B[3],c[3],Cout,sum[3]);
endmodule