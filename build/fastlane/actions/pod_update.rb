# 国内速度太慢，使用--no-repo-update节约大量的时间
module Fastlane
  module Actions
    class PodUpdateAction < Action
      def self.run(params)
      	Actions.sh "pod update --no-repo-update --verbose"
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
