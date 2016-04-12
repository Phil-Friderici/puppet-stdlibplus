#
# validate_email.rb
#

module Puppet::Parser::Functions
  newfunction(:validate_email, :doc => <<-EOS
    Validate that all values passed are valid Email.
    Fail compilation if any value fails this check.

    EOS
  ) do |args|

    if args.length == 0
      raise Puppet::ParseError, "validate_email(): Wrong number of arguments given (#{args.length}; must be > 0)."
    end

    args.each do |arg|
      unless arg.is_a?(String)
        raise Puppet::ParseError, "validate_email(): #{arg.inspect} is not a string."
      end

      unless arg =~ Regexp.compile('^[a-zA-Z][a-zA-Z0-9\-+\.]+@[a-zA-Z][a-zA-Z\-]+\.[A-Za-z]+$')
        raise Puppet::ParseError, "validate_email(): #{arg.inspect} is not a valid Email."
      end
    end
  end
end

# vim: set ts=2 sw=2 et :
