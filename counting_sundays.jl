# Problem 19
function get_month_days(n_month, n_year)
    "Given the month's number and the current year, 
    this method returns the number of days in the 
    given month"
    if n_month in [4,6,9,11]
        return 30
    elseif n_month in [1, 3, 5, 7, 8, 10, 12]
        return 31
    elseif n_month == 2
        if (n_year % 4 == 0 && n_year % 100 != 0) || 
                (n_year % 400 == 0)
            # leap year occurs on any year evenly divisible by 4, 
            # but not on a century unless it is divisible by 400
            return 28
        end
        return 29
    end
end

function sunday_count(start_year, start_month, start_day, max_year, max_month, max_day)
    # As 1 Jan 1900 was a Monday, we start on
    # the 7 Jan 1900, which is a Sunday.
    num_sundays = 0
    day = 7
    month = 1
    year = 1900
    # Reach start date before starting the count
    while year < start_year || month < start_month || day < start_day 
        day, month, year = update_date(day, month, year)
    end
    # Start count
    while year < max_year || month < max_month || day < max_day
        if day == 1
            num_sundays += 1
        end
        # Update day, month and year
        day, month, year = update_date(day, month, year)
    end
    num_sundays
end

function update_date(day, month, year)
    num_days = get_month_days(month, year)
    day += 7
    if day > num_days
        day = day % num_days
        month += 1
    end
    if month > 12
        month = 1
        year += 1
    end
    (day, month, year)
end

# start_year, start_month, start_day, max_year, max_month, max_day
sunday_count(1901, 1, 1, 2000, 12, 31)