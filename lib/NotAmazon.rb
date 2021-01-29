class NotAmazon < ActiveRecord::Base
    
    @@username = ""
    @@backroom = {"coffee" => 16.00, "shirt" => 20.00, "socks" => 5.00}

    def self.backroom
        @@backroom
    end
    
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
            return false
        else
            return true
        end
    end

    #=> Main Store Method
    def self.open_store

        puts "Hello welcome to NotAmazon™"
        puts "Please enter your Username: "
        NotAmazon.username = gets.chomp

        # basically user login and checks if previously a customer or if owner
        if NotAmazon.username == "Owner" || NotAmazon.username == "owner"
            puts "Hello Sir I see that you are the owner."
            puts "What would you like to work on today?"
            puts "      <<1. Check Stock>>"
            puts "      <<2. Restock Inventory>>"
            puts "      <<3. Check List of All Customers>>"
            puts "      <<4. Check all Orders>>"
            puts "      <<5. Add New Item to Inventory>>"
            puts "  <<Exit>>"
            NotAmazon.owner_task
        elsif NotAmazon.user_in_database
            user = User.find_by(username: NotAmazon.username)
            puts "Hello #{NotAmazon.username}, Welcome back to NotAmazon, happy to see you again."
        else
            User.create(username: NotAmazon.username)
            user = User.find_by(username: NotAmazon.username)
            user_cart = Cart.create
            user.carts << user_cart
            puts "Hello #{NotAmazon.username}, Welcome to NotAmazon!"
        end

        if NotAmazon.username != "Owner" && NotAmazon.username != "owner"
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

        puts "Have A good day. Good Bye! ヽ(^‥^=ゞ)"
    end

    def self.make_purchase(user)
        cart = Cart.find_by(user_id: user.id)
        puts "Would you like to add to your cart? (yes or no)"
        answer = NotAmazon.reponse
        if answer == "yes"
            puts "What would you like to add? This is our current selection of what's in stock today: "
            if Item.all.empty?
                puts "Sorry looks like we're out of stock of everything. Please come back later after the owner restocks."
            else
                Item.display_all_items
                # code for making a purchase, add items to cart and then checkout when customer is ready
                # some code here
            end
        end
        if cart.items.empty?
            puts "Your cart is empty."
        end
    end

    # Task input for owner
    def self.owner_task
        reponse = gets.chomp
        if reponse == "1" #=> check Stock
            Item.display_all_items
        elsif reponse == "2" #=> restock inventory
            NotAmazon.backroom.each{|item_name, item_price| Item.create(item: item_name, price: item_price)}
        elsif reponse == "3" #=> check customer list
            User.display_all_users
        elsif reponse == "4" #=> check orders
            Orders.display_all_orders
        elsif reponse == "5" #=> add new item to inventory
            #code
            puts "you input 5"
        elsif reponse == "exit"
            puts "you input 'exit'"
        elsif reponse == "help"
            puts "<<** These are the task you can work on today. Please enter a digit <1 to 5> or enter 'exit' to quit out **>>"
            puts "      <<1. Check Stock >>"
            puts "      <<2. Restock Inventory>>"
            puts "      <<3. Check List of All Customers>>"
            puts "      <<4. Check all Orders>>"
            puts "      <<5. Add New Item to Inventory>>"
            puts "  <<Exit>>"
            NotAmazon.owner_task
        else
            puts "Sorry Boss but you need to enter a digit from 1 to 5 or 'exit' if you'd like to quit out."
            puts ">>** You can also enter help to see what you can work on today **<<"
            NotAmazon.owner_task
        end

        puts "Would you like to do another task?"
    end

end