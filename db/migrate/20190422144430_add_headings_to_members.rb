class AddHeadingsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :headings, :text, limit: 4294967295, after: :short_url
  end
end
