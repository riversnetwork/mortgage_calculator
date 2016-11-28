class Mortgage
    
    attr_accessor :mortgage_amount, :interest_rate, :mortgage_period, :down_payment, :veteran_status, :monthly_rate, :monthly_payment, :total_payments
    
    # Get house price and confirm to user
    def get_info
        self.get_mortgage
        self.get_rate
        self.get_length
        self.get_down_payment
    end
        
    def get_mortgage
        print "Mortgage amount to be financed: "
        @mortgage_amount = gets.chomp.to_i
        puts "Mortgage amount is #{@mortgage_amount}"
    end
    
    # Get interest rate and confirm to user
    def get_rate 
        print "Interest rate on loan: "
        @interest_rate = gets.chomp.to_f
        @interest_rate = format("%.2f", @interest_rate).to_f
        puts "Interest rate is #{@interest_rate}%"
    end
    
    # Get mortgage period and display to user
    def get_length
        print "Mortgage period in years: "
        @mortgage_period = gets.chomp.to_i
        puts "Mortgage period is #{@mortgage_period} years."
    end 
    
    # Get down payment
    def get_down_payment
        print "Down payment: "
        @down_payment = gets.chomp.to_i
        if @down_payment == 0
            puts "Zero down!"
            print "Are you a veteran? "
            input = gets.chomp.downcase
            if input == "y" || input =="yes"
                @veteran_status = true
                puts "Thank you for your service!"
            else
                @veteran_status = false
                puts "No worries, lets get to your monthly payment."
            end
        else
            puts "$#{@down_payment} dollars down!!"
        end
    end
    
    # Comfirm calculation variables
    def confirmation
        confirmation = false
        while confirmation != true
            print "You want to know the monthly payments on a $#{@mortgage_amount} mortgage with $#{@down_payment} down over #{@mortgage_period} years, correct? (y/n) "
            input = gets.chomp.downcase
            if input == "y" || input == "yes" 
                confirmation = true
            elsif input == "n" || input == "no"
                puts "Let's get the correct info!"
                get_info
            else
                puts "That's an invalid entry!"
            end
        end
    end
    
    # Calculate monthly payments
    def calculate_monthly_payment
        @monthly_rate = (@interest_rate / 100 / 12)
        @total_payments = @mortgage_period * 12
        @monthly_payment = ((@monthly_rate/(1-(1 + @monthly_rate)**(-1 * @total_payments)))) * (@mortgage_amount - @down_payment)
        formatted_payment = format("$%0.2f", @monthly_payment) 
        puts "You monthly payment will be #{formatted_payment}."
    end
    
    # Display monthly mortgage payments
    #puts "Your monthly payments will be #{monthly_payment}"




end

search = Mortgage.new
search.get_info
search.confirmation
search.calculate_monthly_payment
