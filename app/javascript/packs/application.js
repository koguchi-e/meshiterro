// Entry point for the application
development:
  compile: true

import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; 


Rails.start()
Turbolinks.start()
ActiveStorage.start()