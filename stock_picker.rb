def stock_picker(prices_string)
    
    prices = prices_string.collect {|i| i.to_i}
    
    if prices.length < 2
        puts "I need more data to process!"
        return nil
    end
    
    best_profit = prices[1] - prices[0]
    best_dates = [0, 1]
    
    prices.each_with_index do |buy_price, buy_day|
        (buy_day...prices.length).each_with_index do |sell_day|
            sell_price = prices[sell_day]
            if (sell_price - buy_price) > best_profit
                best_profit = sell_price - buy_price
                best_dates = [buy_day+1, sell_day+1]
            end
        end
    end
    
    best_dates
    
end

def welcome
    puts "Welcome to our super professional stock information service"
    puts "Here we help you choose the best buy and sell dates."
    puts "So what are the prices?"
    prices = gets.chomp.split(", ").to_a
    puts "Calculating..."
    puts "Calculating......"
    puts "Here's the result!"
    puts stock_picker(prices).inspect
    puts "See you next time."
end



welcome
    