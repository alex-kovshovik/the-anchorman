class Toilet < ActiveRecord::Base
  include AASM

  belongs_to :group
  has_many :toilet_transactions

  after_update :record_transaction

  aasm column: 'state' do
    state :available, initial: true
    state :occupied
    state :destroyed # Every surface inside "the cell" is sharted on, or somebody was in there for at least 20 minutes: DO NOT GO NEAR THAT PLACE

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

  def record_transaction
    return if self.state_was == self.state

    ToiletTransaction.create!(toilet_id: self.id, event: self.state)

    # Publish event to the corresponding Redis channel of this toilet :)
    ToiletPublisher.publish(self)
  end

end
