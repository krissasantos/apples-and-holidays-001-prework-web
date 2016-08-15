require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array


  holiday_hash.each do |season, event|
    if season == :summer
        event.each do |day, stuff|
          if day == :fourth_of_july
            stuff.each_with_index do |stuffing, idx|
              return stuffing if idx == 1
            end
          end
        end
    end
  end

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, event|
    if season == :winter
        event.each do |day, stuff|
          if day == :new_years || day == :christmas
            stuff << "Balloons"
          end
        end
    end
    
  end
  
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, event|
    if season == :spring
      event.each do |holiday, stuff|
        stuff << "Grill" if holiday == :memorial_day
        stuff << "Table Cloth" if holiday == :memorial_day
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  final_stuff = []
  holiday_hash.each do |season, event|
    if season == :winter
        event.each do |day, stuff|
          final_stuff << stuff
        end
    end
  end
  final_stuff.flatten
  
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.map do |season, event|
   
      puts season.to_s.capitalize + ":"

      event.map do |holiday, stuff|
        final__holiday_format = []
        
        holi = holiday.to_s.split(/[^a-zA-Z]/)
        holi.map! do |word|
            final__holiday_format << word.capitalize! unless word == "_" 
        end
        puts  "  #{final__holiday_format.join(" ")}: #{stuff.join(", ")}"
      
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  final_bbq_holidays = []
  holiday_hash.each do |season, event|
   
      event.each do |holiday, stuff|
         final_bbq_holidays << holiday if stuff.include?("BBQ")
      end
   
  end
  final_bbq_holidays
end







