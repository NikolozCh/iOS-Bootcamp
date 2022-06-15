import Foundation

// Test data for this task is in Sources folder.
// Please, check test_data.swift

@propertyWrapper struct Ratinger {
    var wrappedValue: Int {
        didSet {
            var valueToSet = wrappedValue
            if valueToSet < 0 || valueToSet > 5 { valueToSet = 0 } // Lol, you get the punishment for not giving correct rating
            self.wrappedValue = valueToSet
        }
    }
    init(wrappedValue: Int) {
        var valueToSet = wrappedValue
        if valueToSet < 0 || valueToSet > 5 { valueToSet = 0 } // Lol, you get the punishment for not giving correct rating
        self.wrappedValue = valueToSet
    }
}

enum BlogCategory: String {
    case music
    case chess
    case art
    case math
    case earth
}

struct BlogPost {
    let categories: [BlogCategory]
    @Ratinger var rating: Int
    
    // To String Computed property for the struct
    var toString: String {
        var res = ""
        res += "Categories: [ | "
        categories.forEach { category in
            res += category.rawValue + " | "
        }
        res += "], Rating: \(rating)"
        return res
    }
}

class Blogger {
    let posts: [BlogPost]
    
    var averagePostRating: Double {
        Double(posts.reduce(0) { partialResult, post in
            partialResult + post.rating
        }) / Double(posts.count)
    }
    
    var mostPopularPost: BlogPost? {
        posts.max { postOne, postTwo in
            postOne.rating < postTwo.rating
        }
    }
    
    init(posts: [BlogPost]) {
        self.posts = posts
    }
}

// =================================================================================

// ============================= Blog Bot Class ====================================
class BlogBot {
    
    let bloggers: [Blogger]
    
    // How many bloggers are there?
    var bloggersCount: Int {
        bloggers.count
    }
    
    // Who is the most popular blogger?
    var mostPopularBlogger: Blogger? {
        bloggers.max { bloggerOne, bloggerTwo in
            bloggerOne.averagePostRating < bloggerTwo.averagePostRating
        }
    }
    
    // Which is the most popular post on the blog?
    var mostPopularBlogPost: BlogPost? {
        if bloggers.count == 0 { return nil }
        /*
         Steps to solve this:
         1. Get all most popular posts from bloggers with map HoF
         2. Inside of those popular posts, search for the most-most popular with max(by:)  3: )
         */
        let mostPopularPosts = bloggers.map { blogger in
            blogger.mostPopularPost // Grabbing all most popular blogposts
        }.max { blogOne, blogTwo in
            guard
                // Guarding them not to be optionals
                let left  = blogOne,
                let right = blogTwo
            else {
                // : }
                return false
            }
            // Predicates: ratings
            return left.rating < right.rating
        }
        return mostPopularPosts ?? nil // If max HoF wasn't able to find max (array.count == 0) we return nil
    }
    
    // Average rating of all blog posts
    var averageOfAllPosts: Double {
        bloggers.reduce(0) { partialResult, blogger in
            partialResult + blogger.averagePostRating
        } / Double(bloggers.count)
    }
    
    // Most used blog category
    var mostPopularBlogCategory: BlogCategory? {
        // Dictionary to save frequency of the categories
        // Key -> BlogCategory
        // Value -> Times encountred the category
        var categoryDict = [BlogCategory: Int]()
        bloggers.forEach { blogger in
            blogger.posts.forEach { post in
                post.categories.forEach { category in
                    let alreadySeenTimes = categoryDict[category] ?? 0
                    categoryDict[category] = alreadySeenTimes + 1
                }
            }
        }
        // From frequency compare the values (actual frequencies)
        return categoryDict.max { pairLeft, pairRight in
            pairLeft.value < pairRight.value
        }?.key
    }
    
    init(bloggers: [Blogger]) {
        self.bloggers = bloggers
    }
}
