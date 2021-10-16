method tester() 
{
    var a: array<int> := new int[][3,3,1,0,0,0]; // a testcase
    assert a[0]==3 && a[1]==3 && a[2]==1 && a[3]==0 && a[4]==0 && a[5]==0; // inform Z3
    assert exist1(a, 0); // exactly one ’42’
   // assert exist2(a, 42); // more than one ’42’
   // assert tail(a); // has a tail
}

// predicate exist1(a: array<int>, x: int) 
// reads a
// { exists i :: 0 <= i < a.Length && a[i] == x && helper(a[i+1..], x)}

// predicate exist2(a: array<int>, x: int)
// reads a
// { exists i :: 0 <= i < a.Length && if a[i] == x then !helper(a[i+1..], x) else false}

// predicate tail(a: array<int>)
// reads a
// { exists i :: 0 <= i < a.Length && a[i] == 0 && helper2(a[i+1..])}

// predicate helper(a: seq<int>, x: int) 
// { !exists i :: 0 <= i < |a| && a[i] == x}

// predicate helper2(a: seq<int>)
// { forall i :: 0 <= i < |a| ==> a[i] == 0}

predicate exist1(a: array<int>, x: int) 
reads a
{ exists i :: 0 <= i < a.Length && a[i] == x && (forall j :: i < j < a.Length ==> a[j] != x)}