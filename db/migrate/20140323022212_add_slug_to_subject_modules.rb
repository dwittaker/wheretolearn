class AddSlugToSubjectModules < ActiveRecord::Migration
    def change
      add_column :subject_modules, :slug, :string


      add_index :subject_modules, :slug
    end


end
