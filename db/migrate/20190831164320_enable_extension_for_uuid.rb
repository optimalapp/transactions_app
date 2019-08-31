class EnableExtensionForUuid < ActiveRecord::Migration[6.0]
  def change
    create_table :uuid_extensions do |t|
      enable_extension 'uuid-ossp'
    end
  end
end
