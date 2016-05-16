module VerifyCodeHelper
  def self.send_auth_code_sms number, code
    # unless Rails.env == 'production'
    #   return true
    # end
    require 'net/http'
    require 'uri'
    params = {}
    #修改为您的apikey.可在官网（http://www.yuanpian.com)登录后用户中心首页看到
    apikey = 'a7c5a16db339447d3f950df468c87251'
    #修改为您要发送的手机号码，多个号码用逗号隔开
    mobile = number
    #修改为您要发送的短信内容
    text = '【97gun】您的验证码是 #{code}'
    #智能匹配模板发送HTTP地址
    send_sms_uri = URI.parse('https://sms.yunpian.com/v2/sms/single_send.json')

    params['apikey'] = apikey
    #打印用户信息
    # response =  Net::HTTP.post_form(get_user_info_uri,params)
    # print response.body + "\n"

    params['mobile'] = mobile
    params['text'] = text
    #智能匹配模板发送
    response = Net::HTTP.post_form(send_sms_uri,params)
    print response.body + "\n"
  end
end
