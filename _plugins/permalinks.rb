module Jekyll
  module Drops
    class UrlDrop < Drop
      def lang
        @obj.data['lang']
      end
    end
  end
end
