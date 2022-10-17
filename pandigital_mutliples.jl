function largest_pandigital()
    maximum = 0
    for n in 1:10000
        sum = n
        curr = 2
        while (sum / 10^8) < 1
            s = n*curr
            sum = sum*(10^length(digits(s))) + s
            curr += 1
        end
        if length(digits(sum)) == 9 && sum > maximum
            maximum = sum
        end 
    end
    maximum
end

largest_pandigital()
# Theoretical limit: 999999999
# Possible Ranges:
# 1-9 (e.g. 918273645)
# 30-39 (e.g. 306090120)
# 100-333 (e.g. 333666999)
# 9000-10000 (e.g. 900018000) --> likely in here

