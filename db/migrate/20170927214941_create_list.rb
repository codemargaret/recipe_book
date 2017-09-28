class CreateList < ActiveRecord::Migration[5.1]
  def change
    create_table(:lists) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)
      t.column(:quantity, :string)
      t.column(:unit_id, :integer)

      t.timestamps
    end

    create_table(:ingredients) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:units) do |t|
      t.column(:name, :string)

      t.timestamps
    end
  end
end
