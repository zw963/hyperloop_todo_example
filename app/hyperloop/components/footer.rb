class Footer < Hyperloop::Component
  include HyperRouter::ComponentMethods
  def link_item(path)
    # 注意这里的 css 属性, marge-right, 写法是类似于 JS 的写法,
    # 这样的做法足够特殊, 让我们可以立即知道, 哦, 这是一个 CSS 属性!
    # 然后, 10px,  简写为 10.
    NavLink(href: "/#{path}", style: {marginRight: 10}) { path.camelize }
  end

  render(DIV) do
    link_item(:all)
    link_item(:active)
    link_item(:completed)
  end
end
