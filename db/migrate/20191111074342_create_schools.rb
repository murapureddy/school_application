class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :name

      t.timestamps
    end
  end
end
