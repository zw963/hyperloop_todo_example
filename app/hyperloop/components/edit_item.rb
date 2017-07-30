class EditItem < Hyperloop::Component
  param :todo
  # 添加了两个自定义的 callback,
  # 和 :todo 类似, :todo 用来传入一个值,
  # 而下面的 on_??? 则是定义了两个 `自定义事件',
  # type: Proc 表示这个名称的 param 是个 event 类型的 params
  # 当这个 params.on_save 被调用时, 该事件的 handler(Proc对象) 会被执行.
  param :on_save
  param :on_cancel

  # dom_node 方法返回一个组件被 mount 成功后, 这个组件对应的 node.
  # 当 EditItem 组件 mount 成功后, 设定焦点.
  after_mount { Element[dom_node].focus }

  render do
    edit_input = INPUT(defaultValue: params.todo.title)
    edit_input.on(:key_down) do |evt|
      next unless evt.key_code == 13
      params.todo.update(title: evt.target.value)
      params.on_save.call            # 激活 on_save 自定义事件.
      # 因为声明的时候, 使用了 type: Proc, 意味着这个调用会自动在 params.on_save 之上调用 call 方法.
    end
    edit_input.on(:blur) { params.on_cancel.call } # add
    # edit_input.on(:blur) do |evt|
    #   params.todo.update(title: evt.target.value)
    # end
  end
end
