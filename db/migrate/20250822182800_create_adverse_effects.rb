class CreateAdverseEffects < ActiveRecord::Migration[7.1]
  def change
    create_table :adverse_effects do |t|
      t.string :effect

      t.timestamps
    end
  end
end
