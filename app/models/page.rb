class Page
  include Mongoid::Document

  field :title,       :type => String
  field :subtitle,    :type => String
  field :description, :type => String, :default => ''
  field :twitter,     :type => String
  field :facebook,    :type => String
  field :linkedin,    :type => String
  field :orkut,       :type => String
  field :address,     :type => String
  field :phone,       :type => String
  field :email,       :type => String
  field :theme,       :type => String, :default => '01'

  embedded_in :user
end
