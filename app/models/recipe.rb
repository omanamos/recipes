class Recipe < ActiveRecord::Base
  validates_presence_of :title
#  acts_as_solr :fields => [:title]
  has_many :ingredients, :dependent => :restrict
  belongs_to :user
end
