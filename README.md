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

```R
library(MARS)
```
First I will remove variables that won't contribute towards this analysis (Such as model name & manufacturer name):

``` R
Cars93$Manufacturer <- NULL
Cars93$Model  <- NULL
Cars93$Make <- NULL
```

Now, to run the package provide dataset name and the name of the variable we wish to the run the tests on:

```R
AllSigTest(Cars93,"Price")
```

The output is divided into two sections:

### Univariate Analysis

![GitHub Logo](/images/UniIntro.png)

Histograms are plottted for all numerical variables:

Example

![GitHub Logo](/images/Mpg_Hist.png)

![GitHub Logo](/images/HIst_HP.png)

Bar Plots are plotted for all charatcter/factor variables:

Example

![GitHub Logo](/images/Bar_Cyl.png)

![GitHub Logo](/images/Bar_Type.png)


