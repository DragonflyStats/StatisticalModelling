Structural equation modeling
====================================
Structural equation modeling (SEM) is a statistical technique for testing and estimating causal relationships using a combination of statistical data and qualitative causal assumptions. This view of SEM was articulated by the geneticist Sewall Wright (1921), the economists Trygve Haavelmo (1943) and Herbert Simon (1953), and formally defined by Judea Pearl (2000) using a calculus of counterfactuals.
SEM as part of the GLM family
SEM grows out of and serves purposes similar to multiple regression, but in a more powerful way which takes into account the modeling of interactions, nonlinearities, correlated independents, measurement error, correlated error terms, multiple latent independents each measured by multiple indicators, and one or more latent dependents also each with multiple indicators. 
SEM may be used as a more powerful alternative to multiple regression, path analysis, factor analysis, time series analysis, and analysis of covariance. That is, these procedures may be seen as special cases of SEM, or, to put it another way, SEM is an extension of the general linear model (GLM) of which multiple regression is a part.
### Confirmatory modelling
Structural Equation Models (SEM) encourages confirmatory rather than exploratory modeling; thus, it is suited to theory testing rather than theory development. It usually starts with a hypothesis, represents it as a model, operationalises the constructs of interest with a measurement instrument, and tests the model. The causal assumptions embedded in the model often have falsifiable implications which can be tested against the data. With an accepted theory or otherwise confirmed model, SEM can also be used inductively by specifying the model and using data to estimate the values of free parameters. Often the initial hypothesis requires adjustment in light of model evidence, but SEM is rarely used purely for exploration.
Strictly confirmatory approach: A model is tested using SEM goodness-of-fit tests to determine if the pattern of variances and covariances in the data is consistent with a structural (path) model specified by the researcher. However as other unexamined models may fit the data as well or better, an accepted model is only a not-disconfirmed model. 
Alternative models approach: One may test two or more causal models to determine which has the best fit. There are many goodness-of-fit measures, reflecting different considerations, and usually three or four are reported by the researcher. Although desirable in principle, this AM approach runs into the real-world problem that in most specific research topic areas, the researcher does not find in the literature two well-developed alternative models to test. 
Model development approach: In practice, much SEM research combines confirmatory and exploratory purposes: a model is tested using SEM procedures, found to be deficient, and an alternative model is then tested based on changes suggested by SEM modification indexes. This is the most common approach found in the literature. The problem with the model development approach is that models confirmed in this manner are post-hoc ones which may not be stable (may not fit new data, having been created based on the uniqueness of an initial dataset). Researchers may attempt to overcome this problem by using a cross-validation strategy under which the model is developed using a calibration data sample and then confirmed using an independent validation sample. 
Indicator Variables
Indicators are observed variables, sometimes called manifest variables or reference variables, such as items in a survey instrument. Four or more is recommended and three is acceptable and common practice. However, two indicators or even a single indicator may be acceptable if the researcher is confident in the measure's validity and reliability. In fact, the prime consideration in selecting indicators is whether they are theoretically sound and reliably measured. 
Also, allowing one- and two-indicator latents to a model may allow the testing of theoretically important latent-level control relationships which otherwise might not be possible. However, with one indicator, error cannot be modeled but rather one must specify a fixed measurement error variance. Also, models using only two indicators per latent variable are more likely to be underidentified and/or fail to converge and error estimates may be unreliable. By convention, indicators should have pattern coefficients (factor loadings) of .7 or higher on their latent factors.
Latent Variables
Among its strengths is the ability to model constructs as latent variables (variables which are not measured directly, but are estimated in the model from measured variables which are assumed to 'tap into' the latent variables). This allows the modeler to explicitly capture the unreliability of measurement in the model, which in theory allows the structural relations between latent variables to be accurately estimated. Factor analysis, path analysis and regression all represent special cases of SEM.
In SEM, the qualitative causal assumptions are represented by the missing variables in each equation, as well as vanishing covariances among some error terms. These assumptions are testable in experimental studies and must be confirmed judgmentally in observational studies.

### Applications and Uses
•	Invariance 
•	Multiple group comparison: This is a technique for assessing whether certain aspects of a Structural Equation Model or Confirmatory Factor Analysis is the same across groups (e.g., gender, different cultures, test forms written in different languages, etc). 
•	Latent growth modeling 
•	Relations to other types of advanced models (hierarchical/multilevel models; item response theory models) 
•	Mixture model (latent class) SEM 
•	Alternative estimation and testing techniques 
•	Robust inference 
•	Interface with survey estimation 
•	Multi-Method Multi-Trait Models

Steps in performing SEM analysis 
o	1 Model specification 
o	2 Estimation of free parameters 
o	3 Assessment of fit 
o	4 Model modification 
o	5 Interpretation and communication 
o	6 Replication and revalidation 

### Reliability 
Cronbach's alpha is a commonly used measure testing the extent to which multiple indicators for a latent variable belong together. It varies from 0 to 1.0. A common rule of thumb is that the indicators should have a Cronbach's alpha of .7 to judge the set reliable. It is possible that a set of items will be below .7 on Cronbach's alpha, yet various fit indices (see below) in confirmatory factor analysis will be above the cutoff (usually .9) levels. Alpha may be low because of lack of homogeneity of variances among items, for instance, and it is also lower when there are fewer items in the scale/factor. See the further discussion of measures of internal consistency in the section on standard measures and scales. 
Raykov's reliability rho, also called reliability rho or composite reliability, tests if it may be assumed that a single common factor underlies a set of variables. Raykov (1998) has demonstrated that Cronbach's alpha may over- or under-estimate scale reliability. Underestimation is common. For this reason, rho is now preferred and may lead to higher estimates of true reliability. Raykov's reliability rho is not to be confused with Spearman's median rho, an ordinal alternative to Cronbach's alpha, discussed in the section on reliability.. The acceptable cutoff for rho would be the same as the researcher sets for Cronbach's alpha since both attempt to measure true reliability. . Raykov's reliability rho is ouput by EQS. See Raykov (1997), which lists EQS and LISREL code for computing composite reliability.Graham (2006) discusses Amos computation of reliability rho. 
Construct reliability and variance extracted, based on structure loadings, can also be used to assess the extent to which a latent variable is measured well by its indicators. 

Software
An alternative technique for specifying Structural Equation Models using partial least squares path modeling has been implemented in software such as LVPLS (Latent Variable Partial Least Square), PLSGraph, SmartPLS (Ringle et al. 2005) and XLSTAT (Addinsoft, 2008). Some feel this is better suited to data exploration. More ambitiously, The TETRAD project aims to develop a way to automate the search for possible causal models from data.
Lisrel
LISREL, an acronym for linear structural relations, is a statistical software package used in structural equation modeling. LISREL was developed in 1970s by Karl Jöreskog and Dag Sörbom, both professors of Uppsala University, Sweden. The most current version, as of 2008 April, is LISREL 8.8.
