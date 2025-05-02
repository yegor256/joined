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
end
