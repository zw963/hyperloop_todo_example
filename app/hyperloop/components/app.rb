# 这里从 Hyperloop::Component 替换为 Hyperloop::Router
class App < Hyperloop::Router
  # 告诉路由器, 使用 html5 browser 的 history 来保存 history. (back/forward buttons)
  # 另一个常见的选项是使用 url hashs, 设定为 :hash 即可.
  history :browser
  route do # note instead of render we use the route method
    SECTION do
      Header()
      # 当前路由如果精确的匹配 /,  则重定向到另一个路由.(在下面定义)
      # 注意: 这里的每一个 Route 都会被依次执行一次.
      # 如果匹配, 相应的 block 或 mounts 参数会被执行.
      Route('/', exact: true) { Redirect('/all') }
      # 这里原来是 Index(),  我们替换为一个路由.
      # 这里使用了 URL fragment, 即: 如果匹配 /xxx, 那么 scope 就是 :xxx
      # 这个 :xxx 可以在修改后的 Index 的 match.params[:scope](同名符号) 中拿到.
      Route('/:scope', mounts: Index)
      Footer()
    end
  end
end
