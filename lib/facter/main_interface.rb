# main_interface.rb

Facter.add('main_interface') do
  confine :kernel => 'Linux'

  setcode do
    begin
      main_interface = `netstat -r | awk '/^default/ { print $NF }'`.strip
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
      main_interface = main_interface.sub(':', '_')
    rescue
      main_interface = 'none'
    end

    main_interface
  end
end
