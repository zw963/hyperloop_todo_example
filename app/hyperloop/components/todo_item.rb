class TodoItem < Hyperloop::Component
  param :todo
  state editing: false

  render(LI) do
    if state.editing
      EditItem(todo: params.todo)
    else
      INPUT(type: :checkbox, checked: params.todo.completed).on(:click) do
        params.todo.update(completed: !params.todo.completed)
      end
      LABEL { params.todo.title }.on(:double_click) { mutate.editing true }
      A { ' -X-' }.on(:click) { params.todo.destroy }
    end
  end
end
