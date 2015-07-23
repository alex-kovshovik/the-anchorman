fail 'Database is already initialized!' if Group.exists?

group = Group.create!(name: 'Default')

Toilet.create!(group: group, name: 'Wonky', description: 'The only toilet humanity has left')

User.create!(
  group: group,
  email: 'test@test.com',
  password: 'tdsfu11pass',
  password_confirmation: 'tdsfu11pass',
  first_name: 'Shart',
  last_name: 'Leakoff'
)
