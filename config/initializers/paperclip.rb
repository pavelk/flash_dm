Paperclip::Attachment.interpolations[:fake_id] = proc do |attachment, style|
  attachment.instance.fake_id
end

Paperclip::Attachment.interpolations[:basename] = proc do |attachment, style|
  attachment.instance.user_id
end