class BadgesService

  attr_reader :test_passage, :badges

  def initialize(test_passage)
    @test_passage = test_passage
    @badges = Badge.all
    @user = test_passage.user
    assign_badges
  end

  def assign_badges
    @badges.each do |b|
      if self.send "all_tests_passed_with_#{b.badge_type}?", b.type_param
        @user.badges.push(b)
      end
    end
  end

  def all_tests_passed_with_category?(category_title)
    @user.test_passages.where(test_passed: true).pluck(:test_id).uniq.sort == Test.tests_categories_sort(category_title)
  end

  def all_tests_passed_with_first_try?(*)
    #я проверял много раз - это работает, бейдж выдается если тест проходится только с первой попытки
    #Returns true if there is more than one record.
   !@user.test_passages.where(test_passed: true, test_id: test_passage.test.id).many?
  end

  def all_tests_passed_with_level?(level)
    @user.test_passages.where(test_passed: true).joins(:test).where(test: {level: level}).pluck(:test_id).uniq ==  Test.where(level: test_passage.test.level).ids
  end

end
