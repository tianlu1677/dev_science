class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer   :user_id
      t.string    :time_duration     # 如：2015-01~now
      t.string    :experience_type    # 如：education，work
      t.string    :experience_role    # 如：undergraduate，graduate，professor，assistant professor
      t.string    :diploma            # 如：BS（bechelor of science），PhD（degree of philosophy）
      t.text      :desc               #经历描述
      t.string    :place
      t.timestamps null: false
    end
  end
end
