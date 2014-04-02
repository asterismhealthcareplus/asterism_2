#Web Portal in heavy development for Asterism


##General App Info:

1. Rails 4.0.2
2. Ruby 2.1.0 (can possibly be run on ruby 1.9 and above, but recommend sticking with 2.1.0)
3. Twitter Bootstrap 3.1.0 for templating (see getbootstrap.com)


##Known Issues:

1. Safari browser does not render table in the center. This is issue is seen in the "Product status" page. Only happens when jquery is used to float the thead. The jquery script is found in app/views/layout/scripts/_javascripts.html.erb

2. Table in "Product status" page occasionally over stretches to the far right side of screen on first browser load (seen in firefox and chrome). Issue is fixed after browser reload.


##Authentication by Devise:

1. Authentication is being handled by the Devise gem. To learn more about how to use it go here: https://github.com/plataformatec/devise

2. Devise provides a method called `current_user` which allows you to find the current logged in user's id.

3. In order to ensure that a controller is authenticating users. Ensure this is in the specific controller's file on the top: `before_filter authenticate_user!`.

4. You may choose to authenticate users based on a specific controller's action. For example: `before_filter authenticate_user!, only: [:product_status]`

5. User login view, signup view, user account edit view, and other such related user views are located in app/views/devise


##Authorization by Cancancan:

1. Authorization is being handled by the Cancancan gem, although only on a limited basis at the time of this writing. Cancancan is the continuation of the now defunct Cancan authorization gem by Ryan Bates. Learn more about Cancancan here: https://github.com/CanCanCommunity/cancancan

2. Cancancan allows you to set levels of permission(authorization) to a group of users. At the moment Admin, Employee, and Customer has been defined and are being used by Cancancan.

3. First, you may configure Cancancan by going to app/models/ability.rb

4. Second, you may specify which controller to use Cancancan. Specify by going to that specific controller and put `load_and_authorize_resource` at the top.


##IMPORTANT! Two separate user controllers being used:

1. There are two user controllers being used. One is the registrations_controller.rb (installed in the computer system in the gem directory, thus not found in this app directory) and the second is the user_controller.rb located in app/controllers/user_controller.rb. 

2. The registrations_controller.rb was auto generated by Devise and is the default user authentication controller allowing users to sign up, login, sign out, and edit/update user account. This controller controls the views in app/views/devise.

3. In order to allow admins and employees to view and edit other user's account, the user_controller.rb was created. This controller controls the views in app/views/user.


##Javascript:

1. Javascripts and jquery are largely stored in the _javascripts.html.erb partial. This is found in app/views/layouts/scripts/

2. This partial is rendered in the _footer.html.erb, found in app/views/layouts/


##Sassy CSS:

1. This app uses Sassy CSS for styling. It can be found in app/assets/stylesheets/custom.css.scss


##Icons:

1. Icons (images used as buttons in the Product Status page) are located in app/assets/images


##Custom Helper Methods:

1. Many helpers have been defined in static_pages_helper.rb located in app/helpers.

2. For example, the helper method `formuate_icon` has been defined in that file to allow calling that method in any views and a formulate icon picture will appear.


##Strong Parameters:

1. All rails 4 apps now uses strong parameters to control mass assignments rather than `attribute_accessible` found in rails 3 apps. See https://github.com/rails/strong_parameters

2. Strong parameters are configured in the controller. For example, in the user_controller.rb there is this line at the bottom:
```ruby  
	private
   
  def update_params
    params.require(:user).permit(:company, :first_name, :last_name, :office_location, :office_city, :office_country, :employee, :customer, :admin) 
  end
```
The above code means the following items can be sanitized/changed in the :user model: :company, :first_name, :last_name, :office_location, :office_city, :office_country, :employee, :customer, :admin

3. NOTE! That in order to edit strong parameters for the default devise's registrations_controller, you must add the strong parameters in app/controllers/application_controller.rb. In the application_controller.rb you will see these methods:
```ruby
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :office_location << :office_country << :office_city << :company
  	devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :office_location << :office_country << :office_city << :company
  end
```
Add items that may be edited or used for sign up by appending the item to the respective sanitizer.


##Automated Testing:

1. Automated testing has not been implemented. Please google search and implement rspec gem and capybara gem to start writing tests.

