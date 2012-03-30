class Content < ActiveRecord::Base
  belongs_to :section, :foreign_key => 'section_id'
  belongs_to :top_section
end
