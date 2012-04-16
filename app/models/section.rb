class Section < ActiveRecord::Base
  has_many :contents
  belongs_to :top_section,  :foreign_key => "top_section_id"

  #include ActionController::UrlWriter   #Rails 2 
  include Rails.application.routes.url_helpers   #Rails 3

  def section_with_id
    "#{id} . #{sezione}"
  end

  def edit
      #include ActionController::UrlWriter 
      #if auth_sample_user(self.id) or signed_in_and_master?
      "<a href='" + edit_sampling_path(self) + "' title='Edit selected row'><div class='ui-pg-div' title='Edit selected row'><span class='ui-icon ui-icon-pencil' title='Edit selected row'></span></div></a>"
      #else
      #    ""
      #end
  end

end
