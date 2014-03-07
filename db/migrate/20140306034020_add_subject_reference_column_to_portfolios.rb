class AddSubjectReferenceColumnToPortfolios < ActiveRecord::Migration

  def up

    add_column :portfolios, :subject_id, :integer,  references: :subject

  end

  def down

    remove_column :portfolios, :subject_id, :integer,  references: :subject
  end
end
