class Index < Hyperloop::Router::Component
  render(SECTION) do
    UL do
      # 这里的 match 方法来自于 Hyperloop::Router::Component
      # 它是 Hyperloop::Component 的一个子类, 并且添加了 match 方法.
      Todo.send(match.params[:scope]).each do |todo|
        TodoItem(todo: todo)
      end
    end
  end
end
