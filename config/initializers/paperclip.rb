Paperclip::Attachment.interpolations[:fake_id] = proc do |attachment, style|
  attachment.instance.fake_id
end