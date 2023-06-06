import Rails from "@rails/ujs"
require("@rails/activestorage").start()

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