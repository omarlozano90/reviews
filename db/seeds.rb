# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reviewer.destroy_all
Book.destroy_all

Book.create! [
	{ name: "Eloquent Ruby", author: "Russ Olsen"},
	{ name: "Beginning Ruby", author: "Peter Cooper"},
	{ name: "Metaprogramming Ruby 2", author: "Paolo Perrotta"},
	{ name: "Design Patterns in Ruby", author: "Russ Olsen"},
	{ name: "The Ruby Programming Language", author: "David Flanagan"}

]

100.times {|index| Book.create! name: "Book#{index}", author: "Author#{index}"}


#process used to create to notes to the book "eloquent ruby"
eloquent = Book.find_by name: "Eloquent Ruby"
eloquent.notes.create! [
	{ title: "Wow", note:"Great book to learn Ruby"},
	{ title: "Funny", note:"Dosent put you to sleep"}
]

#process used to add Reviewers to db
reviewers = Reviewer.create! [
	{ name: "Joe", password: "abc123"},
	{ name: "Jim", password: "123abc"}
]

#Assing books to random reviewer
Book.all.each do |book|
	book.reviewer = reviewers.sample
	book.save!
end

