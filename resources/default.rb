actions :install, :delete
default_action :install

attribute :name, :name_attribute => true, :kind_of => String, :required => true
attribute :source, :required => true, :kind_of => String

attr_accessor :exists