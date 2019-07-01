#require 'pry'
require 'io/console'

class Account
	attr_reader:name,:balance
	

	def initialize(name,balance=1000)
		@name = name 
		@balance = balance
    @pin = 789
    @input_pin = nil
	end

		private
	     #       def pin
			   # @pin = 789
	     #       end

	           def pin_Check
	        	  puts "Welcome to the Banking System,#{@name}\n"+
	        	  "To access your account,please enter the pin"
	        	  @input_pin=STDIN.noecho(&:gets).chomp.to_i    
	           end
	        
	        def pin_error
	        	return "Access denied:incorrect PIN"
	        end
            
            public
            def access
              @input_pin ||= pin_Check
              if @input_pin == @pin
                puts "Input d:to deposite Money\n"+
                    "s:To show Balance\n"+
                    "w:To withdraw Money\n"+
                    "q:Quit"
                action=gets.chomp.downcase
                check=action
                case action
              		when "d"
              			deposite
              		when "s"
              			display_balance
              		when "w"
              			withdraw
              		when "q"
        				    exit
                  else
                    puts "Please enter from available inputs"
                    until @action!=@check do 
                      access
                    end
                end
              else
                puts "Please enter valid pin no"
                pin_Check
                access
              end             
            end

            def amount
            	puts "Input the Money"
              @val = gets.chomp 
              @money = @val.to_i
              @fin = @money.to_s
              if @val != @fin || 0>=@money 
                puts "enter valid amount"
                amount
              end
              @money
            end

      			def over_error
      				puts "Insufficient balance"
              withdraw
      			end

      			def deposite
      				@balance+= amount
      				puts "Deposited:#{@money}\n"+"updated balance:Rs.#{@balance}"
              access
      			end

      			def display_balance
      				puts "Balance:Rs.#{@balance}"
              access
      			end

      			def withdraw   
      				if  amount <= @balance 
      					@balance -= @money
      					puts "withdrew:Rs.#{@money}\n" + "Updated balance:Rs.#{@balance}"
                access 
                else
                  puts over_error
               end 
            end
          end
                        
          


            		checking_account=Account.new("sowmya")
            		checking_account.access
                       