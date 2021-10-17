method main() 
{
    var a:array<int> := new int[3];
    a[0], a[1], a[2] := 1, 1, 1; // initialize the array
    assert !exists j:int :: 0<=j<a.Length && a[j]==2; 
}


predicate exist1(a: array<int>, x: int) 
reads a
{ exists i :: 0 <= i < a.Length && a[i] == x && !exists j :: i < j < a.Length && a[j] == x}
