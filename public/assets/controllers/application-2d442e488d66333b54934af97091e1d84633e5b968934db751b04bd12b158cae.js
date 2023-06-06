import { Application } from "@hotwired/stimulus"
//= require rails-ujs

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

$(document).on('turbolinks:load', function() {
  $('[data-confirm]').click(function() {
    return confirm($(this).data('confirm'));
  });
});
