module ApplicationHelper
    def example(options={}, &block)
    out = render :partial => 'home/header', :locals => {:options => options}
    out << capture(&block)
    out
  end
end
