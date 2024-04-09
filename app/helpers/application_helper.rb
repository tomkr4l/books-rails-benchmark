module ApplicationHelper
  include Pagy::Frontend

  def hicon(name, options: {})
    options = { class: 'w-5 h-5' }.merge(options)
    heroicon(name, options: options)
  end

  def bool_icon(value)
    if [false, nil, 0, '0'].include?(value)
      hicon('x-circle')
    else
      hicon('check-circle')
    end
  end
end
