module ApplicationHelper

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form_group has-error'
    else
      content_tag :div, capture(&block), class: 'form_group'
    end
  end
end
