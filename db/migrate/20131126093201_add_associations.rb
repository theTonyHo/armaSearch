class AddAssociations < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.belongs_to :user
    end

    change_table :drawings do |t|
      t.belongs_to :project
      t.belongs_to :part
    end

    change_table :parts do |t|
      t.belongs_to :drawing
      t.belongs_to :project
    end
 end
end
