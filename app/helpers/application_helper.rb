module ApplicationHelper
  include Pagy::Frontend

  def hicon(name, options: {})
    options = { class: 'w-5 h-5 text-gray-500' }.merge(options)
    heroicon(name, options: options)
  end
end
