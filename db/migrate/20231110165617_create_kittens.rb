# frozen_string_literal: true

class CreateKittens < ActiveRecord::Migration[7.1]
  def change
    create_table :kittens do |t|
      t.string :name
      t.string :age
      t.string :cuteness
      t.string :softness

      t.timestamps
    end
  end
end
