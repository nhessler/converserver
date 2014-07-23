TATFT, Even Sinatra
===========================

###TATFT?
"Test All The F'n Time" - Bryan Lyles

What Testing are we familiar with?
What Are Some of the likely difficulties we face when testing web applications (sinatra)?

What are things we likely need to test?
How do you test them?

Current experience interacting with command line programs
Sinatra is Web Based.

####Converserver: (Converser Server)
  minitest > minitest:spec

####require 'rack/test'
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
  - body*
  - script_name
  - request_method
  - query_string**
  - content_length
  - content_type
  - session
  - media_type
  - ssl?
  - host_with_port
  - port
  - host
  - params
  - referer**
  - referrer**
  - cookies
  - xhr?*
  - url*
  - path*
  - ip*
* last_response
  - original_headers
  - errors*
  - body**
  - empty?
  - length
  - header
  - status**
  - headers
  - invalid?*
  - informational?*
  - successful?** 200
  - redirection?** 302
  - client_error?
  - server_error?
  - ok?** 200
  - bad_request?**
  - forbidden?** 403
  - not_found?** 404
  - redirect?** 302
  - content_type
  - content_length
  - location

####Lets Try one together

####How do we test post requests?

####Can we right a test verifying only post works for a given route?

####How do we test with parameters?

####How do we test redirects?

####Complex Responses (Parsing HTML)
  css selectors and nokogiri

####Add Tests to Idea Box
Lets talk about things we should test for Idea Box App
