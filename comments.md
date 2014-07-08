# Review Notes by sgharms

##  Initial impressions

* `db:create:all db:migrate db:seed` all worked.  Thanks
* initial page load worked. Thanks
* Search for a restaurant fails with:


      Started POST "/restaurants/search" for 127.0.0.1 at 2014-07-07 10:23:37 -0700
      Processing by RestaurantsController#search as HTML
        Parameters: {"utf8"=>"✓",
      "authenticity_token"=>"c5Oztr+SqxAfMpw1877470lrrZ/hFfL4ciBCK0wg0hA=",
      "restaurant"=>{"name"=>"jabu"}}
        Restaurant Load (0.3ms)  SELECT "restaurants".* FROM "restaurants" WHERE
      "restaurants"."name" = 'jabu' LIMIT 1
      Completed 404 Not Found in 1.3ms

      ActionController::RoutingError (No route matches {:action=>"show",
      :controller=>"restaurants", :id=>nil}):
        app/controllers/restaurants_controller.rb:10:in `search'


        Rendered
      /Users/sgharms/.gem/ruby/2.1.2/gems/actionpack-3.2.18/lib/action_dispatch/middleware/templates/rescues/routing_error.erb
      within rescues/layout (0.8ms)

Essential activity does not work on fresh checkout of `master`

## Asset loading

You've included every asset in the jQuery UI library.  This slows down your
app.  The reason the files are modularly built is so that you can only use the
features that you _actually_ use.

You are also missing an asset as you can see in each refresh of the app.

    http://localhost:3000/assets/images/ui-bg_flat_75_ffffff_40x100.png 

## jQuery Autocomplete Config

1.  What happens if i enter `jabu` against your test data?  I get no feedback and I
think your app is broken. You want to give feedback here.

2.  After picking a name I expect the redirect event to fire.  I don't want to have
to hit enter here.  You can alter this using jQuery autocomplete. If you're
going to use jQuery UI you have to plan on investing some time in getting it to
integrate nicely.  It's rarely a 100% drop-in fix. Sometimes you might even
find it easier / better to use a hand-rolled solution.

## Tests

* Whoa, that's a lot of inserts
