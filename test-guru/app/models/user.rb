class User < ApplicationRecord
  attr_reader :user_tests_arr

  def take_test
    @user_tests_arr = []
    pp Test.select(:id, :title).inspect
    puts "Select Test id from list"
    choice = gets.chomp.to_i
    @user_tests_arr << Test.find_by(id: choice)
  end

  def users_test(level)
    pp Test.find_by("level = ?", level)
  end
end
