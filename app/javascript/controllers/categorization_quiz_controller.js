import { Controller } from "@hotwired/stimulus"

const BACKGROUND_COLORS = ['bg-orange-500', 'bg-red-500', 'bg-lime-500', 'bg-sky-500', 'bg-gray-500'];

export default class extends Controller {
  static targets = ['itemsContainer', 'category', 'categoryItem'];
  static values = {
    categoriesCount: { type: Number }
  };

  initialize() {
    this.currentIndex = 0;
  }

  categoryTargetConnected(category) {
    const color = BACKGROUND_COLORS[this.currentIndex];
    category.classList.add(color);

    this.currentIndex += 1;
    this.currentIndex %= BACKGROUND_COLORS.length;
  }

  connect() {
  }

  dragStartHandler(e) {
    e.currentTarget.classList.add('bg-green-500');

    this.beingDragged = e.currentTarget;
  }

  dragEndHandler(e) {
    e.currentTarget.classList.remove('bg-green-500');
  }

  dragOverHandler(e) {
    e.preventDefault();
  }

  dropHandler(e) {
    e.currentTarget.lastElementChild.appendChild(this.beingDragged);
  }

  dropToItemsContainer(e) {
    e.currentTarget.appendChild(this.beingDragged);
  }
}
