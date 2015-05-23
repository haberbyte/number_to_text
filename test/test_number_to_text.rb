# encoding: utf-8

require 'test_helper'

class TestNumberToText < Minitest::Test
  include NumberToText

  def test_that_it_has_a_version_number
    refute_nil ::NumberToText::VERSION
  end

  def test_negative_numbers
    assert_equal 'minus eins', number_to_text(-1)
    assert_equal 'minus zwei', number_to_text(-2)
    assert_equal 'minus drei', number_to_text(-3)
  end

  def test_number_null
    assert_equal 'null', number_to_text(0)
  end

  def test_numbers_from_one_to_ten
    assert_equal 'eins', number_to_text(1)
    assert_equal 'zwei', number_to_text(2)
    assert_equal 'drei', number_to_text(3)
    assert_equal 'vier', number_to_text(4)
    assert_equal 'fünf', number_to_text(5)
    assert_equal 'sechs', number_to_text(6)
    assert_equal 'sieben', number_to_text(7)
    assert_equal 'acht', number_to_text(8)
    assert_equal 'neun', number_to_text(9)
    assert_equal 'zehn', number_to_text(10)
  end

  def test_multiples_of_thousand
    assert_equal 'eintausend', number_to_text(1000)
    assert_equal 'eine Million', number_to_text(1000 * 1000)
    assert_equal 'eine Milliarde', number_to_text(1000 * 1000 * 1000)
    assert_equal 'eine Billion', number_to_text(1000 * 1000 * 1000 * 1000)
  end

  def test_big_number_composition
    text = 'eine Million zweihundertdreiunddreißigtausendvierhundertvierunddreißig'
    assert_equal text, number_to_text(1_233_434)
  end

  def test_passing_numbers_as_strings
    assert_equal 'neun', number_to_text('9')
  end
end
