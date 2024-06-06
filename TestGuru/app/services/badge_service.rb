class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def reward!
    Badge.all.map do |badge|
      @user.badges.push(badge) if send(badge.rule, badge)
    end
  end

  def first_try(_blank)
    @user.tests.where(id: @test.id).count == 1 && @test_passage.success?
  end

  def certain_level(badge)
    if @user.badges.exclude?(badge)
      Test.where(level: badge.value).count == user_tests_by_level(badge.value).count
    end
  end

  def backend_category(badge)
    if @user.badges.exclude?(badge)
      Test.by_category(badge.value).count == user_tests_by_category(badge.value).count
    end
  end

  private

  def user_tests
    @user.test_passages.joins(:test).where(passed: true)
  end

  def user_tests_by_level(level)
    user_tests.where(tests: {level: level})
  end

  def user_tests_by_category(category_name)
    @user.tests.by_category(category_name).joins(:test_passages).where(test_passages: {passed: true})
  end
end
