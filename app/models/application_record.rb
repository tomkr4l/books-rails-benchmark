class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # Returns all ransackable attributes the old way before Ransack moved to version 4
  # with new privacy by default settings, blocking all attributes by default instead
  # of allowing all by default.
  def self.ransackable_attributes(auth_object = nil)
    authorizable_ransackable_attributes
  end

  # Returns all ransackable associations the old way before Ransack moved to version 4
  # with new privacy by default settings, blocking all associations by default instead
  # of allowing all by default.
  def self.ransackable_associations(auth_object = nil)
    authorizable_ransackable_associations
  end
end
