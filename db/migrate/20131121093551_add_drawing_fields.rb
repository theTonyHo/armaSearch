class AddDrawingFields < ActiveRecord::Migration
  def change
    add_column :drawings, :number, :string
    add_column :drawings, :project, :integer
    add_column :drawings, :title, :string
    add_column :drawings, :series, :string
    add_column :drawings, :revision, :string
  end
end
