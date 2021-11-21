predicate ooo(s:seq<int>)
requires |s| >= 2;
{
  exists i | 0 <= i < |s| :: if i == 0 then s[i] !in s[i+1..|s|] else s[i] !in s[0..i] + s[i+1..|s|]
}

method Main()
{
  var s := [1,1,42,1];
  assert s[0]==1 && s[1]==1 && s[2]==42 && s[3]==1;
  assert ooo(s); // Part (i)

  var s1 := [1,1,42,42];
  assert s1[0]==1 && s1[1]==1 && s1[2]==42 && s1[3]==42;
  assert !ooo(s1);

}