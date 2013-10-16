require 'retrying'

include Retrying

describe Retrying do
  describe '#retrying' do
    it 'retries a block once with no args' do
      tries = 0
      raised = false

      begin
        retrying do
          tries += 1
          raise FloatDomainError
        end
      rescue FloatDomainError
        raised = true
      end

      expect(tries).to eq(2)
      expect(raised).to be_true
    end

    it 'retries a block number of times' do
      tries = 0
      raised = false

      begin
        retrying(:tries => 3) do
          tries += 1
          raise StandardError
        end
      rescue StandardError
        raised = true
      end

      expect(tries).to eq(3)
      expect(raised).to be_true
    end

    it 'retries specific exceptions' do
      tries = 0
      raised = false

      begin
        retrying(:on => IOError) do
          tries += 1
          raise FloatDomainError
        end
      rescue FloatDomainError
        raised = true
      end

      expect(tries).to eq(1)
      expect(raised).to be_true
    end
  end
end
