# Polynomial-RANSAC

A Random Sample Consensus (RANSAC) algorithm is used for fitting line to a dataset, where regular or machine learning algorithms wouldn't work, due to the high amount of noise. The algorithm basicly works on the principle of selecting random points, setting a line across them, and checking how many points of the dataset are near to it. (For more see: en.wikipedia.org/wiki/Random_sample_consensus)

But RANSAC usually works only with simple (first-order) function fitting, because the algorithm requires evaluating the distance of each point from the function. This algorithm works with any order polynomial, with an algorithm that calculates the distances of a polynomial and an array of points.

An other flaw of the basic RANSAC algorithm that it requires treshold to separate inlier and outlier points. I changed this to an exponential weighting system, based on the distance of the points. I also issued some improvements to the points selections, as points that were inliers in a function that fitted better than any previous were weighed higher when selecting new points.

Besides the basic Ply RANSAC the project also included a RANSAC controller, that calculated the number of iterations needed based on the user estimated ration of data/noise, and ran the algorithm on a selected set of orders specified by the user.

For this to work I also created code for generating random sets of data, with set inlier and outlier numbers, against which the algorithm can be tested.

![example](http://i.imgur.com/5c5vDPC.png)

Note that files are not commented / in a working state. Mistakes may have been made.
Inlcuded files: 

data_generator.m - generates random set of points on a line with noise
polynomial_data_generator.m - generates random set of points on any order polynomial with noise
polynomial_distance.m - determines the distance of a point and a polynomial
polynomial_distance2.m - determines the squared distance of a polynomial and an array of points
polynomial_ransac.m - ransac algorithm with a set number of iterations on a given order of polynomial
polynomial_ransac_controller.m - tests multiple order ransacs with calculated iteration numbers, based on user estimated data/noise ratio
ransac.m - fits a line through a set of data using ransac algorithm
wighted_random_data.m - used in polynomial_ransac.m for weighing inlier points when selecting new sample
