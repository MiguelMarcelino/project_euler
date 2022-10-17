# Brute force
function collatz(n::Int64)
    temp = n
    seq_length = 1
    while temp != 1
        if iseven(temp)
            temp = temp÷2
        else
            temp = 3*temp+1
        end
        seq_length += 1
    end
    seq_length
end

function collatz_recursive(n::Int64)
    if n == 1
        return 1
    end
    next = 0
    if iseven(n)
        next = n÷2
    else
        next = 3*n+1
    end
    return 1 + collatz_recursive(next)
end


function find_collatz_under_one_million()
    len = 1
    number = 1
    for n in 1:1000000
        # collatz_res = collatz_recursive(n)
        collatz_res = collatz(n)
        if collatz_res > len
            number = n
            len = collatz_res
        end
    end
    (number, len)
end


find_collatz_under_one_million()