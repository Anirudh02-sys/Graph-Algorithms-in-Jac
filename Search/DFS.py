def dfs(graph, start_node):
    """
    Perform Depth-First Search on a graph.

    Args:
        graph: The graph represented as an adjacency list (dictionary).
        start_node: The node to start the search from.

    Returns:
        A list of visited nodes in DFS order.
    """
    visited = set()
    stack = [start_node]
    result = []

    while stack:
        node = stack.pop()
        if node not in visited:
            visited.add(node)
            result.append(node)
            stack.extend(graph[node])

    return result

# Example usage:
graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': ['F'],
    'F': []
}

print("DFS traversal:", dfs(graph, 'A'))