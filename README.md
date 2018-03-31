# Todo From Scratch (Controller)

## Setup Layout

1. Create a new application. In your environment folder, run `rails new appname`. Then cd into your new app.
2. Update your run configuration so that the CWD (current working directory) now points to your new app (or create a new one).
2. Click on the link in the Controller assignment to get a new private repository on Github for your assignment. Add your remote, stage and commit your code, and push it up to Github.
3. Create a sites or welcome controller: `bin/rails generate controller sites index about`.
4. Update your routes file. Remove the routes that were auto-genterated, and add the sites#index as your root. Also create a named route for about.
5. Create your title helper in `app/helpers/sites_helper.rb`. Test the helper on your index and about views (app/views/sites/...). You may look at my template in `app/view/layouts/application.html`, to figure out how to add your title to the template. However, you cannot copy and paste my code. You MUST type it in yourself.
5. Follow the [Bootstrap Gem](https://github.com/twbs/bootstrap-rubygem)'s instructions in the readme to add bootstrap to your application. Make sure you read and follow all of the instructions closely.
   * When it says to add `gem "bootstrap" ...` to your gemfile, that means to add the code to your Gemfile (in the root directory of your application).
   * Remember to run `bundle install` after you add the gem into the `gemfile`. After you need to restart (stop and then start) your server.
   * When you create your template let the Bootstrap examples be your guide. However, Rails will include all Bootstrap CSS and JS. So DO NOT erase your JS or CSS lines that your initial application.html.erb file has. 
   * Also, do not add in any JS or CSS includes (links) from the Bootstrap example, ALL JS and CSS will be included through the asset pipeline, as long as you followed the instructions.
   * I do not recommend deleting anything in your template. Just add in the HTML from the example. Be careful not to add two head,body,title tags, etc, so you end up with more than one of those tags.
   * As you copy links, instead of just copying the <a href ... stuff, use the link\_to function. See my navbar with the "Todo App link" as an example. You may also create a nav-link helper. I have one that works well for Bootstrap navbars commented out in `app/helpers/sites_helper.rb`. DO NOT COPY AND PASTE.
6. Setup your default template (app/views/layout/application.html.erb) using Bootstrap's [examples](http://getbootstrap.com/docs/4.0/examples/). DO NOT COPY MINE. You will receive a 0 if you do.
7. After you have setup your layout, you can look at my application.html.erb file to add in notification code so that flash messages will show up. This and the display title (from step 4) is the only code you can copy from my template. Don't copy and paste it. Type it in yourself.

## Create Model and then Controller/Views

1. You might want to commit your code to git, so you can revert back in you make a mistake.
2. Create your model: `bin/rails generate model task name due_date:datetime priority:integer`. Remember to use the singular version of your name.
3. Go into the rails console, and try creating a model. `bin/rails console`. Some commands `t = Task.new`, `t.name = "Name"`, `t.save`, `t.valid?`, `Task.all`, `Task.first`.
4. Add validations to your model in app/models/task.rb.
5. Go into the rails console, and test out your validations.
6. Create your controller: `bin/rails g controller tasks`. Make sure you user the plural name of your model.
7. Create your routes in `config/routes.rb`. (resources :tasks).
8. Add the index function in your tasks controller. `app/controllers/tasks_controller.rb`
9. Create a index view file in your `app/views/tasks` folder.
10. Create a new function in your tasks controller.
11. Create a new view for your form.
12. You can install the [bootstrap_form](https://github.com/bootstrap-ruby/bootstrap_form) gem to reduce the amount you need to type for your form. Remember to run bundle install, and restart your server.
13. Write your create method, along with the private `task_params` method in your tasks\_controller.
14. Create your show method with the show view. Create a partial for your task and use it in the index view as well.
15. Create your edit method with the view. Create a partial for your form, and use it on your new page as well.
16. Create your update method.
17. Create your destroy method.

## Associated Model
1. Create your associated model. `bin/rails g model note title body:text task_id:integer`, and migrate your database.
2. Add validations into your new model. Add `has_many ...` and `belongs_to ....` into your models. Test it out on the console.
3. Create your controller for your new model: `bin/rails g controller notes`.
4. Update your `config/routes.rb` file to include nested routes for your new model.
6. Create your index method, with your index view. You also might think about creating a partial for your note.
7. Create your new method with a view (form to create a new note).
8. Create your create method.
9. Create your show method with a show view.
10. Create your edit and update methods, with an edit view.
11. Create your destroy method.
12. Make sure you add some links so you can get back to the task, or all notes, etc.
13. Don't forget to add some new components from [bootstrap](https://getbootstrap.com).

## User Authentication
1. Uncomment the bcrypt gem in the `gemfile`, and run bundle to install it. Don't forget to restart your server.
2. Create your user model: `bin/rails g model user name email password_digest`.
3. Add validations to your model and add `has_secure_password`.
4. Create your users controller: `bin/rails g controller users`.
5. Add in your new method in your users controller. Add a new view, and edit your routes file. We will still use restful routes for users, but we will also use a named route to make our sign up url look nice.
6. Add the create method in your users controller.
7. Create your sessions controller: `bin/rails g controller sessions`. Add your routes for the sessions (resources and named routes).
8. Create your new method and the login form.
9. Create your create method in the sessions controller.
10. Add your current\_user method to the `app/controllers/application_controller`.
11. Update your navigation bar, to switch the links if there is a current user logged in. So that a logout link shows up. You also might want to remove the link to tasks for users that are not logged in.
11. Add your login and logout and authorize methods to you application\_controller. (Don't copy and paste).
12. Update your sessions controller to use the login method, and also add a destroy method to logout. Also make your sessions controller redirect to the protected page.
13. Update your users controller to login users that are just created, so they don't have to login after creating an account.
14. Now associate your model with your users. (You can create a new model if you wish, I am using the task model).
    1. Add the foriegn key: `bin/rails g migration add_user_id_to_tasks user_id:integer`.
    2. Add the has\_many and belongs\_to into your models.
    3. Update the create in your tasks controller to associate the new task with the current\_user.
    4. Make sure you look up all tasks through the current\_user (`current_user.tasks.find`) instead of with the model directly (`Task.find`).
    5. You also will want to protect your associated model (notes) from getting accessed from users not logged in, and to look up the task through the current\_user. (I didn't do this in class but it is done in in the code.)
15. Finish your user model.
    1. Add edit and update (with an edit view). If you notice, the update method uses a method defined in my user model.
    2. Add the update\_with\_password method to your user model and the attr\_accessor :current\_password. (Don't copy and paste.)
    3. I decided that any account changes should require a password. the udpdate\_with\_password method verifies the old password before changing and saving the user.
    4. You will need to add a show and destroy to your user model. This is not done in the example.

## Login with a Service

1. Create an application on Github or Facebook or another site.
2. Add the appriopriate omniauth gem to your gemfile. Run bundle.
3. Create your initializer file: `config/initializers/omniath.rb`. Remember to restart your server anytime you change this file.
4. Add the client id and secret to your .bash\_profile file. See `config/example_profile` for an example. Just add the lines into your bash profile. DO NOT ADD THE SECRET INTO your git repository.
   1. Your bash profile is located in the home directory. It is a hidden file. Make sure you are in class to see where it is.
5. Create an authentications controller. Add the callback route in your routes file.
6. Add the omni\_hash method and the render json into your create method in your authentications\_controller. Test your project here. DO NOT CONTINUE until you see the hash.
7. Add the user\_hash method and also create a create\_from\_hash method in your user model.
8. Now test your code to make user you correctly created your user hash.
9. Now finish your create method for your authentications controller.