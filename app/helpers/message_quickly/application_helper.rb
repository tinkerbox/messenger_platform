module MessageQuickly
  module ApplicationHelper

    def send_to_messenger(params = {}, client = nil)
      params[:class] = 'fb-send-to-messenger'
      params[:messenger_app_id] = client.try(:app_id) || ENV['FACEBOOK_APP_ID']
      params[:page_id] = client.try(:page_id) || ENV['FACEBOOK_PAGE_ID']
      params[:data] ||= {}
      params[:data][:ref] ||= 'PASS_THROUGH_PARAM'
      params[:color] ||= 'blue'
      params[:size] ||= 'standard'
      content_tag(:div, '', params)
    end

    def message_us(params = {}, client = nil)
      params[:class] = 'fb-messengermessageus'
      params[:messenger_app_id] = client.try(:app_id) || ENV['FACEBOOK_APP_ID']
      params[:page_id] = client.try(:page_id) || ENV['FACEBOOK_PAGE_ID']
      params[:color] ||= 'blue'
      params[:size] ||= 'standard'
      content_tag(:div, '', params)
    end

    def short_link(page_name, ref = nil)
      if ref
        "http://m.me/#{page_name}?ref=#{ref}"
      else
        "http://m.me/#{page_name}"
      end
    end

    # def close_window(image_url = '', display_text = '')
    #   redirect_to "https://www.messenger.com/closeWindow/?image_url=#{image_url}&display_text=#{display_text}."
    # end

  end
end
