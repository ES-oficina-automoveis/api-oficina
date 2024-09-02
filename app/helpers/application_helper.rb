module ApplicationHelper
  def status_class(status)
    case status
    when "pendente"
      "badge-pending"
    when "confirmado"
      "badge-confirmed"
    when "em_andamento"
      "badge-in-progress"
    when "concluído"
      "badge-completed"
    else
      "badge-secondary"
    end
  end

  def confirm_delete_button(name, path, options = {})
    default_options = { method: :delete, data: { turbo_confirm: "Tem certeza que deseja excluir?" } }
    options = default_options.merge(options)
    button_to name, path, options
  end
end
