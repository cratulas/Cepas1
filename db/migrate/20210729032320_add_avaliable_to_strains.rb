class AddAvaliableToStrains < ActiveRecord::Migration[5.2]
  def change
    add_column :strains, :avaliable, :boolean , default: true
  end
end
