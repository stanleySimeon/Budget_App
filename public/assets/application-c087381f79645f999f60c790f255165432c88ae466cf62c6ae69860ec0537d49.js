// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"

Rails.start()

document.addEventListener("DOMContentLoaded", () => {
  const elements = document.querySelectorAll("[data-confirm]")
  elements.forEach(element => {
    element.addEventListener("click", event => {
      if (!confirm(element.dataset.confirm)) {
        event.preventDefault()
      }
    })
  })
})
;
