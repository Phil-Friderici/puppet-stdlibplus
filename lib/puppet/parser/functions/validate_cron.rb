#
# validate_cron.rb
#

module Puppet::Parser::Functions
  newfunction(:validate_cron, :doc => <<-EOS
    Validate that all values passed are valid Email.
    Fail compilation if any value fails this check.

    EOS
  ) do |args|

    if args.length <= 1
      raise Puppet::ParseError, "validate_cron(): Wrong number of arguments given (#{args.length}; must be 2)."
    end

    args.each do |arg|
      unless arg.is_a?(String)
        arg.to_s
      end

      unless arg =~ Regexp.compile('^[A-Za-z0-9\-+\.]+@[A-Za-z\-]+\.[A-Za-z]+$')
        raise Puppet::ParseError, "validate_email(): #{arg.inspect} is not a valid Email."
      end
    end
  end
end

# vim: set ts=2 sw=2 et :
