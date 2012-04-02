class Section < ActiveRecord::Base
  has_many :contents
  belongs_to :top_section,  :foreign_key => "top_section_id"

  def section_with_id
    "#{id} . #{sezione}"
  end
end
