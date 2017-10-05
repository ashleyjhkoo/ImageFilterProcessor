# XCode version 7.3.1
# ImageFilterProcessor
# Image filter processor examples(red, b&amp;w, blur, etc.) in Swift, XCode Playground

import UIKit

var str = "Welcome to Ashley's Insta Filter processor!"

/* Create a simple filter
   - Indicate the last pixel point with a red dot
*/

/* Create a simple filter
 - Cover each every 4th pixels in the image with red dots
 */

/* Prepare for the image filter processor
 - Take myRGBA image sample and calculate average red, gren blue color
 */

/* Call createFilter! Prepare for the image filter processor
 - Take myRGBA image sample and calculate average red, gren blue color
 - someAvgRed, someAvgGreen, someAvgBlue are ready to use..(average rgba color)
 */

/* Create five image filters under fiveFilter Structure
 - Take myRGBA image sample and average red, gren blue colors as an input
 - Each image filter fuction takes arbitrary number as an input
 */

/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #01 Call redFilter function with the input of arbitrary number that affects to the intensity of the red
 - Show the image with red-filtered effect
 */

/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #02 Call grayFilter function with the input of arbitrary String that affects to the intensity of the grayscales
 - Show the image with "average" gray-filtered effect
 */


/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #03 Call grayFilter function with the input of arbitrary String that affects to the intensity of the grayscales
 - Show the image with "lightness" gray-filtered effect
 */


/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #04 Call grayFilter function with the input of arbitrary String that affects to the intensity of the grayscales
 - Show the image with "luminosity" gray-filtered effect
 */


/* Call fiveFilter, put user input as myRGBA image sample, average rgba colors
 - Then, #05 Call blurFilter function with the input of arbitrary Number that affects to the intensity of the blur
 - Show the image with blur-filtered effect
 */

