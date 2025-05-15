import { Controller } from "@hotwired/stimulus"

const BACKGROUND_COLORS = ['bg-orange-500', 'bg-red-500', 'bg-lime-500', 'bg-sky-500', 'bg-gray-500'];

export default class extends Controller {
  static targets = ['itemsContainer', 'category', 'categoryItem', 'submissionParams'];
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
    const categoryId = e.currentTarget.dataset.categoryId;
    const success = this.#appendParam(categoryId, this.beingDragged.dataset.itemId);

    if (!success) return;
    if (this.beingDragged.dataset.currentCategoryId) {
      this.#removeParam(this.beingDragged.dataset.currentCategoryId, this.beingDragged.dataset.itemId);
    }

    this.beingDragged.dataset.currentCategoryId = categoryId;
    e.currentTarget.lastElementChild.appendChild(this.beingDragged);
  }

  dropToItemsContainer(e) {
    const currentCategoryId = this.beingDragged.dataset.currentCategoryId;
    const success = this.#removeParam(currentCategoryId, this.beingDragged.dataset.itemId);

    if (!success) return;

    this.beingDragged.dataset.currentCategoryId = null;
    e.currentTarget.appendChild(this.beingDragged);
  }

  #appendParam(categoryId, itemId) {
    const currentParams = JSON.parse(this.submissionParamsTarget.value);

    if (!currentParams[categoryId] || !itemId) return false;

    currentParams[categoryId] = Array.from(new Set([itemId, ...currentParams[categoryId]]));
    this.submissionParamsTarget.value = JSON.stringify(currentParams);

    return true;
  }

  #removeParam(categoryId, itemId) {
    const currentParams = JSON.parse(this.submissionParamsTarget.value);

    if (!currentParams[categoryId] || !itemId) return false;

    currentParams[categoryId] = currentParams[categoryId].filter((id) => id !== itemId);
    this.submissionParamsTarget.value = JSON.stringify(currentParams);

    return true;
  }
}
