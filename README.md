# Todo From Scratch (Controller)

1. Create a new application. In your environment folder, run `rails new appname`. Then cd into your new app.
2. Update your run configuration so that the CWD (current working directory) now points to your new app (or create a new one).
2. Click on the link in the Controller assignment to get a new private repository on Github for your assignment. Add your remote, stage and commit your code, and push it up to Github.
3. Create a sites or welcome controller: `bin/rails generate controller sites index about`.
4. Update your routes file. Remove the routes that were auto-genterated, and add the sites#index as your root. Also create a named route for about.
5. Create your title helper in `app/helpers/sites.rb`. Test the helper on your index and about views (app/views/sites/...). You may look at my template in `app/view/layouts/application.html`, to figure out how to add your title to the template. However, you cannot copy and paste my code. You MUST type it in yourself.
5. Follow the [Bootstrap Gem](https://github.com/twbs/bootstrap-rubygem)'s instructions in the readme to add bootstrap to your application. Make sure you read and follow all of the instructions closely.
  1. When you create your template let the Bootstrap examples be your guide. However, Rails will include all Bootstrap CSS and JS. So DO NOT erase your JS or CSS lines that your initial application.html.erb file has. 
  2. Also, do not add in any JS or CSS includes (links) from the Bootstrap example, ALL JS and CSS will be included through the asset pipeline, as long as you followed the instructions.
  3. I do not recommend deleting anything in your template. Just add in the HTML from the example. Be careful not to add to head,body,title tags, etc, so you end up with more than one of those tags.
  4. As you copy links, instead of just copying the <a href ... stuff, use the link_to function. See my navbar with the "Todo App link" as an example. You may also create a nav-link helper. I have one that works well for Bootstrap navbars commented out in `app/helpers/sites.rb`. DO NOT COPY AND PASTE.
6. Setup your default template (app/views/layout/application.html.erb) using Bootstrap's [examples](http://getbootstrap.com/docs/4.0/examples/). DO NOT COPY MINE. You will receive a 0 if you do.
7. After you have setup your layout, you can look at my application.html.erb file to add in notification code so that flash messages will show up. This and the display title (from step 4) is the only code you can copy from my template. Don't copy and paste it. Type it in yourself.
