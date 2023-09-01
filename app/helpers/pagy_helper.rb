# frozen_string_literal: true

module PagyHelper
  def pagy_attributes(pagy)
    {
      count: pagy.count,
      page: pagy.page,
      items: pagy.items,
      pages: pagy.pages,
      last: pagy.last,
      next: pagy.next,
      prev: pagy.prev
    }
  end
end
