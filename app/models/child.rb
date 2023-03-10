# == Schema Information
#
# Table name: children
#
#  id             :bigint           not null, primary key
#  consent        :integer
#  dob            :date
#  first_name     :text
#  gp             :integer
#  last_name      :text
#  nhs_number     :bigint
#  preferred_name :text
#  screening      :integer
#  seen           :integer
#  sex            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_children_on_nhs_number  (nhs_number) UNIQUE
#
class Child < ApplicationRecord
  enum :sex, %w[Female Male]
  enum :gp, ["Local GP"]
  enum :screening, ["Approved for vaccination"]
  enum :consent, ["Parental consent (digital)"]
  enum :seen, ["Not yet", "Vaccinated"]

  has_and_belongs_to_many :campaigns

  def full_name
    "#{first_name} #{last_name}"
  end

  # TODO: Needs testing for calculations around leap years, etc.
  def age
    now = Time.zone.now.to_date
    now.year - dob.year -
      (
        if now.month > dob.month ||
             (now.month == dob.month && now.day >= dob.day)
          0
        else
          1
        end
      )
  end

  def as_json(options = {})
    super.merge("full_name" => full_name, "age" => age)
  end
end
