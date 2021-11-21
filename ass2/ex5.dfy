method Prison(all: set<nat>, inlight:bool) returns (swch: set<nat>)
requires |all| > 1
ensures |swch|+1 == |all|
ensures swch < all
decreases *
{

}
