import { Application } from "@hotwired/stimulus"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()

const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

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

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application };
