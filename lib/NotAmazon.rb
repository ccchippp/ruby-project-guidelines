class NotAmazon
    
    @@username = ""
    @@user = nil

    def self.user
        @@user
    end

    def self.user=(user)
        @@user = user
    end

    def self.username
        @@username
    end

    def self.username=(username)
        @@username = username
    end

    def self.reponse
        temp = gets.chomp
        if temp == "yes" || temp == "no"
            return temp
         else
             puts "Please enter yes or no."
             NotAmazon.reponse
        end
    end

    def self.open_store
        puts "Hello welcome to NotAmazon™"
        puts "Please enter your Username: "
        NotAmazon.username = gets.chomp
        NotAmazon.user = User.create(username: NotAmazon.username)
        puts "Hello #{NotAmazon.username}"
        puts "How can we help you? Want to buy something? (yes or no)"
        answer = NotAmazon.reponse
        if answer == "yes"
            NotAmazon.make_purchase(NotAmazon.user)
            puts "Thank you for your visit!"
        elsif answer == "no"
            puts "WHY YOU WASTING MY TIME THEN! LEAVE I HAVE OTHER CUSTOMERS... "
        end
        puts "Make sure to leave 5 stars on yelp."
    end

    def self.make_purchase(user)
        puts "What would you like to purchase from our selection: "
    end

end

NotAmazon.open_store