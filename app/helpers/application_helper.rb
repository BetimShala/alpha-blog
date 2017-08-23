module ApplicationHelper
  def gravatar_for(obj, options = { size: 80})

    gravatar_id = Digest::MD5::hexdigest(obj.email.downcase)

    size = options[:size]

    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

    image_tag(gravatar_url, alt: obj.username, class: "rounded-circle")

  end
end
