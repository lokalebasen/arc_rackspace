# TODO
defmodule ArcTest.Storage.Rackspace do
  use ExUnit.Case, async: false
  @img "test/support/image.png"

  defmodule DummyDefinition do
    use Arc.Definition

    def __storage, do: Arc.Storage.Rackspace

    def storage_dir(_, _), do: "arctest/uploads"
  end

end
