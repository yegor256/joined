# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2024-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'English'

Gem::Specification.new do |s|
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.required_ruby_version = '>=3.2'
  s.name = 'joined'
  s.version = '0.0.0'
  s.license = 'MIT'
  s.summary = 'A simple Ruby gem that adds a .joined() method to Array'
  s.description =
    'This gem adds a .joined() method to the Array class. ' \
    'This method concatenates all elements of the array into a string, ' \
    'separating them with commas and placing "and" before the last element.'
  s.authors = ['Yegor Bugayenko']
  s.email = 'yegor256@gmail.com'
  s.homepage = 'http://github.com/yegor256/joined'
  s.files = `git ls-files`.split($RS)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE.txt']
  s.metadata['rubygems_mfa_required'] = 'true'
end
