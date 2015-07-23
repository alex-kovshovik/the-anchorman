FactoryGirl.define do

  factory :toilet do
    name 'Wonky'
    description 'The only toilet of humanity'

    association :group
  end

end
