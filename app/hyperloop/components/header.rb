class Header < Hyperloop::Component
  state(:new_todo) { Todo.new }

  render(HEADER) do
    EditItem(todo: state.new_todo).on(:save) { mutate.new_todo Todo.new }
  end
end
