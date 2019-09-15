class AddReferenceToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :reference, :string
  end
end
