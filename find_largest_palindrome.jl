# Quadratic solution
function find_largest_palindrome_2dim(n_dims::Int)
    max = 10^n_dims - 1
    num = 0
    for i in reverse(0:max)
        for j in reverse(0:max)
            num = i*j
            n = num
            reversed = 0
            while n != 0
                reversed = reversed*10 + n%10
                n = Int64(trunc(n / 10))
            end
            if num == reversed
                return num
            end
        end
    end
end

find_largest_palindrome_2dim(3)
