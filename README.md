# Retrying

[![Gem Version](https://badge.fury.io/rb/retrying.png)](http://badge.fury.io/rb/retrying)

Runs a code block, and retries it when an exception occurs.

It's configured using optional parameters `:tries`, `:on` and `:sleep`.

Should the number of retries be reached without success, the last exception
will be raised.

## Installation

Add this line to your application's Gemfile:

``` bash
gem 'retrying'
```

And then execute:

``` bash
$ bundle
```

Or install it yourself as:

``` bash
$ gem install retrying
```

## Usage

Open an URL, try up to three times retrying when an `OpenURI::HTTPError` occurs.

``` ruby
require "retrying"
require "open-uri"

include Retrying

retrying(:tries => 3, :on => OpenURI::HTTPError, :sleep => 0.5) do
  xml = open("http://example.com/test.xml").read
end
```

Do _something_, try up to five times for either `ArgumentError` or
`TimeoutError` exceptions.

``` ruby
retrying(:tries => 5, :on => [ArgumentError, TimeoutError]) do
  # some crazy code
end
```

## Alternatives

* [nfedyashev/retryable](https://github.com/nfedyashev/retryable)
* [robertsosinski/retryable](https://github.com/robertsosinski/retryable)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

