#
# validate_mode.rb
#

module Puppet::Parser::Functions
  newfunction(:validate_mode, :doc => <<-EOS
    Validate that value passed are valid mode file.
    Fail compilation if any value fails this check.

    EOS
  ) do |args|

    if args.length == 0 or args.length > 1
      raise Puppet::ParseError, "validate_mode(): Wrong number of arguments given (#{args.length}; must be 1)."
    end

    unless args.is_a?(String)
      raise Puppet::ParseError, "validate_mode(): #{arg.inspect} is not a string."
    end

    unless arg =~ Regexp.compile('^[0-7]{4}$')
      raise Puppet::ParseError, "validate_mode(): #{arg.inspect} is not a valid mode."
    end
  end
end

# vim: set ts=2 sw=2 et :
