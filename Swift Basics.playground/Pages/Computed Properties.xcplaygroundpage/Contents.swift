
class Rectangle {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.height = height
        self.width = width
    }
    
    var perimeter: Double {
        get {
            return 2*(self.height + self.width)
        }
        set {
            self.height = newValue / 6
            self.width  = newValue / 3
//            self.width = self.height * 2
        }
    }
}

let myRectangle = Rectangle(width: 10, height: 5)
print(myRectangle.perimeter)
myRectangle.perimeter = 30
print(myRectangle.width, myRectangle.height)
