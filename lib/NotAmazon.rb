class NotAmazon < ActiveRecord::Base
    
    @@username = ""

    # defualt items store always tends to have
    @@backroom = {
        :coffee => 5.10, :shirt => 20.00, :cookie => 2.50,
        :orange_soda => 2.75, :pants => 30.00, :apple_pie => 1.50,
        :fruit_punch => 2.50, :underwear => 7.20, :ramen => 0.25,
        :gatorade => 1.75, :socks => 9.50, :chips => 2.00,
        :water => 0.50, :hat => 11.25, :bit_coin => 36247.00
    }

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
    def self.response
    temp = gets.chomp
        if temp == "yes" || temp == "no"
            return temp
         else
             puts "Please enter yes or no: "
             NotAmazon.response
        end
    end

    #=> helper method checks if user exists in database
    # def self.user_in_database
    #     if !(User.find_by(username: NotAmazon.username))
    #         return false
    #     else
    #         return true
    #     end
    # end

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
        elsif User.find_by(username: NotAmazon.username)
            user = User.find_by(username: NotAmazon.username)
            puts "Hello #{NotAmazon.username}, Welcome back to NotAmazon, happy to see you again."
        else
            User.create(username: NotAmazon.username)
            user = User.find_by(username: NotAmazon.username)
            user_cart = Cart.create
            user.carts << user_cart
            puts "Hello #{NotAmazon.username}, Welcome to NotAmazon!"
        end

        # If user is the owner, ask if they wanna buy something
        if NotAmazon.username != "Owner" && NotAmazon.username != "owner"
            puts "How can we help you? Want to buy something? (yes or no)"
            answer = NotAmazon.response
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

    # purchase method for user, adds items to cart and lets user checkout or just leave
    def self.make_purchase(user)

        cart = Cart.find_by(user_id: user.id)
        puts "Would you like to add to your cart? (yes or no)"
        answer = NotAmazon.response

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

        response = gets.chomp

        # owner tasks
        if response == "1" #=> check Stock
            Item.display_all_items
        elsif response == "2" #=> restock defualt items inventory (item database)
            NotAmazon.backroom.each{|item_name, item_price| Item.create(item: item_name, price: item_price)}
            puts "All done restocking boss!"
        elsif response == "3" #=> check customer list
            User.display_all_users
        elsif response == "4" #=> check orders
            if Orders.all == []
                puts "There are currently no orders."
            else
                Orders.display_all_orders
            end
        elsif response == "5" #=> add new item to inventory
            puts "What's the name of the new item you're adding? (enter string)"
            item_name = gets.chomp
            puts "How much does #{item_name} cost? (enter integer or float)"
            item_price = gets.chomp.to_f
            new_item = Item.create(item: item_name, price: item_price)
            puts "New item >>#{new_item}<< has been added to the Inventory."
        elsif response == "exit" #=> exits
            puts "Ok! Peace out Boss! (☞ ͡° ͜ʖ ͡°)☞"
        else
            puts "Sorry Boss but you need to enter a digit from 1 to 5 or 'exit' if you'd like to quit out."
            NotAmazon.owner_task
        end

        # ask owner if they want to do more task if they didn't try to exit
        if response != "exit"
            puts "Would you like to do another task? (yes or no)"
            response = NotAmazon.response
            if response == "yes"
                puts "What would you like to work on today?"
                NotAmazon.owner_task
            else
                puts "Ok! Peace out Boss! (☞ ͡° ͜ʖ ͡°)☞"
            end            
        end

    end

end