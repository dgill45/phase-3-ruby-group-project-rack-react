Book.destroy_all

20.times do 
    Book.create(
        title: Faker::Book.title,
        author: Faker::Book.author,
        publisher: Faker::Book.publisher,
        genre: Faker::Book.genre,
    )



Member.create(name: "Pak Jardone", fav_author: "Stephen King")
Member.create(name: "Jasmine Sky", fav_author: "Chaucer")
Member.create(name: "Othello Wilson", fav_author: "Toni Morrison")
Member.create(name: "David Bell", fav_author: "Donald Goines")
Member.create(name: "Desiree Atom", fav_author: 'Ta-Nehisi Coates')
Member.create(name: "Jack Kurby", fav_author: "Neil DeGrasse Tyson")
Member.create(name: "Karen Krane", fav_author: "J. California Cooper")


Comment.create(text: "I really liked this book.")
Comment.create(text: "This book was fast paced and full of action!")
Comment.create(text: 'This book was a quick read.')
Comment.create(text: "This book was disappointing.")
Comment.create(text: 'The characters really came alive!')
Comment.create(text: "Wow, so dull!")
Comment.create(text: "I can't wait to read more!")

end

puts "database seeded"

puts "Seeding complete"