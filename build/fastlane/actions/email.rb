require 'rubygems'
require 'mail' 
require '~/Desktop/Abyss/config_private.rb'
require '~/Desktop/script/build/config/config.rb'

# 国内速度太慢，使用--no-repo-update节约大量的时间
module Fastlane
  module Actions
    class EmailAction < Action
      def self.run(params)

      	smtp = {
 			:address => 'smtp.qq.com', 
 			:port => 25, 
 			:domain => 'qq.com', 
 			:user_name => Abyss::Build::Config::QQ, 
 			:password => Abyss::Build::Config::QQ_TOKEN,
 			:enable_starttls_auto => true,
 			:openssl_verify_mode => 'none', 
		}

		Mail.defaults { delivery_method :smtp, smtp}

		mail = Mail.new do
 			from Abyss::Build::Config::QQ + '@qq.com'
 			to Abyss::Build::Config::EMAIL_SENDER
 			subject Abyss::Build::Config::EMAIL_TITLE
  			body Abyss::Build::Config::EMAIL_CONTENT
		end

		mail.deliver!
        UI.current.log.info "Successfully send e-mial ⬆️ ".green
      end

      #####################################################
      # @!group Documentation
      #####################################################

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