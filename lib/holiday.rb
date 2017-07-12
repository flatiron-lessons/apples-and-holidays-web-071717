require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, list|
        list << supply
      end
    end
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :spring
      holiday.each do |holiday, list|
        list << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash.each do |seasons, holiday|
    if seasons == season
      holiday_hash[season][holiday_name] = supply_array
    end
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  supply_array = []

  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |holiday, value|
        supply_array << value
      end
    end
  end

  supply_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
    puts "#{season.to_s.capitalize}:"
    holidays.each do |holiday, value|
      holiday_string = holiday.to_s
      holiday_array = holiday_string.split("_")
      holiday_array.each do |element|
        element.capitalize!
      end
      holiday_string = holiday_array.join(" ")
      puts "  #{holiday_string}: #{value.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays_with_bbq = []
  holiday_hash.each do |seasons, holidays|
    holidays.each do |holiday, list|
      if list.include? "BBQ"
        holidays_with_bbq << holiday
      end
    end
  end
  holidays_with_bbq
end
