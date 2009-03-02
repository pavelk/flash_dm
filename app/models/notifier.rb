class Notifier < ActionMailer::Base
  default_url_options[:host] = "dobra-mama.cz"

  def write_us(note)
    subject "Napiste nam"
    from "Dobra mama <noreply@dobra-mama.cz>"
    recipients 'pavel.krusek@gmail.com'
    sent_on Time.now
    body[:first_name] = note.first_name
    body[:surname] = note.surname
    body[:email] = note.email
    body[:message] = note.message
  end  

end
