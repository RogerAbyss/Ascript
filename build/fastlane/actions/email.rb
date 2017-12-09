require 'rubygems'
require 'mail' 
require "yaml"

module Fastlane
  module Actions
    class EmailAction < Action
      def self.run(params)

        mode        = params[:mode]
        scheme      = params[:scheme]

        # Replace Me
        config      = YAML.load_file('/Users/abyss/Desktop/script/build/config/config.yml')
        proviteConfig = YAML.load_file('/Users/abyss/Desktop/script/build/config/private/config.yml')

        title      = "#{scheme}.#{mode}发布了！"

        Actions.sh "git log --graph  --abbrev-commit --pretty=format:'%s    - %an(%cr)' -30 >report-git.txt"
        file = File.read("report-git.txt")

        smtp = {
          :address => 'smtp.qq.com', 
          :port => 25, 
          :domain => 'qq.com', 
          :user_name => config["Email"]["admin"]["sender"], 
          :password => proviteConfig["Email"]["admin"]["token"],
          :enable_starttls_auto => true,
          :openssl_verify_mode => 'none', 
        }

        Mail.defaults { delivery_method :smtp, smtp}

        if mode == "release"

          title = "一个新的IOS App已经成功上传Appstore!"
          
        mail = Mail.new do
          from config["Email"]["admin"]["sender"] + '@qq.com'
          to config["Email"]["receiver"]
          cc config["Email"]["copy2"]
          subject title
          body config["Email"]["content"] + file
          charset = "UTF-8"
        end
        else

        mail = Mail.new do
          from config["Email"]["admin"]["sender"] + '@qq.com'
          to config["Email"]["receiver"]
          cc config["Email"]["copy"]
          subject title
          body config["Email"]["content"] + file
          charset = "UTF-8"
        end
        end

        mail.charset = 'UTF-8'
        mail.content_transfer_encoding = '8bit'
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