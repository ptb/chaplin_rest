require 'simplecov-vim/formatter'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::VimFormatter
]
SimpleCov.start 'rails'
