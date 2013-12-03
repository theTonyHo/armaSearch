class AddProjectFields < ActiveRecord::Migration
  def change
    add_column :projects, :name, :string
    add_column :projects, :owner_id, :integer
    add_column :projects, :title, :string
    add_column :projects, :description, :text
    add_column :projects, :client, :string
    add_column :projects, :architect, :string
    add_column :projects, :designer, :string
    add_column :projects, :date_completed, :string
    add_column :projects, :status, :string
  end
end
