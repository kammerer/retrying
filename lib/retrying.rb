require 'retrying/version'

module Retrying
  def retrying(options = {}, &block)
    options = { :on => StandardError, :tries => 2 }.merge(options)
    exceptions = Array(options[:on])

    attempts = 0
    begin
      yield
    rescue *exceptions => ex
      attempts += 1
      raise if attempts >= options[:tries]
      retry
    end
  end
end
