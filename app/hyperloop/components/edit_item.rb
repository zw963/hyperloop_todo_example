class EditItem < Hyperloop::Component
  param :todo
  render do
    edit_input = INPUT(defaultValue: params.todo.title)
    # edit_input.on(:key_down) do |evt|
    #   next unless evt.key_code == 13
    #   params.todo.update(title: evt.target.value)
    # end

    edit_input.on(:blur) do |evt|
      params.todo.update(title: evt.target.value)
    end
  end
end
