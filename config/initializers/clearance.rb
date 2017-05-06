Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
  config.routes = false #Clearance has already auto generate a "signin signout thingy in your routes. i dont know why you have two copy of it. here's the solution to dump a copy of a default. "
end
