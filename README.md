# Polynomial-RANSAC

A Random Sample Consensus (RANSAC) algorithm is used for fitting line to a dataset, where regular or machine learning algorithms wouldn't work, due to the high amount of noise. The algorithm basicly works on the principle of selecting random points, setting a line across them, and checking how many points of the dataset are near to it. (For more see: en.wikipedia.org/wiki/Random_sample_consensus)

But RANSAC usually works only with simple (first-order) function fitting, because the algorithm requires evaluating the distance of each point from the function. This algorithm works with any order polynomial, with an algorithm that calculates the distances of a polynomial and an array of points.

Besides the basic Ply RANSAC the project also included a RANSAC controller, that calculated the number of iterations needed based on the user estimated ration of data/noise, and ran the algorithm on a selected set of orders specified by the user.

For this to work I also created code for generating random sets of data, with set inlier and outlier numbers, against which the algorithm can be tested.

![example](http://i.imgur.com/5c5vDPC.png)

Note that files are not commented / in a working state. Mistakes may have been made.
Inlcuded files: 
