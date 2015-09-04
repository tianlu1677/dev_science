# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create_with(username: 'tianlu', password: 'kkb654321', password_confirmation: 'kkb654321', confirmed_at: DateTime.now).find_or_create_by!(:email => '1035232764@qq.com')
User.create_with(username: 'dongli', password: '12345678', password_confirmation: '12345678', confirmed_at: DateTime.now).find_or_create_by!(:email => 'dongli@lasg.iap.ac.cn')

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
100.times do |key|
  User.create_with(username: 'tianlu', password: '111111', password_confirmation: '111111', confirmed_at: DateTime.now).find_or_create_by!(:email => "#{key}@qq.com")
end

%w(小学组 中学组 高中组 大学组 研究组 男子组 女子组).each do |group_name|
  Group.create(name: group_name, short_name: group_name, intro: "#{group_name}很好啊", desc: "#{group_name}这个很长很长的描述")
end

%w(数学研究机构 语文研究机构).each do |organization_name|
  Organization.create(name: organization_name, short_name: organization_name, intro: "#{organization_name}很好啊", desc: "#{organization_name}这个很长很长的描述",
                      city: "北京", address: '北京海淀区', contact_name:'张三', contact_mobile: '188888888', parent_id: 0,lft: 0, rgt: 0)
end
