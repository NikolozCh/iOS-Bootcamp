import Foundation

struct HTTPResponse {
    let message: String
    let code: Int
    func toString() -> String {
        return "Message: \(message), Code: \(code)"
    }
}

let returnData: [HTTPResponse] = [
    HTTPResponse(message: "Hi bro", code: 200),
    HTTPResponse(message: "Hi bro", code: 200),
    HTTPResponse(message: "Hi bro", code: 200),
    HTTPResponse(message: "Hi bro", code: 200),
    HTTPResponse(message: "Hi bro", code: 301),
    HTTPResponse(message: "Hi bro", code: 403)
]

returnData.sorted(by: { left, right in
    left.code > right.code
}).forEach({ resp in
    print(resp.toString())
})
