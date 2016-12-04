# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def createTestUser!

  user = User.new
  user.uuid = "12345"
  api_key = ApiKey.generate
  api_key.access_token = "test_token"
  user.api_keys << api_key
  user.save!
end

def main

  createTestUser!()

end

main()
