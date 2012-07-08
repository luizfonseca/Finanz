require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Entity.blueprint do
  name { "Zona Sul" }
end

Transaction.blueprint do
  entity
  import
  date { Time.now }
  document_number { "#{sn}" }
  value { -10 }
end

Import.blueprint do
  user
  file { "[]" }
end

User.blueprint do
  email { "test#{sn}@test.com" }
  first_name { "Nicolas" }
  last_name { "Iensen" }
end
