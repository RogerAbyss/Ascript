module Fastlane
  module Actions
    class PodUpdateAction < Action
      def self.run(params)
      	Actions.sh "pod update --no-repo-update"
        UI.current.log.info "Successfully pod updale ⬆️ ".green
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Update all pods"
      end

      def self.details
        "Update all pods"
      end

      def self.authors
        ["abyssroger"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
