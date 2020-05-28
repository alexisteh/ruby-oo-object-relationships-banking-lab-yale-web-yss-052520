class Transfer
  def initialize(sender,receiver,amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end 
  attr_reader :sender 
  attr_reader :receiver
  attr_reader :amount  
  attr_accessor :status 

  def valid?
    if @sender.valid? && @receiver.valid?
      return true 
    end 
    return false 
  end 
  def execute_transaction 
    if self.valid? && @status == "pending" && @sender.balance > @amount 
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete" 
    else 
      @status = "rejected" 
      return "Transaction rejected. Please check your account balance."
    end 
  end 
  def reverse_transfer 
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end 
  end 
end
