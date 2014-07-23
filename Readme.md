TATFT, Even Sinatra
===========================
####branches
* master - has tests stubbed out to be completed
* solutions - has all tests filled out and passing

####How to run things
in /conversever.rb you can comment and uncomment the appopriate test file as needed.
Each section below  has it's related converserver test file for easy lookup.


**running tests**

    bundle install
    bundle exec ruby converserver.rb

**running app**

    bundle install
    bundle exec rackup

####Converserver: (Converser Server) Tests & Specs, Specs & Tests
    converserve00.rb

####require 'rack/test'
    conversev01.rb

  * require
  * include
  * def app

###look at example


Lots to break down here: What rack test gets us
* mock request
  - get*
  - post*
  - put
  - delete
  - patch

* last_request

* last_response
  - body
  - status
  - ok?
  - not_found?
  - redirect?
  - location*

####Lets Try one together
    converserver02.rb

####How do we test post requests?
    converserver03.rb

####Can we right a test verifying only post works for a given route?
    converserver04.rb

####How do we test with parameters?
    converserver05.rb

####How do we test redirects?
    converserver06.rb

####Complex Responses (Parsing HTML)
    converserver07
