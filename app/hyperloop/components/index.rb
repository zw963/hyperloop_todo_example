class Index < Hyperloop::Component
  render(SECTION) do
    UL do
      Todo.each do |todo|
        TodoItem(todo: todo)
      end
    end
  end
end
