class Page
  include Mongoid::Document

  field :title,       :type => String
  field :subtitle,    :type => String
  field :description, :type => String
  field :twitter,     :type => String
  field :facebook,    :type => String
  field :linkedin,    :type => String
  field :orkut,       :type => String
  field :address,     :type => String
  field :phone,       :type => String
  field :email,       :type => String

  embedded_in :user
end
