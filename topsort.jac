#*

This is a Jac program demonstrating Topological Sort.

Key Terms:
1. Topological Ordering:
Ordering of the nodes in a DAG 
where for each directed edge from node A to B, 
node A appears before node B in ordering.

2. Topological Sort


*#

node Node {
    has val: str;
    has visited: bool;
    has prev: node;
    has stack: list;

    can init(val: str){
        self.visited = False;
        self.val = val;
        self.prev = None;
        self.stack = [];
    }
}

walker DFS_With_Topsort {

    has number: int;
    has traversal: list;
    has topsort: list;

    can init(){
        self.number = 0;
        self.traversal = [];
        self.topsort = [];
    }

    can traverse with Node entry {
        if here.val not in self.traversal{
            here.stack = [here-->];
            self.traversal.append(here.val);
            print(self.traversal);
        }
        if(len(here.stack) !=0)
        {
            top = here.stack.pop();
            top.prev = here;
            visit[top];
        }
        else
        {
            if(here.prev){
                if(here.visited == False)
                {
                    here.visited = True;
                    self.topsort.append(here.val);
                }
                visit[here.prev];
            }
            else
            {
                self.topsort.append(here.val);
                print("Topological Ordering: ",self.topsort[::-1]);
                print("Finished");
            }
        }
    }


#*
 Go to node , check if its visited , if not then mark. Pick one node that follows , which has not been visited and move. 
 If you reach a node from where you cant make any jumps, then backtrack

 Backtrack -> Track prev nodes , back to prev node.

*#

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

    a<++>[b,c];
    b<++>[d,e];
    c<++>f;
    e<++>f;

    # Spawn Walker
    a spawn DFS_With_Topsort();

}