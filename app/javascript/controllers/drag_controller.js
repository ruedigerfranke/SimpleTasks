import { Controller } from '@hotwired/stimulus'
import Sortable from 'sortablejs'
import Rails from '@rails/ujs'

// Connects to data-controller="drag"
export default class extends Controller {
  initialize() {
    this.url = this.element.dataset.url
  }

  connect() {
    this.sortable = Sortable.create(this.element, {
      group: 'shared',
      animation: 150,
      onEnd: (event) => {
        const id = event.item.dataset.id
        const url = this.url.replace(':id', id)

        const formData = new FormData()
        formData.append('position', event.newIndex + 1)

        Rails.ajax({
          url: url,
          type: 'PATCH',
          data: formData,
        })
      },
    })
  }
}
