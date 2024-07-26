//SystemVerilog Constraint to generate 9753186420

class item;
  rand bit[3:0] d_arry[];

  constraint pattern_cons {d_arry.size() == 10;
  			   foreach(d_arry[i])
		           {
		             if(i<=4)
			       data == 10 - ((i*2)+1);		//9 7 5 3 1
		             if(i>4)
			       data == 18 - (i*2);		//8 6 4 2 0
			   } 
			  }


  function void post_randomize();
    $display ("data=%p", data);
  endfunction:post_randomize
endclass: item

module top;
  int count = 'd4;
  item i_h;

  initial begin //{
    i_h = new();		//allocating memory
    repeat(count) begin //{
      assert(i_h.randomize());
    end //}
  end //}
endmodule




