Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :fname
      String :lname
      String :callsign
    end
    create_table(:mbr_renewal_types) do
      primary_key :id
      String :name
      String :description
    end
    create_table(:mbr_renewals) do
      primary_key :id
      String :notes
      DateTime :ts, null: false
      foreign_key :mbr_type_id, :mbr_renewal_types
      foreign_key :user_id, :users
    end
  end
end
