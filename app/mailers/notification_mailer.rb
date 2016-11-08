class NotificationMailer < ApplicationMailer


  default from: 'aceleradora10@gmail.com'

  def send_email_new_user user
    @user = user
    @url  = 'https://snap-ci.com/aceleradora-TW/HemoHeroes/branch/master'
    mail(to: @user.email,
    subject: 'Bem vindo ao HemoHeroes',
    template_path: 'notification_mailer',
    template_name: 'new_user_donator_email.html.erb')
  end

  def send_email user
    @user = user
    @url  = 'https://snap-ci.com/aceleradora-TW/HemoHeroes/branch/master'
    mail(to: @user.email,
    subject: 'Teste implementação',
    template_path: 'layouts',
    template_name: 'mailer.html.erb')
  end

  def send_notification_to_admin
    @url = 'http://hemoheroestw-staging.herokuapp.com/admin'
    mail(to: 'aceleradora10@gmail.com',
    subject: 'Validar cadastro de novo banco de sangue',
    template_path: 'notification_mailer',
    template_name: 'new_blood_bank_email')
  end


end
