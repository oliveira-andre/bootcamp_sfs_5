# frozen_string_literal: true

class MarketingMailer < ApplicationMailer
  def campaign(client, title, body)
    @body = body
    mail to: client.email, subject: title
  end
end
