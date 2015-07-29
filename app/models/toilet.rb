class Toilet < ActiveRecord::Base
  include AASM

  belongs_to :group

  aasm column: 'state' do
    state :available, initial: true
    state :occupied

    event :occupy do
      transitions from: :available, to: :occupied
    end

    event :commit do
      transitions from: :occupied, to: :available
    end
  end

end
