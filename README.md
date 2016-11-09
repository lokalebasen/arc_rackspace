# Arc Rackspace

Arc Rackspace provides an [`Arc`](https://github.com/stavro/arc) storage back-end for [`Rackspace`](https://www.rackspace.com/).

> **WARNING**: This is a development version: It contains the latest changes, but may also have several known issues, including crashes and data loss situations. In fact, it may not work at all.

## Installation

Add the latest stable release to your `mix.exs` file:

```elixir
defp deps do
  [
    arc_rackspace: "~> 0.0.1"
  ]
end
```

You must also add `arc_rackspace` as startup dependencies your application's `mix.exs` file:

```elixir
def application do
  [mod: {MyApp, []},
   applications: [:phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext,
                 :phoenix_ecto, :postgrex, :arc_rackspace]]
end
```

Then run `mix deps.get` in your shell to fetch the dependencies.

### Configuration

To store your attachments in `Rackspace Cloud Files`, you'll need to provide a bucket destination in your application config:

```elixir
config :arc,
  storage: Arc.Storage.Rackspace,
  rackspace_container_name: 'default',
  rackspace_cdn_url: 'http://XYZ.r54.cf3.rackcdn.com/'
```
In addition, Rackspace must be configured with the appropriate credentials.

```elixir
config :rackspace, :api,
  api_key:  "xxxxxxxxxxxxx",
  username: "yyyyyyyyyyyyy",
  password: "zzzzzzzzzzzzz"
```

Connection to Rackspace API's will require your username and either your account password, or your account api key. It is recommended that you use the api key which can be obtained by logging into your Rackspace account.

You probably want to load the private key from an ENV variable rather than hard-code it the config.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License and Author

Author 2016 Anton Maminov

Copyright: 2016 [Lokalebasen.dk](https://www.lokalebasen.dk/)

This project is licensed under the MIT license, a copy of which can be found in the LICENSE file.
