class Toilet < ActiveRecord::Base
  include AASM

  belongs_to :group

  aasm column: 'state' do
    state :available, initial: true
    state :occupied
    state :destroyed # Every surface inside "the cell" is sharted on.

    event :occupy do
      transitions from: [:destroyed, :available], to: :occupied
    end

    event :commit do
      transitions from: :occupied, to: :available
    end

    event :destroy do
      transitions from: :occupied, to: :destroyed
    end

    event :clean do
      transitions from: :destroyed, to: :available
    end
  end

end
