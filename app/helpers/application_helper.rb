module ApplicationHelper

  #
  # Authentication and Role
  #
  include SessionsHelper

  def example(options={}, &block)
    out = render :partial => 'home/header', :locals => {:options => options}
    out << capture(&block)
    out
  end

  #experiments
  def button_tag(name, icon, options={})

    icon_path = icon
    img = tag("img", :src => icon_path,
                     :alt =>"", :open => false)
    img << ' ' + name
    options.merge!("type" => 'submit') unless options[:type]
    content_tag(:button, img, options)
  end
   
  def img_link_tag(name, icon, options={})
    #icon_path = '/stylesheets/blueprint/plugins/buttons/icons/'
    icon_path = icon
    img = tag("img", :src => icon_path,
                     :alt =>"", :open => false)
    img << ' ' + name

    options.merge!(:href => 'root') unless options[:href]
    content_tag(:a, img, options)
  end

  # Usage: in my login form
  #  <fieldset class="submit">
  #      <%= button_tag 'Login', 'key.png', :class => 'button positive'%>
  #      <%= img_link_tag 'Cancel', 'cross.png', :href => '/', :class => 'button negative' %>
  #  </fieldset>

end
