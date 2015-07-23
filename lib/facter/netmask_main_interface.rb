# netmask_main_interface.rb

Facter.add('netmask_main_interface') do
  setcode do
    begin
      main_interface = Facter.value(:main_interface).strip

      response = Facter.value("netmask_#{main_interface}").strip
    rescue
      response = 'none'
    end

    response
  end
end
