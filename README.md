# Pigly
Pigly is a Ruby on Rails - Mobile First app that allows users to find the best dishes on any San Francisco restaurant menu.

 Using the Locu API we display local restaurants and their current menu items for    users to vote on, positive or negative.
Google maps helps users find restaurants in the city and Facebook API let's them share their activity with friends and family.
Data visualization with D3 creates a fun experience to learn more about restaurant demographics and item ranking.
DevBootcamp Students developed Pigly in 7 days.

[See it in action](http://pigly-app.herokuapp.com/)


## Background

After 8 weeks of an intense learning experience, developing multiple Rails and Sinatra CRUD apps, deploying group projects and having fun with JavaScript we decided to create Pigly.

As a team we started with the idea of building a customizable dashboard/analytics platform using D3.js. But the lack of clarity on the use and business case made use narrow the scope 2 days into the project.
We saw an opportunity in the food industry. We analyze the most popular apps available and decided to build one that users can vote on menu items.


## Technologies behind Pigly

* Ruby on Rails
* D3.js
* API’s: Facebook, Google Maps & Locu
* AJAX
* Jquery


## Interesting code

* General Object Oriented approach 
* JavaScript widget design for the voting logic
* API wrapper classes
* Data visualization models and controllers to create the objects needed as dataset for D3
* D3 logic to convert objects into fun visualizations


## Team and main responsibilities

Shawn Seibert:
* Team lead
* Facilitated his knowledge in D3 and encourage other team members to learn and play with that library
* Developed model, controller, views and JavaScript logic behind the Force Plot visualization
* Designed Database structure
* CSS designer

Christiane Kammerl:
* Developed the voting logic using JS widget design pattern and AJAX.
* Developed truncate affects for the restaurant UI.
* During the development of the D3 visualization, supported and pair programed
* Designed Database structure

Adam Dziuk
* Developed Ruby on Rails structure
* Developed all Pigly’s communication with API’s. Models, helpers, views and keys security
* Wrote the entire test suit for the app. 90+% coverage using Rspec

Sebastian Belmar Ponce
* Developed model, controller, views and JavaScript logic behind the Bubble Plot visualization
* During the development of the Locu API communication, supported and pair programed
* Developed CSS final design


## Git Flow

As a convention we fetch the master and solve all our merge conflicts locally. Once the merge passed locally we created a pull request and other member of the team accepted and merge in github. 


## Tests

We have a 90+% test coverage written in Rspec.


## License

MIT
