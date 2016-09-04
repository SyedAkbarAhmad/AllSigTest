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

Example:

![GitHub Logo](/images/Bar_Cyl.png)

![GitHub Logo](/images/Bar_Type.png)

A correlation plot is plotted for all the numeric variables:

![GitHub Logo](/images/Cor_plot.png)

### Bivariate Analysis

![GitHub Logo](/images/BI_Intro.png)

Depending on the data type of the target variables different tests are executed. In this example, the target variabls is Price which is a numeric variable. The analysis applicable are: ANOVA & correlation:

Example for scatter plots:

Price had a strong positive correlation with the weight of the vehicle. Heavier vehicles are priced higher.
![GitHub Logo](/images/Cor_Wt.png)

Price had a strong negative correlation with the MPG of the vehicle. Cars with better fuel ecomony are cheaper.
![GitHub Logo](/images/Cor_Mpg.png)

Price had a strong positive correlation with the HP of the vehicle. Cars with higher HP are more expensive.
![GitHub Logo](/images/Cor_HP.png)







