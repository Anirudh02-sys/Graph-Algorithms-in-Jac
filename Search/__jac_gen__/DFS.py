from __future__ import annotations
from jaclang.plugin.feature import JacFeature as _Jac
from jaclang.plugin.builtin import *
from dataclasses import dataclass as __jac_dataclass__

@_Jac.make_node(on_entry=[], on_exit=[])
@__jac_dataclass__(eq=False)
class Node(_Jac.Node):
    val: str
    visited: bool

    def __init__(self, val: str) -> None:
        self.visited = False
        self.val = val

@_Jac.make_walker(on_entry=[_Jac.DSFunc('traverse')], on_exit=[])
@__jac_dataclass__(eq=False)
class DFS(_Jac.Walker):
    number: int
    traversal: list

    def __init__(self) -> None:
        self.number = 0
        self.traversal = []

    def traverse(self, _jac_here_: Node) -> None:
        if _jac_here_.visited == False:
            print(f'Visiting Node {self.number}:', _jac_here_.val)
            _jac_here_.visited = True
            self.traversal.append(_jac_here_.val)
            print('Current Traversal: ', self.traversal)
            self.number += 1
            if _Jac.visit_node(self, _Jac.edge_ref(_jac_here_, target_obj=None, dir=_Jac.EdgeDir.OUT, filter_func=None, edges_only=False)):
                pass
a = Node('A')
b = Node('B')
c = Node('C')
d = Node('D')
e = Node('E')
f = Node('F')
_Jac.connect(left=a, right=b, edge_spec=_Jac.build_edge(is_undirected=False, conn_type=None, conn_assign=None))
_Jac.connect(left=a, right=c, edge_spec=_Jac.build_edge(is_undirected=False, conn_type=None, conn_assign=None))
_Jac.connect(left=b, right=d, edge_spec=_Jac.build_edge(is_undirected=False, conn_type=None, conn_assign=None))
_Jac.connect(left=b, right=e, edge_spec=_Jac.build_edge(is_undirected=False, conn_type=None, conn_assign=None))
_Jac.connect(left=c, right=f, edge_spec=_Jac.build_edge(is_undirected=False, conn_type=None, conn_assign=None))
_Jac.connect(left=e, right=f, edge_spec=_Jac.build_edge(is_undirected=False, conn_type=None, conn_assign=None))
_Jac.spawn_call(a, DFS())