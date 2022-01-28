
Example 1: Linear regression
===================

### Description of ToothGrowth dataset

The ToothGrowth dataset loads with the datasets package.



The data are from an experiment examining how vitamin C dosage delivered in 2 different methods predicts tooth growth in guinea pigs. 

The data consist of 60 observations, representing 60 guinea pigs, and 3 variables:

* ***len***: numeric, tooth (odontoblast, actually) length
* ***supp***: factor, supplement type, 2 levels, “VC” is ascorbic acid, and “OJ” is orange juice
* ***dose***: numeric, dose (mg/day)

A quick look at ToothGrowth reveals that many guinea pigs were given the same dose of vitamin C. Three doses, 0.5, 1.0, and 2.0, were used.



```{r}
#look at ToothGrowth data
str(ToothGrowth)

```


```{r}

unique(ToothGrowth$dose)
## [1] 0.5 1.0 2.0
```


### Example 1: Exploratory analysis

Graphical exploration of the dataset provides the researcher with descriptive depictions of summaries of variables or relationship among variables.

We being our exploration of Toothgrowth by examining the distributions of supp and dose. Since both variables are discretely distributed, we want the frequencies (counts) of each value.

Frequencies are often plotted as bars, so we select geom_bar. We specify dose mapped to x and supp mapped to the fill color of the bars, which will give us counts of each dose divided by supp.

### Exploring distributions


```{r}
library(ggplot2)
#bar plot of counts of dose by supp
#data are balanced, so not so interesting
ggplot(ToothGrowth, aes(x=dose, fill=supp)) +  geom_bar()

```




![png](output_5_1.png)


Statistical models often make assumptions about the distribution of the outcome (or its residuals), so an inspection might be wise. First let’s check the overall distribution of “len” with a density plot:



```{r}
#density of len
ggplot(ToothGrowth, aes(x=len))  + geom_density()


```




![png](output_7_1.png)



We can get densities of len by supp by mapping supp to color:



```{r}
library(ggplot2)
#density of len by supp
ggplot(ToothGrowth, aes(x=len, color=supp)) + 
  geom_density()

```
---


#### Summarizing the outcome across a predictor

Because dose takes on only 3 values, many point are crowded in 3 columns, obscuring the shape of relationship between dose and len. We replace the column of points at each dose value with its mean and confidence limit using stat_summary instead of geom_point.


The outcome distributions appear a bit skewed, but the samples are small.

### Quick scatterplot of outcome and predictor

We plot the dose-tooth length (len) relationship.

---

```{r}

#not the best scatterplot
tp <- ggplot(ToothGrowth, aes(x=dose, y=len))
tp + geom_point()

```





```{r}
#mean and cl of len at each dose
tp.1 <- tp + stat_summary(fun.data="mean_cl_normal")
tp.1

```

---

An additional call to stat_summary with fun.y=mean (fun.y because mean returns one value) and changing the geom to “line” adds a line between means.


```{r}

#add a line plot of means to see dose-len relationship
#maybe not linear
tp.2 <- tp.1 + stat_summary(fun.y="mean", geom="line")
tp.2

```
---

```{r}
Does a third variable moderate the x-y relationship?

Does the dose-len relationship depend on supp? We can specify new global aesthetics in aes.

```


```{r}

#all plots in tp.2 will now be colored by supp
tp.2 + aes(color=supp)

```


---
### Interpreting the previous graph

This graph suggests:

1. The slope of the dose-response curve decreases as dose increases for both supp types, suggesting a quadratic function.
2. The slope of the OJ curve flattens more dramatically, perhaps suggesting the quadratic term is different between supplement groups
3. The initial slopes look rather similar, perhaps suggesting that the linear term may not be different between groups
4. The 2 supp group means differ at the two lower doses, but not at the highest dose

ggplot2 makes graphs summarizing the outcome easy

We just plotted means and confidence limits of len, with lines connecting the means, separated by supp, all without any manipulation to the original data!

The stat_summary function facilitates looking at patterns of means, just as regression models do.

Next we fit our linear regression model and check model assumptions with diagnostic graphs.

---

### Model preliminaries

We want to model how tooth length (len) is predicted by dose, allowing for moderation of this relationship through an interaction with supp.

We assume that dose and tooth length have a smooth, continuous relationship in the range of doses tested, so we will treat dose as a continuous (numeric) predictor. We also create a dose-squared variable, for use in the quadratic model and prediction later.



```{r}
#create dose-squared variable
ToothGrowth$dosesq <- ToothGrowth$dose^2
```

### Fitting the model

We noticed in the previous graph that the dose-len relationship appears quadratic, that the quadratic effect may differ between supp groups, but that the initial linear slope may not be so different. We fit a model to reflect our expectations:



```{r}

lm2 <- lm(len ~ dose + dosesq*supp, data=ToothGrowth)
summary(lm2)$coef
##                 Estimate Std. Error    t value     Pr(>|t|)
## (Intercept)    0.7491667  2.7983895  0.2677135 7.899213e-01
## dose          30.1550000  5.2474684  5.7465806 4.114588e-07
## dosesq        -8.7238095  2.0402571 -4.2758383 7.640686e-05
## suppVC        -6.4783333  1.3762287 -4.7073088 1.739152e-05
## dosesq:suppVC  1.5876190  0.5770719  2.7511635 8.024694e-03

```


<table>
<thead><tr><th></th><th>Estimate</th><th>Std. Error</th><th>t value</th><th>Pr(&gt;|t|)</th></tr></thead>
<tbody>
	<tr><th>(Intercept)</th><td> 0.7491667  </td><td>2.7983895   </td><td> 0.2677135  </td><td>7.899213e-01</td></tr>
	<tr><th>dose</th><td>30.1550000  </td><td>5.2474684   </td><td> 5.7465806  </td><td>4.114588e-07</td></tr>
	<tr><th>dosesq</th><td>-8.7238095  </td><td>2.0402571   </td><td>-4.2758383  </td><td>7.640686e-05</td></tr>
	<tr><th>suppVC</th><td>-6.4783333  </td><td>1.3762287   </td><td>-4.7073088  </td><td>1.739152e-05</td></tr>
	<tr><th>dosesq:suppVC</th><td> 1.5876190  </td><td>0.5770719   </td><td> 2.7511635  </td><td>8.024694e-03</td></tr>
</tbody>
</table>



The model appears to conform to our expectations.


### Example 1: Model diagnostics

Statistical inference depends on the assumptions of the regression model, which we check with diagnostic graphs. Common diagnostics for linear regression

* inspect the normality of the residuals
* verify that the residuals show no trends (assumption of linearity) and are homoscedastic,
* check for overly influential outliers.
* fortify makes linear regression diagnostics easy



Conveniently, the fortify function takes a lm model object (one among several classes) and returns a dataset with several estimated diagnostic variables including:

* .hat: leverages(influence)
* .sigma: residual standard deviation when observation dropped from model
* .cooksd: Cook’s distance
* .fitted: fitted (predicted) values
* .resid: residuals
* .stdresid: standardized residuals

We fortify our lm2 object with these diagnostic variables and take a quick look a the new variables.



```{r}


#create dataset with original data and diagnostic variables
lm2diag <- fortify(lm2)
#quick look
head(lm2diag)

```


<table>
<thead><tr><th>len</th><th>dose</th><th>dosesq</th><th>supp</th><th>.hat</th><th>.sigma</th><th>.cooksd</th><th>.fitted</th><th>.resid</th><th>.stdresid</th></tr></thead>
<tbody>
	<tr><td> 4.2        </td><td>0.5         </td><td>0.25        </td><td>VC          </td><td>0.08095238  </td><td>3.623134    </td><td>0.0165458459</td><td>7.564286    </td><td>-3.3642857  </td><td>-0.96913367 </td></tr>
	<tr><td>11.5        </td><td>0.5         </td><td>0.25        </td><td>VC          </td><td>0.08095238  </td><td>3.611516    </td><td>0.0226438547</td><td>7.564286    </td><td> 3.9357143  </td><td> 1.13374237 </td></tr>
	<tr><td> 7.3        </td><td>0.5         </td><td>0.25        </td><td>VC          </td><td>0.08095238  </td><td>3.654279    </td><td>0.0001021058</td><td>7.564286    </td><td>-0.2642857  </td><td>-0.07613152 </td></tr>
	<tr><td> 5.8        </td><td>0.5         </td><td>0.25        </td><td>VC          </td><td>0.08095238  </td><td>3.645881    </td><td>0.0045503109</td><td>7.564286    </td><td>-1.7642857  </td><td>-0.50822934 </td></tr>
	<tr><td> 6.4        </td><td>0.5         </td><td>0.25        </td><td>VC          </td><td>0.08095238  </td><td>3.650733    </td><td>0.0019816291</td><td>7.564286    </td><td>-1.1642857  </td><td>-0.33539021 </td></tr>
	<tr><td>10.0        </td><td>0.5         </td><td>0.25        </td><td>VC          </td><td>0.08095238  </td><td>3.638080    </td><td>0.0086727319</td><td>7.564286    </td><td> 2.4357143  </td><td> 0.70164455 </td></tr>
</tbody>
</table>



### Normality of residuals: q-q plot and stat_qq

* A q-q plot can assess the assumption that the residuals are normally distributed by plotting the standardized residuals (observed z-score) against theoretical quantiles of the normal distribution (expected z-score if normally distributed).

* stat_qq creates a qq-plot. The only required aesthetic is sample, which we map to the standardized residual variable created by fortify, .stdresid.

* A diagonal reference line (intercept=0, slope=1) is added to the plot with geom_abline, representing perfect fit to a normal distribution. The normal distribution will appear to be a reasonable fit below.



```{r}


#q-q plot of residuals and diagonal reference line
#geom_abline default aesthetics are yintercept=0 and slope=1
ggplot(lm2diag, aes(sample=.stdresid)) + 
  stat_qq() + 
  geom_abline()



```




![png](output_28_1.png)



```{r}
### Linearity and Homoscedasticity: residuals vs fitted

We next assess the assumptions of homoscedescasticity and linear relationships between the outcome and predictors. A residuals vs fitted (predicted value) plot assesses both of these assmuptions.

An even spread of residuals around 0 suggests homoscedasticity, and a zero, flat slope for residuals against fitted suggests linearity of predictor effects.


```


```{r}
We build our residuals vs fitted plot like so:

1. Start with a scatter plot of x=.fitted and y=.stdresid.
2. Add a plot the means and standard errors of the residuals across fitted values using stat_summary. The standard error bars somewhat address homoskedasticity.
3. Plot a line representing the mean trend of the residuals with another call to stat_summary (changing function to mean and geom to line). Normally, we would use geom_smooth to plot a loess curve to visualize the trend among residuals, but loess smooths do not work well when the variable mapped to x is discrete.
4. The error bars do not appear to vary too much and the line seems sufficiently flat to feel that neither assumption has been violated.

```


```{r}

#residual vs fitted, means and s.e.
ggplot(lm2diag, aes(x=.fitted, y=.stdresid)) + 
  geom_point() + 
  stat_summary() + 
  stat_summary(fun.y="mean", geom="line")
## No summary function supplied, defaulting to `mean_se()

```

### Identifying influential observations

Strongly influential observations can distort regression coefficients. The most influential datapoints will typically have more extreme predictor values (leverage), measured by .hat, and large residuals. The overall influence of an observation on the model is measured by Cook’s D, variable .cooksd.

The Toothgrowth dataset is fairly balanced across doses and supps (20 at each of 3 doses, 30 at each of 2 supp). Thus, no values are “extreme”, so influential observations for this model will be those with large residuals.

In the following plot:
* map .hat to x, .stdresid to y
* map .cooksd to size, making more influential points larger.
* label the points in geom_text with their row numbers for identification

The dependence of Cook’s D on both leverage and residual is apparent in the plot, with Cook’s D rising as we move away from center (larger residual) and to the right (larger leverage). No point looks too influential for concern.



```{r}

# in geom_text we SET size to 4 so that size of text is constant,
#   and not tied to .cooksd.  We also  nudge the text .001 (x-axis units)
#   to the left, and separate overlapping labels
ggplot(lm2diag, aes(x=.hat, y=.stdresid, size=.cooksd)) +     
  geom_point() +
  geom_text(aes(label=row.names(lm2diag)), 
             size=4, nudge_x=-0.003, check_overlap=T)

```




![png](output_33_1.png)



```{r}

```
