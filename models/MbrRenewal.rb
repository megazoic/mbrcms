class MbrRenewal < Sequel::Model
  many_to_one :mbr_renewal_type
  many_to_one :user
end
