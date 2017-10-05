//: Playground - noun: a place where people can play

import UIKit

var str = "Welcome to Ashley's Insta Filter processor!"

/* Create a simple filter
   - Indicate the last pixel point with a red dot
*/
let image = UIImage(named: "sample.png")!
var myRGBA = RGBAImage(image: image)!
var myRGBA02 = RGBAImage(image: image)!
var myRGBA03 = RGBAImage(image: image)!
var finalUIImage = UIImage(named: "sample.png")!

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
 - Cover each every 4th pixels in the image with red dots
 */
for y02 in 0..<myRGBA02.height where y02%04 == 0 {
    for x02 in 0..<myRGBA02.width where x02%04 == 0 {
        let index02 = y02*myRGBA02.width + x02
        var pixel02 = myRGBA02.pixels[index02]
        pixel02.red = 255
        pixel02.green = 0
        pixel02.blue = 0
        myRGBA02.pixels[index02] = pixel02
    }
}


let newImage02 = myRGBA02.toUIImage()

/* Prepare for the image filter processor
 - Take myRGBA image sample and calculate average red, gren blue color
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

/* Call createFilter! Prepare for the image filter processor
 - Take myRGBA image sample and calculate average red, gren blue color
 - someAvgRed, someAvgGreen, someAvgBlue are ready to use..(average rgba color)
 */
var someCreateFilter = createFilter(myRGBA: myRGBA)
var someAvgRed = someCreateFilter?.calculateAvgColor().avgRed
var someAvgGreen = someCreateFilter?.calculateAvgColor().avgGreen
var someAvgBlue = someCreateFilter?.calculateAvgColor().avgBlue

/* Create five image filters under fiveFilter Structure
 - Take myRGBA image sample and average red, gren blue colors as an input
 - Each image filter fuction takes arbitrary number as an input
 */
struct fiveFilter {
    var imgRGBA: RGBAImage
    var myAvgRed: Int
    var myAvgGreen: Int
    var myAvgBlue: Int
    var arbitraryNum = 0
    var totalRed = 0
    var totalGreen = 0
    var totalBlue = 0

    
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

    mutating func grayFilter(arbitraryNum: String) -> RGBAImage {
        switch arbitraryNum {
        case "average":
            for y in 0..<imgRGBA.height {
                for x in 0..<imgRGBA.width {
                    let index = y*imgRGBA.width + x
                    var pixel = imgRGBA.pixels[index]
                    let sumRGBA = Int(pixel.red) + Int(pixel.green) + Int(pixel.blue)
                    let grayRGBA = Int(sumRGBA/3)
                    pixel.red = UInt8(grayRGBA)
                    pixel.green = UInt8(grayRGBA)
                    pixel.blue = UInt8(grayRGBA)
                    imgRGBA.pixels[index] = pixel
                }
            }
            return imgRGBA
        case "lightness":
            for y in 0..<imgRGBA.height {
                for x in 0..<imgRGBA.width {
                    let index = y*imgRGBA.width + x
                    var pixel = imgRGBA.pixels[index]
                    let sumRGBA = Int(max(pixel.red, pixel.green, pixel.blue)) + Int(min(pixel.red, pixel.green, pixel.blue))
                    let grayRGBA = Int(sumRGBA/2)
                    pixel.red = UInt8(grayRGBA)
                    pixel.green = UInt8(grayRGBA)
                    pixel.blue = UInt8(grayRGBA)
                    imgRGBA.pixels[index] = pixel
                }
            }
            return imgRGBA
        case "luminosity":
            for y in 0..<imgRGBA.height {
                for x in 0..<imgRGBA.width {
                    let index = y*imgRGBA.width + x
                    var pixel = imgRGBA.pixels[index]
                    let grayR = 0.21*Float(pixel.red)
                    let grayG = 0.72*Float(pixel.green)
                    let grayB = 0.07*Float(pixel.blue)
                    let grayRGBA = grayR + grayG + grayB
                    pixel.red = UInt8(grayRGBA)
                    pixel.green = UInt8(grayRGBA)
                    pixel.blue = UInt8(grayRGBA)
                    imgRGBA.pixels[index] = pixel
                }
            }
            return imgRGBA
        default:
            return imgRGBA
        }
    }
    mutating func blurFilter(arbitraryNum: Int) -> UIImage {
        for y in 0..<imgRGBA.height {
            for x in 0..<imgRGBA.width {
                // convert UIImage to CIImage
                let inputCIImage = CIImage(image: imgRGBA.toUIImage()!)!
                
                // Create Blur CIFilter, and set the input image
                let blurFilter = CIFilter(name: "CIGaussianBlur")!
                blurFilter.setValue(inputCIImage, forKey: kCIInputImageKey)
                blurFilter.setValue(arbitraryNum, forKey: kCIInputRadiusKey)

                //let outputImage = UIImage(CIImage: inputCIImage)
                let outputImage = blurFilter.outputImage!
                let finalUIImage = UIImage(CIImage: outputImage)
            }
        }
        return finalUIImage
    }
}

/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #01 Call redFilter function with the input of arbitrary number that affects to the intensity of the red
 - Show the image with red-filtered effect
 */
var someFilter = fiveFilter(myRGBA: myRGBA, avgRed: someAvgRed!, avgGreen: someAvgGreen!, avgBlue: someAvgBlue!)
var redSomeFilter = someFilter!.redFilter(3)
let redFilterImage = redSomeFilter.toUIImage()
/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #02 Call grayFilter function with the input of arbitrary String that affects to the intensity of the grayscales
 - Show the image with "average" gray-filtered effect
 */
var graySomeFilter = someFilter!.grayFilter("average")
let grayFilterImage = graySomeFilter.toUIImage()

/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #03 Call grayFilter function with the input of arbitrary String that affects to the intensity of the grayscales
 - Show the image with "lightness" gray-filtered effect
 */
var graySomeFilter02 = someFilter!.grayFilter("lightness")
let grayFilterImage02 = graySomeFilter02.toUIImage()

/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #04 Call grayFilter function with the input of arbitrary String that affects to the intensity of the grayscales
 - Show the image with "luminosity" gray-filtered effect
 */
var graySomeFilter03 = someFilter!.grayFilter("luminosity")
let grayFilterImage03 = graySomeFilter03.toUIImage()

/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #05 Call blurFilter function with the input of arbitrary Number that affects to the intensity of the blur
 - Show the image with blur-filtered effect
 */
var blurSomeFilter = someFilter!.blurFilter(8)
let blurFilterProcess = RGBAImage(image: blurSomeFilter)!
let displayBlur = blurFilterProcess.toUIImage()!






