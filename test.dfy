function method f() returns(i : int) 
{
    return 2; 
}

method Main() {
    var v := f();
    print "v = ", v, '\n';  
}