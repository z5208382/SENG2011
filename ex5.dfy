method tester1() 
{
    var a: array<int> := new int[][3,2,1,2,3,0,0]; // a testcase
    assert a[0]==3 && a[1]==2 && a[2]==1 && a[3]==2 && a[4]==3 && a[5]==0 && a[6] == 0;
    assert exist1(a,1); // exactly one ’1’
    assert !exist1(a,3); // more than one ’3’
    assert !exist1(a,0); //more than one 0 
    assert !exist1(a,2); //more than one 2
    assert !exist1(a, 69); 
    
    assert !exist2(a,1); 
    assert exist2(a,3); // more than one ’3’
    assert exist2(a,0); //more than one 0 
    assert exist2(a,2); //more than one 2
    assert !exist2(a, 69); 
    
    assert tail(a); 
    
    var b: array<int> := new int[][1,2,3,4];
    assert b[0] == 1 && b[1] == 2 && b[2] == 3 && b[3] == 4; 
    assert exist1(b, 1); 
    assert !exist2(b, 3);
    assert !tail(b); 
    
    var c: array<int> := new int[][1,0,2,0]; 
    assert c[0] == 1 && c[1] == 0 && c[2] == 2 && c[3] == 0; 
    assert exist1(c, 1); 
    assert !exist2(c, 3);
    //assert !tail(c); 
    
    var d: array<int> := new int[][0,1,0,0]; 
    assert d[0] == 0 && d[1] == 1 && d[2] == 0 && d[3] == 0; 
    assert exist1(d, 1); 
    assert exist2(d, 0);
    //assert !tail(d); 
    
    var e: array<int> := new int[][1,1,0,0]; 
    assert e[0] == 1 && e[1] == 1 && e[2] == 0 && e[3] == 0; 
    assert !exist1(e, 1); 
    assert exist2(e, 0);
    assert tail(e); 
}

predicate exist1(a: array<int>, x: int) 
reads a
{ exists i | 0 <= i < a.Length :: a[i] == x && !exist2(a, x)}

predicate exist2(a: array<int>, x: int) 
reads a
{ exists i | 0 <= i < a.Length :: a[i] == x && exists j | i < j < a.Length :: a[j] == x}

predicate tail(a: array<int>)
reads a
{ exists i | 0 <= i < a.Length :: a[i] == 0 && forall j :: i < j <a.Length ==> a[j] == 0}