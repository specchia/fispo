Forem.user_class = "Account"
Forem.autocomplete_field = "email"
Forem.email_from_address = "dom_thual@yahoo.fr"
# If you do not want to use gravatar for avatars then specify the method to use here:
# Forem.avatar_user_method = :custom_avatar_url
Forem.per_page = 20

# If you want to change the layout that Forem uses, uncomment and customize these lines:
#
 Rails.application.config.to_prepare do
   Forem::ApplicationController.layout "forem"
#   Forem::ApplicationController.layout "application"
 end
#
# By default, these lines will use the layout located at app/views/layouts/forem.html.erb in your application.

#domthu integrate authentication for forum
#<header>
#    <nav>
#        <% if account_signed_in? %>
#            <%= link_to forem_user.email, main_app.edit_user_registration_path %>
#            | <%= link_to "Sign out", main_app.destroy_user_session_path, :method => :delete %>
#            <% if forem_user.forem_admin %>
#                | <%= link_to "Amministra il forum", forem.admin_root_url %>
#            <% end %>
#        <% else %>
#            <%= link_to "Sign up", main_app.new_account_registration_path %>
#            | <%= link_to "Sign in", main_app.new_account_session_path %>
#        <% end %>
#    </nav>
#</header>


#Note rename user --> account
#        <% if user_signed_in? %>
#            <%= link_to "Sign up", main_app.new_user_registration_path %>
#            | <%= link_to "Sign in", main_app.new_user_session_path %>


