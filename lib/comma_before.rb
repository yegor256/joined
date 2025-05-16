# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

# Joins elements of array.
#
# Author:: Ivan Ivanchuk (l3r8y@duck.com)
# Copyright:: Copyright (c) 2025 Yegor Bugayenko
# License:: MIT
class String
  # Inserts comma before given string, and removes it after the give string.
  # @param [String] string that we moving around.
  def comma_before(string)
    gsub(/"([^#{string}]+)#{string}\s*,/, '"\1,"')
  end
end
