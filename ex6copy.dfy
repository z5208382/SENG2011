method Ceiling7(n:nat) returns (k:nat)
    requires n >= 0; 
    ensures (n/7 * 7 == k); 
{
    var i, f;
    f := n/7 * 7; 
    i := f; 
    return i; 
}

method Tester() {
    var a := Ceiling7(43); 
    assert a == 42; 
    
    var b := Ceiling7(6); 
    assert b == 0; 
    
    var c := Ceiling7(1000); 
    assert c == 994;
    
    var d := Ceiling7(7); 
    assert d == 7; 
    
    var e := Ceiling7(49); 
    assert e == 49; 
    
    var f := Ceiling7(69); 
    assert f == 63; 
    
    var g := Ceiling7(420); 
    assert g == 420; 
    
    var h := Ceiling7(911); 
    assert h == 910;
}