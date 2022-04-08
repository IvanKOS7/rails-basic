module TestsHelper

 TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze


  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def show_svg(file)
    # File.open("app/assets/images/#{path}", "rb") do |file|
      raw file.read
    # end
  end

end
