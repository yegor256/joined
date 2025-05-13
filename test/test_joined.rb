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

  def test_with_invalid_options
    exception = assert_raises ArgumentError do
      %w[one two].joined(passing: 'invalid option')
    end

    assert_equal 'unknown keyword: :passing', exception.message
  end
end
