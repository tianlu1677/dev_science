# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create_with(username: 'tianlu', password: 'kkb654321', password_confirmation: 'kkb654321', confirmed_at: DateTime.now).find_or_create_by!(:email => '1035232764@qq.com')

Permission.destroy_all
['User', 'Role', 'Permission'].each do |model|
  {manage: '管理', read: '查看', create: '添加', update: '修改', destroy: '删除'}.each do |k, v|
    Permission.create_with(name: v,
                           desc: "#{I18n.t("activerecord.models.#{model.underscore}")}",
                           subject_name: I18n.t("activerecord.models.#{model.underscore}")
    ).find_or_create_by!(action: k.to_s,
                         subject_class: model,
                         subject_id: nil

    )
  end
end

