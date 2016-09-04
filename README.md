# AllSigTest
Uni-variate and Bi-variate analysis of data 


## Install

The package can be installed from github using devtools:

devtools::install_github("SyedAkbarAhmad/AllSigTest")

## Usage

The purpose of this package is to automatically run and view:

1. Univariate distribution of all variables in a dataset (Histograms & Bar Plots).
2. Tests of significance on the dataset for a particualr target variable.


## Example

For the purpose of demo I will use the Cars93 dataset from the MARS package. The Cars93 dataset describes data from 93 Cars on Sale in the USA in 1993. I am interested in finding the factors contributing towards the Price of a vehicle.

First I will remove variables that won't contribute towards this analysis (Such as model name & manufacturer name):

'''
Cars93$Manufacturer <- NULL
Cars93$Model  <- NULL
Cars93$Make <- NULL
'''
Now, to run the package provide dataset name and the name of the variable we wish to the run the tests on:

AllSigTest(Cars93,"Price")


library(MARS)



![GitHub Logo](/images/pipeline_iraq_oil_2003.jpg)

