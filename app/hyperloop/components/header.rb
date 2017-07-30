class Header < Hyperloop::Component
  state(:new_todo) { Todo.new }

  render(HEADER) do
    EditItem(
      todo:      state.new_todo,
      on_save:   proc { puts 'hello'; mutate.new_tudo Todo.new },
      on_cancel: proc {}
    )
  end
end
