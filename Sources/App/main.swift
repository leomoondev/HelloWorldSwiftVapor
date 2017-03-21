import Vapor

let drop = Droplet()

drop.get("hello") { request in
    return "Hello, world!"
}

drop.get("upcase") { request in
    var str = "EMPTY"
    return str
    
}

drop.get("upcase") { request in
    guard let rating = request.query?["words"]?.string else {
        throw Abort.custom(status: .preconditionFailed, message: "Please include a word")
    }
    
    return "You requested comments with rating greater than \(rating.uppercased())"
}

drop.resource("posts", PostController())

drop.run()
