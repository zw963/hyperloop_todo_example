class App < Hyperloop::Component
  render(SECTION) do
    Header()
    Index()
    Footer()
  end
end
