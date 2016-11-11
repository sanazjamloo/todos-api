class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.text :description
      t.boolean :done
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
