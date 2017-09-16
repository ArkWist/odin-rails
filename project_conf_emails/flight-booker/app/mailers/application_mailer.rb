class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@example.com'
  
  def booking_email(passenger)
    @passenger = passenger
    @url       = 'https://example.com/login'
    mail(to: @passenger.email, subject: 'Thank you for booking')
  end
  
end
