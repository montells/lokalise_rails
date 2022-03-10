# frozen_string_literal: true

require 'pathname'

module LokaliseRailsMontells
  module TaskDefinition
    class Base
      class << self
        def api_client
          @api_client ||= ::Lokalise.client(LokaliseRailsMontells.api_token)
        end

        private

        def proper_ext?(row_path)
          path = row_path.is_a?(Pathname) ? row_path : Pathname.new(row_path)
          LokaliseRailsMontells.file_ext_regexp.match?(path.extname)
        end
      end
    end
  end
end
