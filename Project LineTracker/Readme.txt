//Group 07 Line Tracking Project
//MSE210 Spring22'
//Kerem, Romano, and Travis

//Our robot can track lines and trap boxes to deliver them to a destination.

//All 4 requirements were completed in Virtual World + its Physical Twin.

//Requirement 5 was met using first the reflected light sensor, which detects if the line is to the right and if not assumes the line is to the left. It then uses linetracking algorithm until it is near the box, which it then traps. Then using the RGB values, line tracks until it is at one of the ending points and claims victory.

//The virtual world is much more exact when dealing with variables such as colours, reflective light, wheel turning distance, and etc. The physical world is not a perfect environment and required more testing and revisions to accomplish tasks. 

//Comments for future developers: reset your rgb values in your while loops, they don't reset unless you call the function to get them... Also it is very difficult to use rgb because light is not very constant in the physical world.