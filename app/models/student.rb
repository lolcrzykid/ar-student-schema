require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :format => { :with => /\w+@\w+\.\w{2,3}/}
  validates :email, uniqueness: true
  validates :age, numericality: { :greater_than => 4}
  validates :phone, :format => { :with => /\d{3}.*\d{3}.*\d{4}/}

  def name
    first_name + " " + last_name
  end

  def age
    now = Date.today
    age = now.year - birthday.year

    # subtract one if birthday hasn't occured this year yet
    if now.month < birthday.month
      age -= 1
    end

    age
  end

end