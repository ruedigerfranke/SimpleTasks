// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "@hotwired/turbo-rails";
import "channels";
// import "controllers";
import "core-js/stable";
import "regenerator-runtime/runtime";
import * as ActiveStorage from "@rails/activestorage";
import Rails from "@rails/ujs";

import "stylesheets/application.scss";

Rails.start();
ActiveStorage.start();
