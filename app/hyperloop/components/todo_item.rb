class TodoItem < Hyperloop::Component
  param :todo
  render(LI) do
    INPUT(type: :checkbox, checked: params.todo.completed).on(:click) do |evt|
      params.todo.update(completed: !params.todo.completed)
    end
    params.todo.title
  end
end
