# Rails supports six types of associations:
# * belongs_to
# * has_one
# * has_many
# * has_many :through
# * has_one :through
# * has_and_belongs_to_many


class Pet < ActiveRecord::Base # Class method Owner inherits Base class for all Sinatra applications and middleware.
  belongs_to :owner # creats the link between pets and oweners since Pets have to belong to an owner
end
