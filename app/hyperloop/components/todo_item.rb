class TodoItem < Hyperloop::Component
  param :todo
  render(LI) do
    INPUT(type: :checkbox, checked: params.todo.completed).on(:click) do |evt|
      params.todo.update(completed: !params.todo.completed)
    end
    EditItem(todo: params.todo)
    A { ' -X-' }.on(:click) { params.todo.destroy }
  end
end
