class RenameExplanatioinColumnToDocuments < ActiveRecord::Migration[5.2]
  def change
    rename_column :documents, :explanatioin, :explanation
  end
end
