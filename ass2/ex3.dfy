predicate ooo(s:seq<int>)
requires |s| >= 2;
{
  //exists i | 0 <= i < |s| :: if i == 0 then s[i] !in s[i+1..|s|] else s[i] !in s[0..i] + s[i+1..|s|]
  exists i | 0 <= i < |s| :: if s[i] !in s[i+1..|s|] && i == 0 then s[i+1] in s[i+1..|s|] else if s[i] !in s[0..i] + s[i+1..|s|] then s[i] in s[..|s|] else s[i] !in s[..|s|]
}

method Testerooo()
{
  var s := [1,1,42,1];
  assert s[0]==1 && s[1]==1 && s[2]==42 && s[3]==1;
  assert ooo(s); // Part (i)

  var s1 := [1,1,42,42];
  assert s1[0]==1 && s1[1]==1 && s1[2]==42 && s1[3]==42;
  assert !ooo(s1);

  var s2 := [1,42];
  assert s2[0]==1 && s2[1]==42;
  assert ooo(s2);


  var s3 := [1,2,3];
  assert s3[0]==1 && s3[1]==2 && s3[2]==3;
  assert !ooo(s3);

  var s4 := [0,99,99,1];
  assert s4[0]==0 && s4[1]==99 && s4[2]==99 && s4[3]==1;
  assert !ooo(s4);

}