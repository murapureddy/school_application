class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string  :firstname
      t.string  :lastname
      t.string  :email
      t.string  :password_hash
      t.string  :password_salt
      t.boolean :active,                    :default => true
      t.string  :auth_token
      t.string  :role,                        :default => 'user'
      t.uuid    :school_id,                  default: "uuid_generate_v4()"

      t.timestamps
    end
  end
end
