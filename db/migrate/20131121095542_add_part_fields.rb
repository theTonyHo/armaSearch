class AddPartFields < ActiveRecord::Migration
  def change
    add_column :parts, :name, :string
    add_column :parts, :assembly_id, :integer
  end
end
