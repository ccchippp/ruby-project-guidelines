class NotAmazon
    
    @@username = ""
    
    def self.username
        @@username
    end

    def self.username=(username)
        @@username = username
    end

    #=> helper method checking for response to be yes or no
    def self.reponse
        temp = gets.chomp
        if temp == "yes" || temp == "no"
            return temp
         else
             puts "Please enter yes or no: "
             NotAmazon.reponse
        end
    end

    #=> helper method checks if user exists in database
    def self.user_in_database
        if !(User.find_by(username: NotAmazon.username))
            return true
        else
            return false
        end
    end

    #=> Main Store Method
    def self.open_store
        puts "Hello welcome to NotAmazon™"
        puts "Please enter your Username: "
        NotAmazon.username = gets.chomp
        if NotAmazon.user_in_database
            user = User.find_by(username: NotAmazon.username)
            puts "Hello #{NotAmazon.username}, Welcome back to NotAmazon, happy to see you again."
        else
            user = User.create(username: NotAmazon.username)
            puts "Hello #{NotAmazon.username}, Welcome to NotAmazon!"
        end
        puts "How can we help you? Want to buy something? (yes or no)"
        answer = NotAmazon.reponse
        if answer == "yes"
            NotAmazon.make_purchase(user)
            puts "Thank you for your visit!"
        elsif answer == "no"
            puts "WHY YOU WASTING MY TIME THEN! LEAVE I HAVE OTHER CUSTOMERS... "
        end
        puts "Make sure to leave 5 stars on yelp."
    end

    def self.make_purchase(user)
        # if user.my_cart == []
        #     puts "What would you like to purchase from our selection: "
        # else
        #     puts "Would you like to add to your previous or complete your purchase? (add or complete)"
        # end
    end

end