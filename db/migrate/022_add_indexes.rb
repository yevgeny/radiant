class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index "pages", ["class_name"]
    add_index "pages", ["parent_id"]
    add_index "pages", ["slug", "parent_id"], :unique => true 
    add_index "pages", ["virtual", "status_id"]
    
    add_index "page_parts", ["page_id", "name"], :unique => true
  end

  def self.down
    remove_index "page_parts", ["page_id", "name"]

    remove_index "pages", ["virtual", "status_id"]
    remove_index "pages", ["slug", "parent_id"]
    remove_index "pages", ["parent_id"]
    remove_index "pages", ["class_name"]
  end
end
