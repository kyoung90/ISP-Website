# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(password: "password", username: "johnathon", email: "johnathon@user.com")

@internet_package = InternetPackage.create(plan: "1 MB", price: 9.99, upload_speed: 1, download_speed: 1)
@internet_package = InternetPackage.create(plan: "3 MB", price: 19.99, upload_speed: 1, download_speed: 3)
@internet_package = InternetPackage.create(plan: "5 MB", price: 29.99, upload_speed: 2, download_speed: 5)
@internet_package = InternetPackage.create(plan: "10 MB", price: 39.99, upload_speed: 2, download_speed: 10)



@payments = Payment.create(user_id: @user.id, internet_package_id: @internet_package.id, payed_date: DateTime.now, months: 1000)
@internetStatusChange = InternetStatusChange.create(active: true, comment: "New service period created.", user_id: @user.id)

@service_period = ServicePeriod.create(user_id: @user.id, internet_package_id: @internet_package.id, start_time: DateTime.now, end_time: DateTime.now + 30.days)