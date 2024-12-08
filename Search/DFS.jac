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

walker DFS {

    has number: int;
    has traversal: list;

    can init(){
        self.number = 0;
        self.traversal = [];
    }


    can traverse with Node entry {
        if here.val not in self.traversal{
            here.stack = [here-->];
            self.traversal.append(here.val);
        }
        print(self.traversal);
        if(len(here.stack) !=0)
        {
            top = here.stack.pop();
            top.prev = here;
            # print("TOP",top);
            visit[top];
        }
        else
        {
            if(here.prev){
                visit[here.prev];
            }
            else
            {
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
    a spawn DFS();

}