import { Controller } from "@hotwired/stimulus"
import TomSelect from 'tom-select'

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    console.log('hello from tom select stimulus controller')
    new TomSelect(this.element, {})
  }
}
