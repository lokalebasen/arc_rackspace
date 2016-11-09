defmodule Arc.Storage.Rackspace do

  def put(definition, version, {file, scope}) do
    destination_dir = definition.storage_dir(version, {file, scope})
    rackspace_key = Path.join(destination_dir, file.file_name)

    do_put(file, rackspace_key)
  end

  def url(definition, version, file_and_scope, options \\ []) do
    build_url(definition, version, file_and_scope, options)
  end

  #
  # Private
  #

  defp do_put(file, rackspace_key) do
    data = extract_binary(file)
    file_name = URI.encode(rackspace_key)

    Rackspace.Api.CloudFiles.Object.put(container_name, file_name, data)
  end

  # Returns the public url for the file
  defp build_url(definition, version, file_and_scope, _options) do
    Path.join cdn_host, rackspace_key(definition, version, file_and_scope)
  end

  defp cdn_host do
    Application.get_env(:arc, :rackspace_cdn_url)
  end

  defp extract_binary(file) do
    Map.get(file, :binary) || File.read!(file.path)
  end

  defp container_name do
    Application.get_env(:arc, :rackspace_container_name)
  end

  defp rackspace_key(definition, version, file_and_scope) do
    Path.join([
      definition.storage_dir(version, file_and_scope),
      Arc.Definition.Versioning.resolve_file_name(definition, version, file_and_scope)
    ])
  end

end
