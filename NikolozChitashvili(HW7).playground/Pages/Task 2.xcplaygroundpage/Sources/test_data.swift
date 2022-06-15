
// BlogBot tests
let blogPosts0 = [
    BlogPost(categories: [.art, .math], rating: 3),
    BlogPost(categories: [.chess, .earth, .music], rating: 6),
    BlogPost(categories: [.chess, .earth, .music], rating: 4),
    BlogPost(categories: [.chess, .earth, .music], rating: 2)
]
let dummyBlogger0 = Blogger(posts: blogPosts0)

let blogPosts1 = [
    BlogPost(categories: [.art, .math], rating: 4),
    BlogPost(categories: [.chess, .earth, .music], rating: 2),
    BlogPost(categories: [.chess, .earth, .music], rating: 4),
    BlogPost(categories: [.chess, .earth, .music, .art, .art, .art, .art, .art, .art], rating: 5)
]
let dummyBlogger1 = Blogger(posts: blogPosts1)
//print(dummyBlogger1.averagePostRating)

let bloggersArray = [dummyBlogger0, dummyBlogger1]

let blogBot = BlogBot(bloggers: bloggersArray)

print(blogBot.bloggersCount)
print(blogBot.averageOfAllPosts)
print(blogBot.mostPopularBlogCategory)
print(blogBot.mostPopularBlogPost?.toString)
print(blogBot.mostPopularBlogger?.posts)


// Blogger tests
let blogPosts = [
    BlogPost(categories: [.art, .math], rating: 3),
    BlogPost(categories: [.chess, .earth, .music], rating: 6),
    BlogPost(categories: [.chess, .earth, .music], rating: 4),
    BlogPost(categories: [.chess, .earth, .music], rating: 5)
]
let dummyBlogger = Blogger(posts: blogPosts)

print("Average blog post rating:", dummyBlogger.averagePostRating)

if let popularPost = dummyBlogger.mostPopularPost {
    print("Your most popular blog post is: \(popularPost.toString)")
}
else {
    print("You don't have popular post. Maybe you haven't written anything yet? : }")
}
