class CodeMailer < ActionMailer::Base
  def invite_email(email, link)
    @link = link
    mail(from: 'kirill.dmitrievich24@yandex.ru', to: email, subject: 'You get invite')
  end
end