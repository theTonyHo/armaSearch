class AddPartFields < ActiveRecord::Migration
  def change
    add_column :parts, :number, :string
    add_column :parts, :drawing, :integer
    add_column :parts, :assembly, :integer
  end
end
