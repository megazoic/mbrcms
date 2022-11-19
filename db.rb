begin
  require_relative '.env.rb'
rescue LoadError
end

require 'sequel/core'

# Delete MBRCMS_DATABASE_URL from the environment, so it isn't accidently
# passed to subprocesses.  MBRCMS_DATABASE_URL may contain passwords.
DB = Sequel.connect(ENV.delete('MBRCMS_DATABASE_URL') || ENV.delete('DATABASE_URL'))

# Load Sequel Database/Global extensions here
# DB.extension :date_arithmetic
