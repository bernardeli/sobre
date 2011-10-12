module InformationsHelper
  def social_network_to(network, username)
    link_to network.to_s, social_network_url(network, username), :class => network.to_s, :target => :blank, :style => username.blank? ? 'display:none' : ''
  end

  def social_network_url(network, username)
    case network
    when :twitter
      'http://twitter.com/' + username
    when :facebook
      'http://facebook.com/' + username
    when :linkedin
      'http://linkedin.com/in/' + username
    when :orkut
      'http://orkut.com/' + username
    end
  end
end
