datatype Tree<T> = Leaf(T) | Node1(T, Tree<T>) | Node2(T,Tree<T>,Tree<T>)

method Print(t:Tree<int>)
{ match t
    case Leaf(n) => print n, ' ';
    case Node1(n,l) => { Print(l); print n, ' '; }
    case Node2(n,l,r) => { Print(l); print n, ' '; Print(r);}
}

method Main() {
    var leaf1:Tree<int> := Leaf(1);
    var leaf2:Tree<int> := Leaf(2);
    var leaf3:Tree<int> := Leaf(3);
    var leaf4:Tree<int> := Leaf(4);
    var t5:Tree<int> := Node2(5, leaf1, leaf2); // Binary tree
    var t6:Tree<int> := Node2(6, leaf3, leaf4); // 7
    var t7:Tree<int> := Node2(7, t5, t6); // 5 6
    Print(t7); print '\n'; // 1 2 3 4
}