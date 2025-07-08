# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require_relative 'test__helper'
require_relative '../lib/joined'

# Test for max parameter.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2025 Yegor Bugayenko
# License:: MIT
class TestjoinedMax < Minitest::Test
  def test_with_max_parameter_when_array_has_more_elements
    assert_equal 'one, two, three, four, etc.', %w[one two three four five six].joined(max: 4)
  end

  def test_with_max_parameter_when_array_has_exact_elements
    assert_equal 'one, two, three, and four', %w[one two three four].joined(max: 4)
  end

  def test_with_max_parameter_when_array_has_fewer_elements
    assert_equal 'one, two, and three', %w[one two three].joined(max: 4)
  end

  def test_with_max_parameter_and_two_elements
    assert_equal 'one and two', %w[one two].joined(max: 4)
  end

  def test_with_max_parameter_and_one_element
    assert_equal 'one', %w[one].joined(max: 4)
  end

  def test_with_max_parameter_and_empty_array
    assert_equal '', [].joined(max: 4)
  end

  def test_with_max_equals_one_and_multiple_elements
    assert_equal 'one, etc.', %w[one two three four].joined(max: 1)
  end

  def test_with_max_equals_two_and_multiple_elements
    assert_equal 'one, two, etc.', %w[one two three four].joined(max: 2)
  end

  def test_with_max_equals_three_and_multiple_elements
    assert_equal 'one, two, three, etc.', %w[one two three four five].joined(max: 3)
  end

  def test_max_with_oxford_false
    assert_equal 'one, two, three, four, etc.', %w[one two three four five six].joined(max: 4, oxford: false)
  end

  def test_max_with_custom_connectors
    result = %w[one two three four five].joined(max: 4, words_connector: '; ',
                                                last_word_connector: '; and also ')

    assert_equal 'one; two; three; four, etc.', result
  end

  def test_max_with_comma_before_and_quoted_items
    list = ['"one"', '"two"', '"three"', '"four"', '"five"']

    assert_equal '"one," "two," "three," "four", etc.', list.joined(max: 4, comma_before: true)
  end

  def test_max_with_nil_value_behaves_like_no_max
    assert_equal 'one, two, three, four, and five', %w[one two three four five].joined(max: nil)
  end

  def test_max_with_zero_returns_empty_string
    assert_equal ', etc.', %w[one two three].joined(max: 0)
  end

  def test_max_with_very_large_array
    array = (1..100).map(&:to_s)
    result = array.joined(max: 5)

    assert_equal '1, 2, 3, 4, 5, etc.', result
  end

  def test_max_with_unicode_elements
    array = %w[α β γ δ ε ζ]

    assert_equal 'α, β, γ, δ, etc.', array.joined(max: 4)
  end

  def test_max_with_special_characters
    array = ['foo!', 'bar?', 'baz&', 'qux*', 'quux#']

    assert_equal 'foo!, bar?, baz&, etc.', array.joined(max: 3)
  end
end
