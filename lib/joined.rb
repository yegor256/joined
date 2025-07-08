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
  # @param [Integer] max
  #   Maximum number of elements to show. If array has more elements,
  #   append ", etc." to the result.
  # @return [String] The text generated (with items joined)
  def joined(oxford: true, words_connector: ', ', last_word_connector: ', and ', comma_before: false, max: nil)
    return '' if empty?
    return ', etc.' if max&.zero?

    array, etc = truncate_if_needed(self, max)
    return format_single_element(array.first, etc) if array.length == 1

    if etc
      result = array.join(words_connector)
    else
      connector = prepare_final_connector(last_word_connector, oxford, array.length)
      result = join_elements(array, words_connector, connector)
    end
    result = adjust_quotes(result, comma_before)
    append_etc(result, etc)
  end

  private

  def truncate_if_needed(array, max)
    return [array, false] unless max && array.length > max

    [array[0...max], true]
  end

  def format_single_element(element, etc)
    result = element
    result += ', etc.' if etc
    result
  end

  def prepare_final_connector(connector, oxford, length)
    final = (connector || '').dup
    final.sub!(/^,/, '') unless oxford && length > 2
    final
  end

  def join_elements(array, words_connector, final_connector)
    "#{array[0...-1].join(words_connector)}#{final_connector}#{array[-1]}"
  end

  def adjust_quotes(result, comma_before)
    return result unless comma_before

    result.gsub(/"([^"]+)"\s*,/, '"\1,"')
  end

  def append_etc(result, etc)
    return result unless etc

    "#{result}, etc."
  end
end
