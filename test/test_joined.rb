# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require_relative '../lib/joined'

# Test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2025 Yegor Bugayenko
# License:: MIT
class Testjoined < Minitest::Test
  def test_simple
    assert_equal('', [].joined)
    assert_equal('apple', ['apple'].joined)
    assert_equal('apple and banana', %w[apple banana].joined)
    assert_equal('apple, banana, and orange', %w[apple banana orange].joined)
    assert_equal('apple, banana, orange, and pear', %w[apple banana orange pear].joined)
  end

  def test_without_oxford_comma
    assert_equal('', [].joined(oxford: false))
    assert_equal('apple', ['apple'].joined(oxford: false))
    assert_equal('apple and banana', %w[apple banana].joined(oxford: false))
    assert_equal('apple, banana and orange', %w[apple banana orange].joined(oxford: false))
    assert_equal('apple, banana, orange and pear', %w[apple banana orange pear].joined(oxford: false))
  end

  def test_with_words_connector
    assert_equal('one two, and three', %w[one two three].joined(words_connector: ' '))
    assert_equal('one & two, and three', %w[one two three].joined(words_connector: ' & '))
    assert_equal('onetwo, and three', %w[one two three].joined(words_connector: nil))
  end

  def test_with_last_word_connector
    assert_equal 'one, two, and also three', %w[one two three].joined(last_word_connector: ', and also ')
    assert_equal 'one, two and also three', %w[one two three].joined(last_word_connector: ' and also ')
    assert_equal 'one, twothree', %w[one two three].joined(last_word_connector: nil)
    assert_equal 'one, two three', %w[one two three].joined(last_word_connector: ' ')
    assert_equal 'one, two and three', %w[one two three].joined(last_word_connector: ' and ')
  end

  def test_with_last_word_connector_but_without_oxford_comma
    assert_equal 'one, two and also three', %w[one two three].joined(oxford: false, last_word_connector: ', and also ')
    assert_equal 'one, two and also three', %w[one two three].joined(oxford: false, last_word_connector: ' and also ')
    assert_equal 'one, twothree', %w[one two three].joined(oxford: false, last_word_connector: nil)
    assert_equal 'one, two three', %w[one two three].joined(oxford: false, last_word_connector: ' ')
    assert_equal 'one, two and three', %w[one two three].joined(oxford: false, last_word_connector: ' and ')
  end

  def test_two_elements
    assert_equal 'one and two', %w[one two].joined
    assert_equal 'one two', %w[one two].joined(last_word_connector: ' ')
  end

  def test_one_element
    assert_equal 'one', ['one'].joined
  end

  def test_with_invalid_options
    exception = assert_raises ArgumentError do
      %w[one two].joined(passing: 'invalid option')
    end

    assert_equal 'unknown keyword: :passing', exception.message
  end

  def test_quoted_items_with_comma_before
    given_list = ['"one"', '"two"', '"three"']

    assert_equal '"one," "two," and "three"', given_list.joined(comma_before: true)
    assert_equal '"one", "two", and "three"', given_list.joined(comma_before: false)
    assert_equal '"one", "two", and "three"', given_list.joined
    assert_equal '"one," "two" and "three"', given_list.joined(comma_before: true, oxford: false)
    assert_equal '"one", "two" and "three"', given_list.joined(comma_before: false, oxford: false)
    assert_equal '"one", "two" and "three"', given_list.joined(oxford: false)
  end

  def test_comma_before_only_handles_trailing_quotes
    assert_equal '"one"-fer, "two," and "three"', ['"one"-fer', '"two"', '"three"'].joined(comma_before: true)
  end

  def test_comma_before_ignores_trailing_whitespace
    assert_equal '"one," "two," and "three" ', ['"one" ', '"two" ', '"three" '].joined(comma_before: true)
  end
end
