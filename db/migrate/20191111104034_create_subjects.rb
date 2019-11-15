class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :sub_name
      t.integer :sub_code
      t.uuid :teacher_id,     default: "uuid_generate_v4()"

      t.timestamps
    end
  end
end
