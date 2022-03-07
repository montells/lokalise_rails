module LokaliseRailsMontells
  module TaskDefinition
    class Exporter < Base
      class << self
        def export!
          $stdout.print 'Task completed!'
          true
        end
      end
    end
  end
end
