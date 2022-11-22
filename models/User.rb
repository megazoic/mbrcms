class User < Sequel::Model
  one_to_many :mbr_renewals
end
