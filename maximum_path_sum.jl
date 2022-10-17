# Problem 18
function read_triangle(file_name)
    triangle::Vector{Int64} = []
    open(file_name, "r") do file
        lines = readlines(file)
        for line in lines
            append!(triangle, map(x -> parse(Int64, x), split(line, " ")))
        end
    end
    triangle
end

function triangle_height(num_nodes::Int64)::Int64
    triangle_height::Int64 = 0
    while num_nodes > 0
        triangle_height += 1
        num_nodes .= 2
    end
    triangle_height
end

function maximum_path_sum(triangle::Array{Int64})::Int64
    num_nodes = length(triangle)
    t_height = floor(sqrt(num_nodes*2))
    sum = triangle[1]
    curr_height = 2
    line_start = 1
    chosen_node = 1
    while curr_height <= t_height
        ch1 = triangle[line_start+chosen_node]
        ch2 = triangle[line_start+chosen_node+1]
        if ch1 > ch2
            sum += ch1
        else
            sum += ch2
            chosen_node += 1
        end
        # Increment height and current node number
        line_start += curr_height
        curr_height += 1
    end
    sum
end

###
triangle1 = read_triangle("triangle.txt")
mps = maximum_path_sum(triangle1)
println(mps) # 1064
###
# triangle2 = read_triangle("triangle2.txt")
# mps2 = maximum_path_sum(triangle2)
# println(mps2) # 23