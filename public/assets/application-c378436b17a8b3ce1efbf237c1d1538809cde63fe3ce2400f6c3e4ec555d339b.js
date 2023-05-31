// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

setTimeout(function() {
  document.querySelector('.popup').style.opacity = '0';
}, 2000);
