# Adds a `.joined` method to `Array`

[![DevOps By Rultor.com](https://www.rultor.com/b/yegor256/joined)](https://www.rultor.com/p/yegor256/joined)
[![We recommend RubyMine](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![rake](https://github.com/yegor256/joined/actions/workflows/rake.yml/badge.svg)](https://github.com/yegor256/joined/actions/workflows/rake.yml)
[![PDD status](https://www.0pdd.com/svg?name=yegor256/joined)](https://www.0pdd.com/p?name=yegor256/joined)
[![Gem Version](https://badge.fury.io/rb/joined.svg)](https://badge.fury.io/rb/joined)
[![Test Coverage](https://img.shields.io/codecov/c/github/yegor256/joined.svg)](https://codecov.io/github/yegor256/joined?branch=master)
[![Yard Docs](https://img.shields.io/badge/yard-docs-blue.svg)](https://rubydoc.info/github/yegor256/joined/master/frames)
[![Hits-of-Code](https://hitsofcode.com/github/yegor256/joined)](https://hitsofcode.com/view/github/yegor256/joined)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/joined/blob/master/LICENSE.txt)

Maybe you know [`to_sentence`][to_sentence] from Rails.
This gem does exactly the same, but without Rails.

```ruby
require 'joined'
puts ['orange', 'banana', 'pear'].joined
```

Prints:

```
orange, banana, and pear
```

That's it.

## How to contribute

Read
[these guidelines](https://www.yegor256.com/2014/04/15/github-guidelines.html).
Make sure your build is green before you contribute
your pull request. You will need to have
[Ruby](https://www.ruby-lang.org/en/) 3.0+ and
[Bundler](https://bundler.io/) installed. Then:

```bash
bundle update
bundle exec rake
```

If it's clean and you don't see any error messages, submit your pull request.

[to_sentence]: https://api.rubyonrails.org/classes/Array.html#method-i-to_sentence
