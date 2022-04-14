class BadgesService

  attr_reader :test_passage, :badges

  def initialize(test_passage)
    @test_passage = test_passage
    @badges = Badge.all
    assign_badges
  end

  def assign_badges
    @badges.each do |b|
      if self.send "all_tests_passed_with_#{b.badge_type}?", b.type_param
        test_passage.user.badges.push(b)
      end
    end
  end

  def all_tests_passed_with_category?(category_title)
    test_passage.user.test_passages.where(test_passed: true).pluck(:test_id).uniq.sort == Test.all_test_with_category.where(category: {title: category_title}).ids
  end

  def all_tests_passed_with_first_try?(*)
   !test_passage.user.test_passages.where(test_passed: true, :test_id => test_passage.test.id).many?
  end

  def all_tests_passed_with_level?(level)
    test_passage.user.test_passages.where(test_passed: true).joins(:test).where(test: {level: level}).pluck(:test_id).uniq ==  Test.where(level: test_passage.test.level).ids
  end

end
