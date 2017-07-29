class TodoItem < Hyperloop::Component
  param :todo
  render(LI) do
    params.todo.title
  end
end
