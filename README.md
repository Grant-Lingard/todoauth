# Todo From Scratch (Controller)

## Setup Layout

1. Create a new application. In your environment folder, run `rails new appname`. Then cd into your new app.
2. Update your run configuration so that the CWD (current working directory) now points to your new app (or create a new one).
2. Click on the link in the Controller assignment to get a new private repository on Github for your assignment. Add your remote, stage and commit your code, and push it up to Github.
3. Create a sites or welcome controller: `bin/rails generate controller sites index about`.
4. Update your routes file. Remove the routes that were auto-genterated, and add the sites#index as your root. Also create a named route for about.
5. Create your title helper in `app/helpers/sites_helper.rb`. Test the helper on your index and about views (app/views/sites/...). You may look at my template in `app/view/layouts/application.html`, to figure out how to add your title to the template. However, you cannot copy and paste my code. You MUST type it in yourself.
5. Follow the [Bootstrap Gem](https://github.com/twbs/bootstrap-rubygem)'s instructions in the readme to add bootstrap to your application. Make sure you read and follow all of the instructions closely.
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