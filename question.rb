class Question
  attr_reader :answer
  def initialize
    operator = %i[+ - *]
    @returned_operator = operator.sample
    @first = rand(1...20)
    @second = rand(1...20)
    @answer = @first.public_send(@returned_operator, @second)
  end

  def get
    "What is #{@first} #{@returned_operator} #{@second}?"
  end
end
