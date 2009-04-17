class Notifier < ActionMailer::Base
  default_url_options[:host] = "dobra-mama.cz"

  def write_us(note)
    subject "Napiste nam"
    from "Dobra mama <noreply@dobra-mama.cz>"
    #recipients [ "danone@lion.cz", "zuzana.smejkalova@danone.com", "diana.macovei@eurorscg4d.cz" ]
    recipients [ "danone@lion.cz", "diana.macovei@gmail.com" ]
    sent_on Time.now
    body[:first_name] = note.first_name
    body[:surname] = note.surname
    body[:email] = note.email
    body[:message] = note.message
  end
  
  def send_to_friend(friend)
    subject "Zprava z dobra-mama.cz - #{friend.sender_name}"
    from "Dobra mama <#{friend.sender_mail}>"
    recipients friend.recipient_mail
    sent_on Time.now
    body[:sender_name] = friend.sender_name
    body[:message] = friend.message
    body[:link] = friend.gallery_link
  end
  
  def registration_mail(user)
    subject "Vítejte na www.dobra-mama.cz"
    from "Dobra mama <noreply@dobra-mama.cz>"
    recipients user.email
    sent_on Time.now
  end
  
  def shopping_list(shopping)
    subject "Nákupní lístek z www.dobra-mama.cz"
    from "Dobra mama <noreply@dobra-mama.cz>"
    recipients shopping.mail
    sent_on Time.now
    @content_type = 'text/html' 
    body[:id] = shopping.id
    body[:msg] = shopping.msg
    body[:user] = shopping.user
    body[:basket] = shopping.baskets
  end    

end
