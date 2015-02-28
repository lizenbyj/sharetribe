class AddShippingAddressToTransaction < ActiveRecord::Migration
  def change
        add_column :transactions, :shipping_address_status, :string
        add_column :transactions, :shipping_address_city, :string
        add_column :transactions, :shipping_address_country, :string
        add_column :transactions, :shipping_address_name, :string
        add_column :transactions, :shipping_address_phone, :string
        add_column :transactions, :shipping_address_postal_code, :string
        add_column :transactions, :shipping_address_state_or_province, :string
        add_column :transactions, :shipping_address_street1, :string
        add_column :transactions, :shipping_address_street2, :string
  end
end
