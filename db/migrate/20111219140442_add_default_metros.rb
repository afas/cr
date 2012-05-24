class AddDefaultMetros < ActiveRecord::Migration
  def up
    Metro.import
  end

  def down
  end
end
