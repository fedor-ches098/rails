class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @user_badges = []
  end

  def reward!
    titles.each do |title|
      badge = Badge.find_by(title: title) 
      @user_badges << badge if send(title, badge)
    end
    @user_badges
  end

  def first_try(_blank)
    @user.tests.where(id: @test.id).count == 1 && @test_passage.success?
  end

  def certain_level(badge)
    unless @user.badges.include? badge
      Test.where(level: badge.rule).count == user_tests_by_level(badge.rule).count
    end
  end

  def backend_category(badge)
    unless @user.badges.include? badge
      Test.all.where(category_id: category_id(badge.rule)).count == user_tests_by_category(category_id(badge.rule)).count
    end
  end

  private

  def titles
    Badge.all.pluck(:title)
  end

  def user_tests
    @user.test_passages.joins(:test).where(passed: true)
  end

  def user_tests_by_level(level)
    user_tests.where(tests: {level: level})
  end

  def category_id(category_name)
    category_id = Category.find_by(title: category_name)
  end

  def user_tests_by_category(category_id)
    user_tests.where(tests: {category_id: category_id})
  end
end
