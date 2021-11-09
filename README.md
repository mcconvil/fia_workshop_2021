## A Data Science Approach to Model-Assisted Estimation
### Workshop for the US Forest Inventory and Analysis Program

Date: Monday, November 8th
Time: noon -- 4:00pm ET


FIA produces estimates of numerous forest attributes in a variety of domains, with post-stratification as the primary estimation method. As technological and statistical advances provide both new data sources and new modeling techniques, estimation procedures must adapt to accommodate these advances. Effectively combining data collected under a complex sampling design with new sources of auxiliary data has the potential to greatly increase the efficiency of our estimators. Luckily, how to best leverage these multiple data sources has been a vibrant area of recent survey research.

This workshop will introduce participants to one modern, model-assisted approach to survey estimation, where predictive models serve as the key link between the FIA plot data and auxiliary data. This method will cover a broad class of predictive models, including generalized linear models, regularized (elastic net) regression, and regression trees. The workshop will also include demonstrations of how to estimate forest attributes in the statistical software R, using the `mase` package.  


[This `R` script](https://mcconvil.github.io/fia_workshop_2021/data/mase_R.R) contains all the code used in the `mase` slide deck.


## Outline

* Motivate model-assisted estimation by providing scenarios where survey statisticians have access to both survey and auxiliary data.
* Introduce the model-assisted estimation framework.
* Consider case studies where the assisting, predictive models are linear regression, logistic regression, regularized (elastic net) regression, and regression trees.
* Explore how to fit these estimators and their variance estimators in `R`.


## Facilitators

[Kelly McConville](http://mcconville.rbind.io/) is an Associate Professor of Statistics at [Reed College](https://www.reed.edu/math/) in Portland, Oregon.  Her methodological research involves incorporating novel modeling techniques into survey estimators.  She is currently spending her sabbatical as a Visiting Research Scientist at the Rocky Mountain Research Station of FIA.  With big help from Gretchen Moisen and Tracey Frescino, she runs an undergraduate research program and has mentored 24 undergraduate students with majors ranging from Statistics to English!  In addition to her regular teaching duties, she has taught several continuing education short courses, webinars, and workshops on `R` and various data science and statistics topics.  

[Grayson White](https://graysonwhite.com/) is a Data Scientist contracting with FIA. While completing a mathematics-statistics degree at Reed College, he began working with FIA data as part of his undergraduate thesis and his findings served as the foundation for a [journal article on applying Bayesian estimators to small areas](https://www.frontiersin.org/articles/10.3389/ffgc.2021.752911/abstract). At FIA, Grayson primarily works with Tracey Frescino on the development of the `FIESTA` `R` package and on model-assisted and small area estimation research. In the near future, Grayson plans to attend graduate school in statistics and would love to continue collaborating with FIA as part of his dissertation work.

