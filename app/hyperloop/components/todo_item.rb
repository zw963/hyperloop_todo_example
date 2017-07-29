class TodoItem < Hyperloop::Component
  param :todo
  render(LI) do
    INPUT(type: :checkbox, checked: params.todo.completed).on(:click) do |evt|
      params.todo.update(completed: !params.todo.completed)
    end
    SPAN { params.todo.title }
    A { ' -X-' }.on(:click) { params.todo.destroy }
  end
end
