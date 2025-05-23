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
  # @param [String] words_connector
  #   The string used to join all but the last element of the list
  # @param [String] last_word_connector
  #   The string used to join the last element of the list.
  # @param [Boolean] oxford
  #   Should we place a comma before the :last_word_connector?
  #   If false, it will remove a leading comma from the :last_word_connector.
  #   If true, it will preserve the leading comma specified
  #   in the :last_word_connector, but it will not insert one
  #   if not already present.
  # @param [Boolean] comma_before
  #   Should we move comma before the quotes symbol
  #   If false, adds the comma outside quotation marks
  #   If true, adds the comma inside quotation marks
  # @return [String] The text generated (with items joined)
  def joined(oxford: true, words_connector: ', ', last_word_connector: ', and ', comma_before: false)
    return '' if empty?
    return first if length == 1

    final_connector = (last_word_connector || '').dup
    final_connector.sub!(/^,/, '') unless oxford && length > 2

    result = "#{self[0...-1].join(words_connector)}#{final_connector}#{self[-1]}"
    result.gsub!(/"([^"]+)"\s*,/, '"\1,"') if comma_before

    result
  end
end
