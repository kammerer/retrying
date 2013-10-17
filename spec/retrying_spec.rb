require 'retrying'

include Retrying

TestError = Class.new(StandardError)

describe Retrying do
  describe '#retrying' do
    it 'retries a block once with no args' do
      tries = 0
      raised = false

      begin
        retrying do
          tries += 1
          raise TestError
        end
      rescue TestError
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
          raise TestError
        end
      rescue TestError
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
          raise TestError
        end
      rescue TestError
        raised = true
      end

      expect(tries).to eq(1)
      expect(raised).to be_true
    end

    it 'sleeps before retrying' do
      def sleep(time)
        @slept = time
      end

      begin
        retrying(:sleep => 1) do
          raise TestError
        end
      rescue TestError
      end

      expect(@slept).to eq(1)
    end
  end
end
