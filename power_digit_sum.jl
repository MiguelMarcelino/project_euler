
function power_digit_sum(n, pow)
    power_res = n^+pow
    nums = 0
    while power_res > 0
        nums += power_res % 10
        power_res ÷= 10
    end
    nums
end

power_digit_sum(2, 15)