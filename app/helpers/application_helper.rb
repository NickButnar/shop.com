module ApplicationHelper

  def inline_errors_for(object, field)
    if object.errors[field.to_sym].any?
      content_tag(:p, object.errors[field.to_sym].first, class: 'form__error')
    end
  end
end
