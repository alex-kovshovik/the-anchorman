FactoryGirl.define do

  factory :group do
    name 'Default'

    initialize_with { Group.where(name: self.name).first_or_initialize }
  end

end
