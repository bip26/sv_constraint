//Constraint to generate an array to have element in between 1-99
//Array elements should not be prime number.

class item;
  rand bit[6:0] d_arry[26];
  bit[6:0] q[$];				//the array
  
  constraint d_c {foreach(d_arry[i])
                    soft d_arry[i] inside {[1:25]};
                  foreach(d_arry[i])
                    if(i==0)
                      d_arry[i] == 1;				//1 is a non-prime number
                    else
                      d_arry[i] == not_prime(i);
                 }
  
  
  function bit[6:0] not_prime (bit[6:0] val);
    for(bit[6:0] i=0;i<val;i++)begin
      if(i>=2 && val % i ==0)
        return val;
    end
  endfunction
  
  function void post_randomize();
    q = d_arry.unique();
    q.delete(0);	//for deleting the zero
    q.shuffle();
  endfunction
endclass

module tb;
  item obj;
  int aso [int];
  initial begin
    obj=new();
    assert(obj.randomize());
    $display("without short::\n\t%p",obj.q);
    //implementing short() methode without using the system verilog short() methode
    foreach(obj.q[i])begin
      aso[obj.q[i]] = 0;
    end
    obj.q.delete();
    foreach(aso[i])
      obj.q.push_back(i);
    $display("with short::\n\t%p",obj.q);
    //$display("number of non-prime no between 0 to 100 is=%0d",obj.q.size());
    
  end
endmodule












