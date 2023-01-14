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
#  nhs_number     :decimal(, )
#  preferred_name :text
#  screening      :integer
#  seen           :integer
#  sex            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Child < ApplicationRecord
  enum :gp, ['Local GP']
  enum :screening, ['Approved for vaccination']
  enum :consent, ['Parental consent (digital)']
  enum :seen, ['Not yet']
end
