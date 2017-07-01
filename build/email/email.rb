require 'rubygems'
require 'mail' 
 
smtp = {
 :address => 'smtp.qq.com', 
 :port => 25, 
 :domain => 'qq.com', 
 :user_name => '492764029', 
 :password => "",
 :enable_starttls_auto => true,
 :openssl_verify_mode => 'none', 
}

Mail.defaults { delivery_method :smtp, smtp}

mail = Mail.new do
  from '492764029@qq.com'
  to 'roger_ren@qq.com'
  subject "test"
  body 'body'
end

mail.deliver!