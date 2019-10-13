class CourseMailer < ApplicationMailer
  default from: 'support@simple_rest_api.com'

  def new_course
    @course = params[:course]
    mail(to: 'guest@guest.com', subject: 'Добавлен новый курс')
  end
end
