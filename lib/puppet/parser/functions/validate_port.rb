#
# validate_port.rb
#

module Puppet::Parser::Functions
  newfunction(:validate_port, :doc => <<-EOS
    Validate that all values passed are valid port number.
    Fail compilation if any value fails this check.

    EOS
  ) do |args|

    if args.length == 0
      raise Puppet::ParseError, "validate_port(): Wrong number of arguments given (#{args.length}; must be > 0)."
    end

    args.each do |arg|
      begin
        unless arg.is_a?(Integer)
          arg = arg.to_i
        end

        unless arg > 0 and arg <= 65535
          raise
        end
      rescue
        raise Puppet::ParseError, "validate_port(): #{arg.inspect} is not a valid port number."
      end
    end
  end
end

# vim: set ts=2 sw=2 et :
