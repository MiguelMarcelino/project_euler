# Problem 4
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

# Just a test function
function is_palindrome(num::Int64)
    temp::Int64 = num
    n::Int64 = 0
    while temp > 0
        n = n*10 + temp%10
        temp = temp÷10
    end
    n == num
end

@assert is_palindrome(646) == true
@assert is_palindrome(464) == true
@assert is_palindrome(1001) == true

find_largest_palindrome_2dim(3)
