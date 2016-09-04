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

### Numeric target

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

Example for ANOVA:

We can say with 95% confidence that airbags have an impact on the price. Cars with no airbags cost lesser. 
![GitHub Logo](/images/ANova_Airbag.png)

We can say with 95% confidence that transmission type has an impact on the price. Cars with no manual transmission cost lesser. 
![GitHub Logo](/images/Anova_Manrans.png)

We can NOT say with 95% confidence that country of origin has any impact on the price. 
![GitHub Logo](/images/ANova_Origin.png)


### Categorical target

We can run similar analysis on categorical target. In this example, I am running the analysis on Origin:

```R
AllSigTest(Cars93,"Origin")
```

Apart from ANOVA, the package will also perform chi-squart test for categorical variables:

Example:

We can say with 95% confidence that transmission type is not idenpendent of the Origin. Non-USA countries produce higher number of cars with manual transmission. 
![GitHub Logo](/images/Chi-sq_ManTrans.png)

We can say with 95% confidence that car type is not idenpendent of the Origin. USA produces higher number of large cars and non-USA countries produce higher number of smaller cars. 
![GitHub Logo](/images/Chi-sq_Type.png)

We can NOT say with 95% confidence that airbag is not idenpendent of the Origin. 

![GitHub Logo](/images/CHi-sq_Airba.png)







