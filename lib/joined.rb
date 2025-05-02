# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2024-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

# Joins elements of array.
#
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2024-2025 Yegor Bugayenko
# License:: MIT
class Array
  def joined
    return '' if empty?
    return first if length == 1

    "#{self[0...-1].join(', ')}#{',' if length > 2} and #{self[-1]}"
  end
end
