require 'retrying/version'

module Retrying
  def retrying(options = {}, &block)
    options = { :on => StandardError, :tries => 2, :sleep => 0 }.merge(options)
    exceptions = Array(options[:on])

    attempts = 0
    begin
      yield
    rescue *exceptions => ex
      attempts += 1
      raise if attempts >= options[:tries]
      sleep(options[:sleep]) if options[:sleep] > 0
      retry
    end
  end
end
