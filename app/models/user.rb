# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :old_password

  has_secure_password validations: false
  validate :password_presence
  validate :correct_old_password, on: :update
  validate :password_complexity

  validates :password, confirmation: true, allow_blank: true

  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: true

  private

  def correct_old_password
    return if authenticate(old_password)

    errors.add :old_password, 'incorrect password'
  end

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end

  def password_complexity
    # https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$)/

    errors.add :password,
               'complexity requirement not met. Minimum length 8 characters, at least one letter and one number'
  end
end
