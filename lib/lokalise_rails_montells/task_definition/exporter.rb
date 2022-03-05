module LokaliseRailsMontells
  module TaskDefinition
    class Exporter < Base
      class << self
        def import!
          $stdout.print 'Task completed!'
          true
        end
      end
    end
  end
end
