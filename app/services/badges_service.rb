class BadgesService

  attr_reader :current_user, :test_passage, :badges

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
    @badges = Badge.all
    assign_badges if test_passage.test_passed?
  end

  def assign_badges
    @badges.each do |b|
      if self.send "all_tests_passed_with_#{b.badge_type}?", b.type_param
        @current_user.badges.push(b)
      end
    end
  end

  def all_tests_passed_with_category?(category_title)
    current_user.test_passages.where(test_passed: true).pluck(:test_id).uniq.sort == Category.find_by(title: category_title).tests.ids
  end

  def all_tests_passed_with_first_try?(*)
   !current_user.test_passages.where(:test_id => test_passage.test.id).many?
  end

  def all_tests_passed_with_level?(level)
   current_user.test_passages.where(test_passed: true).joins(:test).where(test: {level: level}).pluck(:test_id).uniq ==  Test.where(level: test_passage.test.level).ids
  end

end
