class CreateFacts < ActiveRecord::Migration[5.2]
  def change
    create_table :facts do |t|
      t.integer :location_id
      t.text :fact
    end
  end
end
