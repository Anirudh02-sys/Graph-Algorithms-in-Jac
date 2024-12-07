# Breadth First Search algorithm
# Can use Adjacency List/ Adjacency Matrix/ Edge List

node Node {
    has val: str;
    has visited: bool;

    can init(val: str){
        self.visited = False;
        self.val = val;
    }
}

walker BFS {

    has number: int;
    has traversal: list;

    can init(){
        self.number = 0;
        self.traversal = [];
    }
    can traverse with Node entry {
        if(here.visited == False){
            print(f"Visiting Node {self.number}:", here.val);
            here.visited = True;
            self.traversal.append(here.val);
            print("Current Traversal: ",self.traversal);
            self.number+=1;
            visit[-->];
        }
    }

}


with entry {
    # Initialize Nodes
    a = Node('A');
    b = Node('B');
    c = Node('C');
    d = Node('D');
    e = Node('E');
    f = Node('F');

    # Connect Nodes

    a++>b;
    a++>c;
    b++>d;
    b++>e;
    c++>f;
    e++>f;

    # Spawn Walker
    a spawn BFS();

}