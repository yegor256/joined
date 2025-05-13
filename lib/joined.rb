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
  #   The sign or word used to join all but the last element
  #   in arrays with three or more elements.
  # @param [String] last_word_connector
  #   The sign or word used to join the last element in arrays
  #   with three or more element.
  # @param [Boolean] oxford
  #   Should we place a comma before the :last_word_connector?
  #   If false, it will remove a leading comma from the :last_word_connector,
  #   however it does not add a comma if one is not already specified in the :last_word_connector.
  # @return [String] The text generated (with items joined)
  def joined(oxford: true, words_connector: ', ', last_word_connector: ', and ')
    return '' if empty?
    return first if length == 1

    final_connector = (last_word_connector || '').dup
    final_connector.sub!(/^,/, '') unless oxford && length > 2

    "#{self[0...-1].join(words_connector)}#{final_connector}#{self[-1]}"
  end
end
