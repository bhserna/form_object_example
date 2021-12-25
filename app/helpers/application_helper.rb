module ApplicationHelper
  def errors_for(model, key)
    tag.div(class: "errors") do
      model.errors.messages_for(key).join(", ")
    end
  end
end
