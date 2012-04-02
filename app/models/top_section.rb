class TopSection < ActiveRecord::Base
  has_many :sections
  has_many :contents , :through => :sections

  def top_section_with_id
    "#{id} . #{sezione_top}"
  end
end
