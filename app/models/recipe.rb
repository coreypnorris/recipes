class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates :name, :presence => :true
  validates :description, :presence => :true

   attr_accessor :tag_list
   after_save :update_tags

   def update_tags
    tags.delete_all
    selected_tags = tag_list.nil? ? [] : tag_list.keys.collect{|id| Tag.find_by_id(id)}
    selected_tags.each {|tag| self.tags << tag}
  end
end
