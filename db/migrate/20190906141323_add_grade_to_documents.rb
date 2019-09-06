class AddGradeToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :school, :string
    add_column :documents, :grade, :string
    add_column :documents, :subject, :string
    add_column :documents, :content, :string
  end
end
