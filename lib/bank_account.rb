class BankAccount
    def initialize(name)
        @name = name 
        @balance = 1000 
        @status = "open"
    end 
    attr_reader :name 
    attr_accessor :balance 
    attr_accessor :status 
    def deposit(amount)
        @balance += amount 
    end 
    def display_balance 
        "Your balance is $#{@balance}."
    end 
    def valid?
        if @status == "open" && @balance > 0 
            return true 
        end 
        return false 
    end 
    def close_account 
        @status = "closed"
    end 
end
