mutable struct Node
    parent::Union{Node, Nothing}
    left::Union{Node, Nothing}
    right::Union{Node, Nothing}
    value::Int64
    Node() = new(nothing, nothing, nothing, nothing)
    Node(parent, left, right, value) = new(parent, left, right, value)
    # Node(left, right, value) = new(nothing, left, right, value)
    Node(value) = new(nothing, nothing, nothing, value)
end

function insert(node::Node, node_tree)
    # Assuming that there are no duplicate values
    if node.value > node_tree.value
        if node_tree.right === nothing
            node_tree.right = node
            node.parent = node_tree
        else
            insert(node, node_tree.right) 
        end
    else 
        if node_tree.left === nothing
            node_tree.left = node
            node.parent = node_tree
        else
            insert(node, node_tree.left) 
        end
    end
end

function inorder_successor(node::Node)::Node
    if node === nothing
        return nothing
    end

    if node.right !== nothing
        return getmostleft(node.right)
    end

    curr_node = node
    parent_node = node.parent
    while parent_node.right !== curr_node
        if curr_node.parent === nothing
            return curr_node
        end
        curr_node = parent_node
        parent_node = parent_node.parent
    end
    return curr_node
end

function getmostleft(node::Node)
    if node.left !== nothing
        return getmostleft(node.left)
    end
    return node
end

function print_tree()

end

# Example Tree
#               20
#        14            22
#      5    16
#         15  17


function test()
    root = Node(20)
    insert(Node(8), root)
end

test()