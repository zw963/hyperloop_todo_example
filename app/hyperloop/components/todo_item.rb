class TodoItem < Hyperloop::Component
  param :todo
  state editing: false

  render(LI) do
    if state.editing
      # 如果处在编辑状态, 使用 EditItem 组件(代表正在编辑页面的组件).
      # 这里为自定义 on_save/on_cancel 事件绑定了 handler 方法.
      # 此时, EditItem 的 params.on_save 返回的是 handler 对象.(一个 Proc)

      EditItem(todo: params.todo).on(:save, :cancel) do
        mutate.editing false
      end
    else
      INPUT(type: :checkbox, checked: params.todo.completed).on(:click) do
        params.todo.update(completed: !params.todo.completed)
      end
      LABEL { params.todo.title }.on(:double_click) { mutate.editing true }
      A { ' -X-' }.on(:click) { params.todo.destroy }
    end
  end
end
