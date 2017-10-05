//: Playground - noun: a place where people can play

import UIKit

var str = "Welcome to Ashley's Insta Filter processor!"

/* Create a simple filter
   - Indicate the last pixel point
*/
let image = UIImage(named: "sample.png")!
var myRGBA = RGBAImage(image: image)!
var myRGBA02 = RGBAImage(image: image)!
var myRGBA03 = RGBAImage(image: image)!

let x03 = 74
let y03 = 74
let x02 = 75
let y02 = 75
let x = 75
let y = 75

let index03 = y03*myRGBA03.width + x03
var pixel03 = myRGBA03.pixels[index03]

pixel03.red = 255
pixel03.green = 0
pixel03.blue = 0

myRGBA03.pixels[index03] = pixel03
let newImage = myRGBA03.toUIImage()

/* Create a simple filter
 - Cover each pixel in the image with a red dot
 */
for y02 in 0..<myRGBA02.height {
    for x02 in 0..<myRGBA02.width {
        let index02 = y02*myRGBA02.width + x02
        var pixel02 = myRGBA02.pixels[index02]
        pixel02.red = 255
        pixel02.green = 0
        pixel02.blue = 0
        myRGBA02.pixels[index02] = pixel02
    }
}


let newImage02 = myRGBA02.toUIImage()

/* Create the image processor
 - manage an arbitrary number Filter instances
 */
struct createFilter {
    var totalRed = 0
    var totalGreen = 0
    var totalBlue = 0
    let x = 75
    let y = 75
    
    var imgRGBA: RGBAImage
    
    init?(myRGBA: RGBAImage ) {
        self.imgRGBA = myRGBA
    }
    
    mutating func calculateAvgColor() -> (avgRed: Int, avgGreen: Int, avgBlue: Int)  {
    
        for y in 0..<imgRGBA.height{
            for x in 0..<imgRGBA.width {
                let index = y * imgRGBA.width + x
                let pixel = imgRGBA.pixels[index]
                totalRed += Int(pixel.red)
                totalGreen += Int(pixel.green)
                totalBlue += Int(pixel.blue)
            }
        }
        let count = imgRGBA.width * imgRGBA.height
        let avgRed = totalRed/count
        let avgGreen = totalGreen/count
        let avgBlue = totalBlue/count
        
        return (avgRed, avgGreen, avgBlue)
    }
}

var someCreateFilter = createFilter(myRGBA: myRGBA)
var someAvgRed = someCreateFilter?.calculateAvgColor().avgRed
var someAvgGreen = someCreateFilter?.calculateAvgColor().avgGreen
var someAvgBlue = someCreateFilter?.calculateAvgColor().avgBlue


struct fiveFilter {
    var imgRGBA: RGBAImage
    var myAvgRed: Int
    var myAvgGreen: Int
    var myAvgBlue: Int
    var arbitraryNum = 0
    
    init?(myRGBA: RGBAImage, avgRed: Int, avgGreen: Int, avgBlue: Int) {
      self.imgRGBA = myRGBA
      self.myAvgRed = avgRed
      self.myAvgGreen = avgGreen
      self.myAvgBlue = avgBlue
    }
    mutating func redFilter(arbitraryNum: Int) -> RGBAImage {
        for y in 0..<imgRGBA.height {
            for x in 0..<imgRGBA.width {
                let index = y*imgRGBA.width + x
                var pixel = imgRGBA.pixels[index]
                let redDiff = Int(pixel.red) - myAvgRed
                if (redDiff > 0) {
                    pixel.red = UInt8(max(0,min(255,myAvgRed + redDiff*arbitraryNum)))
                    imgRGBA.pixels[index] = pixel
                }
             }
        }
        return imgRGBA
    }
}

var someFilter = fiveFilter(myRGBA: myRGBA, avgRed: someAvgRed!, avgGreen: someAvgGreen!, avgBlue: someAvgBlue!)
var redSomeFilter = someFilter!.redFilter(5)
let redFilterImage = redSomeFilter.toUIImage()

//struct A {
//    var a = 0
//    var b = 0
//    var r = 0
//    var r2 = 0
//   
//    init (c: Int, d: Int) {
//        self.a = c
//        self.b = d
//       
//    }
//    mutating func E() -> (o: Int, o2: Int) {
//        r = a * b
//        r2 = a + b
//        return (r, r2)
//    }
//}
//var someA = A(c: 2,d: 3)
//var someO = someA.E().o
//var someO2 = someA.E().o2





