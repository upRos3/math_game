class Question
  attr_reader :answer
  def initialize
    @first = rand(1...20)
    @second = rand(1...20)
    @answer = @first + @second
  end

  def get
    return "What is #{@first} + #{@second}?"
  end
end
