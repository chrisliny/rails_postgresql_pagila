class FilmMailer < ApplicationMailer
  default from: "aspdata@gmail.com"
  
  def film_list
    @films = Film.all.limit 2
    @url = 'http://www.themodernview.com'
    mail(to: 'aspdata@gmail.com', subject: 'New Film List')
  end
end
