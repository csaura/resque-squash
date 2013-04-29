module Resque
  module Failure
    class Squash < Base
      def save
        ::Squash::Ruby.notify exception, context
      end

      def context
        {
          :worker => worker,
          :queue => queue,
          :payload => payload
        }
      end

      def self.configure
        configuration = {}
        yield configuration
        ::Squash::Ruby.configure configuration
      end
    end
  end
end
