class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :user_id
      t.string :title
      t.integer       :resourceable_id        #文件的所属
      t.string        :resourceable_type      #
      t.string        :title              #文件的名称
      t.text          :desc               #文件的描述
      t.string        :file_size          #文件大小
      t.string        :file_type          #文件的类别，ppt,xls 之类的
      t.string        :file_name          #文件原名称
      t.string        :link               #文件链接
      t.text          :pdf_link           #pdf文件预览
      t.integer       :position           #位置
      t.string        :status             #状态
      t.string        :uuid               #唯一标识符

      t.timestamps null: false
    end
  end
end
