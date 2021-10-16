method Eval(x:int) returns (r:int) 
requires x > 0; 
ensures r == (x * x); 
{
    var y:int := x; 
    var z:int := 0; 
    while y>0 
        decreases y - 1; 
        invariant z == (x - y) * x; 
        { 
        z := z + x;
        y := y - 1;
        } 
    return z; 
} 