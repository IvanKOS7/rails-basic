

#instance method Application class
#Rails.configuration.app_version = '0.1.0'
# TestGuru::Application.config.app_version = '0.1.0'
# puts "Application version: #{Rails.configuration.app_version}"

#module method
def TestGuru.app_version
  '0.1.0'
end

puts "Application version: #{TestGuru.app_version}"
