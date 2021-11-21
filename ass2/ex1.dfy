lemma {:induction false} LemCNN(n:nat)
requires n >= 0;
ensures (n * (n+1)) % 2 == 0; // what we are trying to prove
{
  if n == 0 {assert n * (n + 1) % 2 == 0;} else //base case
  {
    LemCNN(n - 1);                               //Inductive Hypothesis
    assert n * (n-1) == n * n - n;               //Case n-1 expanded
    assert n * (n-1) == n * n + n - 2*n;
    assert (n * (n+1) - (2*n)) % 2 == 0;
    assert ((n-1) * n) % 2 == (n * (n+1) - (2*n)) % 2; //If true for one side true for other
    assert (n * (n+1)) % 2 == 0;                //Prove that it is true
  }
}

function LemCNNTester(n:nat):nat
requires n >= 0;
{
  (n * (n+1)) % 2
}