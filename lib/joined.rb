# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

# Joins elements of array.
#
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2025 Yegor Bugayenko
# License:: MIT
class Array
  # Join strings into a single line, splitting them with comma
  # and placing "AND" between the last two items.
  #
  # @param [Boolean] oxford Should we place a comma before AND?
  # @return [String] The text generated
  def joined(oxford: true)
    return '' if empty?
    return first if length == 1

    "#{self[0...-1].join(', ')}#{',' if length > 2 && oxford} and #{self[-1]}"
  end
end
