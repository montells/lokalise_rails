module LokaliseRailsMontells
  module TaskDefinition
    class Importer < Base
      class << self
        def import!
          $stdout.print 'Task completed!'
          true
        end
      end
    end
  end
end
