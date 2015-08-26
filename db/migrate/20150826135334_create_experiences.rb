class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string    :time_duration     # 如：2015-01~now
      t.integer   :experience_type   # 如：education，work
      t.integer   :experience_role   # 如：undergraduate，graduate，professor，assistant professor
      t.integer   :diploma           # 如：BS（bechelor of science），PhD（degree of philosophy）
      t.string    :place
      t.timestamps null: false
    end
  end
end
