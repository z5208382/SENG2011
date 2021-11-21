predicate sorted(a: array<int>, low:int, high:int) reads a
  requires 0<=low<=high<=a.Length
{ forall j,k:: low<=j<k<high ==> a[j]<=a[k] }

predicate isSeclar(a:array<int>, seclar:int) reads a
{
  exists i | 0 <= i < a.Length :: forall j :: 0 <= j < a.Length ==> a[j] <= a[i] || a[j] == a[i]
}

method SecondLargest(a:array<int>) returns (seclar:int) modifies a
requires a.Length >= 2;
ensures multiset(a[..]) == multiset(old(a[..]));
ensures sorted(a,0,a.Length);
//ensures exists i | 0 <= i < a.Length :: forall j :: 0 <= j < a.Length ==> a[j] <= seclar || a[j] == a[i];
ensures isSeclar(a, seclar);
ensures exists j | 0 <= j < a.Length-1 :: a[j] == seclar;
{
  var up:=1;
  while (up < a.Length)
  invariant 1 <= up <= a.Length;
  invariant sorted(a, 0, up);
  invariant multiset(a[..]) == multiset(old(a[..]));
  {
    var down := up; // the next unordered element
    while (down >= 1 && a[down-1] > a[down])
    invariant 0 <= down <= up;
    invariant forall i,j:: (0<=i<j<=up && j!=down) ==> a[i]<=a[j];
    invariant multiset(a[..]) == multiset(old(a[..]));
    {
      a[down-1], a[down] := a[down], a[down-1];
      down:=down-1;
    }
    up:=up+1;
  }

  var i := a.Length-2;
  var sLargest := a[a.Length-1];
  while(i >= 0)
  invariant exists i | 0 <= i < a.Length :: forall j :: 0 <= j < a.Length ==> a[j] <= a[i] || a[j] == a[i];
  {
    if(a[i] != a[a.Length - 1]) {
      var sLargest := a[i];
      return sLargest;
    }
    i := i - 1;
  }
  return sLargest;
}

method Main()
{

  var a1:= new int[][2,42];
  assert a1[0] == 2 && a1[1] == 42;
  var b1 := SecondLargest(a1);
  print b1;

  // var a2:= new int[][2,42,-4];
  // var b2:= SecondLargest(a2);
  // //assert b2 == 2;
  // print b2;

  // var a3:= new int[][42,42,42,42,42,42,42];
  // var b3:= SecondLargest(a3);
  // //assert b3 == 42;
  // print b3;

  // var a4:= new int[][102,103,104];
  // var b4:= SecondLargest(a4);
  // //assert b4 == 103;
  // print b4;

  // var a5:= new int[][-4,2];
  // var b5:= SecondLargest(a5);
  // //assert b5 == -4;
  // print b5;

  // var a6:= new int[][0,0,0,0,0,0];
  // var b6:= SecondLargest(a6);
  // //assert b6 == 0;
  // print b6;
}
