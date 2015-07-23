#
# validate_fqdn.rb
#

module Puppet::Parser::Functions
  newfunction(:validate_fqdn, :doc => <<-EOS
    Validate that all values passed are valid FQDN.
    Fail compilation if any value fails this check.

    EOS
  ) do |args|

    if args.length == 0
      raise Puppet::ParseError, "validate_fqdn(): Wrong number of arguments given (#{args.length}; must be > 0)."
    end

    args.each do |arg|
      unless arg.is_a?(String)
        raise Puppet::ParseError, "validate_fqdn(): #{arg.inspect} is not a string."
      end

      unless arg =~ Regexp.compile('(?=^[a-zA-Z0-9\-\.]{1,254}$)(^(?!\-)([a-zA-Z0-9\-]{1,63}\.)+[a-zA-Z]{2,63}$)')
        raise Puppet::ParseError, "validate_fqdn(): #{arg.inspect} is not a valid FQDN."
      end
    end
  end
end

# vim: set ts=2 sw=2 et :
