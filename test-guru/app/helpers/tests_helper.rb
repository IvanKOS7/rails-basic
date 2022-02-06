module TestsHelper

  def test_level(test)
    case test.level
    when 0
      'elementary'
    when 5
      'middle'
    else
      test.level
    end
  end

end
