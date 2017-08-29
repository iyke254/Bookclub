class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
    	t.column :name, :string

    	t.column :description, :text
    	
    end
  end
end
