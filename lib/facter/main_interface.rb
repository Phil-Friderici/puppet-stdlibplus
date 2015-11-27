# main_interface.rb

Facter.add('main_interface') do
  confine :kernel => 'Linux'

  setcode do
    begin
      main_interface = `netstat -r | awk '/^default/ { print $NF }'`.strip
      main_interface = main_interface.gsub(/[^a-z0-9_]/i, '_')
    rescue
      main_interface = 'none'
    end

    main_interface
  end
end

Facter.add('main_interface') do
  confine :kernel => 'SunOS'

  setcode do
    begin
      main_interface = `route get default | awk '/interface/ { print $2 }'`.strip
      main_interface = main_interface.gsub(/[^a-z0-9_]/i, '_')

      if Facter.value(:is_virtual).strip == 'true'
        interfaces = Facter.value(:interfaces).strip.split(',')

        if not interfaces.include?(main_interface)
          interfaces.each do |nic|
            if nic =~ /^#{main_interface}_[0-9]+$/
              main_interface = nic

              break
            end
          end
        end
      end
    rescue
      main_interface = 'none'
    end

    main_interface
  end
end
