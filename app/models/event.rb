# == Schema Information
#
# Table name: events
#
#  id                             :bigint          not null, primary key
#  employee_id                    :string          not null
#  timestamp                      :datetime        not null
#  kind                           :integer         not null

class Event < ApplicationRecord

  #===== Enums
  enum kind: {
    in: 0,
    out: 1
  }, _default: :in

  #==== Validates
  validates :employee_id,
            :timestamp,
            :kind,
            presence: true

end
