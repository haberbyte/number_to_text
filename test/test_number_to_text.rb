require 'test_helper'

class TestNumberToText < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NumberToText::VERSION
  end

  def test_negative_numbers
    assert_equal 'minus eins', NumberToText.convert(-1)
    assert_equal 'minus zwei', NumberToText.convert(-2)
    assert_equal 'minus drei', NumberToText.convert(-3)
  end

  def test_number_null
    assert_equal 'null', NumberToText.convert(0)
  end

  def test_numbers_from_one_to_ten
    assert_equal 'eins', NumberToText.convert(1)
    assert_equal 'zwei', NumberToText.convert(2)
    assert_equal 'drei', NumberToText.convert(3)
    assert_equal 'vier', NumberToText.convert(4)
    assert_equal 'fünf', NumberToText.convert(5)
    assert_equal 'sechs', NumberToText.convert(6)
    assert_equal 'sieben', NumberToText.convert(7)
    assert_equal 'acht', NumberToText.convert(8)
    assert_equal 'neun', NumberToText.convert(9)
    assert_equal 'zehn', NumberToText.convert(10)
  end

  def test_multiples_of_thousand
    assert_equal 'eintausend', NumberToText.convert(1000)
    assert_equal 'eine Million', NumberToText.convert(1000 * 1000)
    assert_equal 'eine Milliarde', NumberToText.convert(1000 * 1000 * 1000)
    assert_equal 'eine Billion', NumberToText.convert(1000 * 1000 * 1000 * 1000)
  end

  def test_big_number_composition
    text = 'eine Million zweihundertdreiunddreißigtausendvierhundertvierunddreißig'
    assert_equal text, NumberToText.convert(1_233_434)
  end

  def test_passing_numbers_as_strings
    assert_equal 'neun', NumberToText.convert('9')
  end
end
