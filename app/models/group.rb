require 'net/http'
require 'json'

class Group < ApplicationRecord

  extend FriendlyId
  friendly_id :slug_candidates, :use => [:slugged, :simple_i18n]

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end

  before_validation :add_lowercase_name

  def add_lowercase_name
    self.lowercase_name = name.downcase
  end

  # Fields validations
  validates :name, presence: true
  validates :server_id, presence: true, numericality: { other_than: 0 }, uniqueness: false

  # Associations
  has_and_belongs_to_many :records, optional: true, dependent: :nullify
  has_and_belongs_to_many :disciplines, optional: true
  belongs_to :university, optional: true
  belongs_to :faculty, optional: true
  belongs_to :speciality, optional: true

  # bin/rails runner 'Group.reset_update_date'
  def self.reset_update_date
    Group.update_all(updated_at: DateTime.current - 21.hour)
  end


  # Import records for current Group
  def import_records(date)
    # Find a class
    service = University.service_for(university.uid)
    return if service.nil?

    # Call static method on class
    on_class = service
    on_class.constantize.send("import_records_for_group", self, date)
  end


  # Check if need to update records in the Group
  def need_to_update_records
    needToUpdate = false

    # Check by date
    if DateTime.current >= (updated_at + 20.hour)
      needToUpdate = true
    end

    return needToUpdate
  end

end
