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