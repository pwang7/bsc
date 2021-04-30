////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////

typedef Tuple2#(Bit#(1), Bit#(1)) Pair;

////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////

function Pair sum (Bit#(1) a, Bit#(1) b);
      Bit#(1) s;
      Bit#(1) c;
      s = a + b;
      c = a * b;
      return tuple2(s, c);
endfunction

////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////

(* synthesize *)
module mkTest (Empty);

   Reg#(Bool) first();
   mkReg#(True) first_reg(first);

   Reg #(Bit#(1) ) x();
   mkRegU x_reg(x);

   Reg#(Bit#(1)) y();
   mkRegU y_reg(y);

   Reg #(Bit#(1) ) w();
   mkRegU w_reg(w);

   Reg#(Pair) z();
   mkRegU z_reg(z);

   rule start (first);
        first <= False;
        x <= 1;
        y <= 0;
        $display("aaa");
   endrule

   rule rest (!first);
        z <= sum(x, y);
        w <= tpl_1(z);
        $display("bbb %b", w);
        $display("bbb %b", tpl_1(z));
   endrule

endmodule

////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////
