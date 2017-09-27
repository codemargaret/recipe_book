class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table(:steps) do |t|
      t.column(:name, :string)
      t.column(:recipe_id, :integer)
      t.column(:step_num, :integer)

      t.timestamps
    end
  end
end
