class AddProjectFields < ActiveRecord::Migration
  def change
    add_column :projects, :owner, :integer
    add_column :projects, :number, :integer
    add_column :projects, :description, :string
    add_column :projects, :client, :string
    add_column :projects, :architect, :string
    add_column :projects, :designer, :string
    add_column :projects, :date_completed, :string
    add_column :projects, :status, :string
  end
end
