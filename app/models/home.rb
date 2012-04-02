class Home < ActiveRecord::Base
    def contentz
      Content.find(:all, :conditions => ["section_id = ?", params[:id]])
    end
end