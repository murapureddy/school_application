class CreateSubjectstudents < ActiveRecord::Migration[5.2]
  def change
    create_table :subjectstudents, id: :uuid, default: "uuid_generate_v4()" do |t|
        t.uuid :student_id,     default: "uuid_generate_v4()"
        t.uuid :subject_id,     default: "uuid_generate_v4()"
        t.integer :marks

      t.timestamps
    end
  end
end
