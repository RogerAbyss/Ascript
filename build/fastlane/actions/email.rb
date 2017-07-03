require 'rubygems'
require 'mail' 
require '~/Desktop/Abyss/config_private.rb'
require '~/Desktop/script/build/config/config.rb'

module Fastlane
  module Actions
    class EmailAction < Action
      def self.run(params)

        mode        = params[:mode]
        scheme      = params[:scheme]

        title      = "#{scheme}.#{mode}发布了！"

        Actions.sh "git log --graph  --abbrev-commit --pretty=format:'%s    - %an(%cr)' -10 >report-git.txt"
        file = File.read("report-git.txt")

        smtp = {
          :address => 'smtp.qq.com', 
          :port => 25, 
          :domain => 'qq.com', 
          :user_name => Abyss::Build::Config::QQ, 
          :password => Abyss::Build::Config::EMAIL_QQ_TOKEN,
          :enable_starttls_auto => true,
          :openssl_verify_mode => 'none', 
        }

        Mail.defaults { delivery_method :smtp, smtp}

        mail = Mail.new do
          from Abyss::Build::Config::QQ + '@qq.com'
          to Abyss::Build::Config::EMAIL_SENDER
          cc Abyss::Build::Config::EMAIL_CC
          subject title
          body Abyss::Build::Config::EMAIL_CONTENT + file
        end

        mail.deliver!

        UI.current.log.info "Successfully send e-mial ⬆️ ".green
    end

      #####################################################
      # @!group Documentation
      #####################################################


      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :mode,
                                       description: "您发布的模式(release/debug/beta)"),
          FastlaneCore::ConfigItem.new(key: :scheme,
                                       description: "scheme"),
        ]
      end

      def self.return_value
        # If you method provides a return value, you can describe here what it does
      end

      def self.description
        "send e-mail"
      end

      def self.details
        "send e-mail"
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