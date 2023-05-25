# frozen_string_literal: true

class Report
  include ActiveModel::Validations

  attr_accessor :employee_id, :from, :to

  validates :employee_id, presence: true

  validates :employee_id, numericality: { only_integer: true,
                                          greater_than_or_equal_to: 1 }

  validate :is_a_date?

  def is_a_date?
    from = Date.strptime(self.from, '%Y-%m-%d') rescue false
    to = Date.strptime(self.to, '%Y-%m-%d') rescue false

    errors.add(:from, "is no date") unless from
    errors.add(:to, "is no date") unless to

  end
end
