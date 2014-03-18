class CreateJoinTableDeveloperProject < ActiveRecord::Migration
  def change
    create_join_table :developers, :projects do |t|
      # t.index [:developer_id, :project_id]
      # t.index [:project_id, :developer_id]
    end
  end
end
