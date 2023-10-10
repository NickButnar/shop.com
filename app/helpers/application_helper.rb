# frozen_string_literal: true

module ApplicationHelper
  def inline_errors_for(object, field)
    content_tag(:p, object.errors[field.to_sym].first, class: 'form__error') if object.errors[field.to_sym].any?
  end
end
