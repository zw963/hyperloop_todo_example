# app/hyperloop/components/app.rb

class App < Hyperloop::Component
  render(DIV) do
    "Number of Todos: #{Todo.count}"
  end
end
