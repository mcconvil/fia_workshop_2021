

## ---- eval = FALSE----------------------------------------------------------
## install.packages("mase")


## ---- message = FALSE, warning = FALSE--------------------------------------
library(tidyverse)
library(mase)
dat <- readRDS(url("https://mcconvil.github.io/fia_workshop_2021/data/IDdata.rds","rb"))
glimpse(dat$pltassgn)


## ---------------------------------------------------------------------------
samp <- filter(dat$pltassgn, COUNTYFIPS == 16055) 
dim(samp)
pop <- filter(dat$dunitzonal, COUNTYFIPS == 16055) 
pop


## ---- echo = FALSE, out.width='90%'-----------------------------------------
library(gridExtra)
p1 <- ggplot(data = samp, 
       mapping = aes(x = elev, 
                     y = BA_TPA_ADJ, 
                     color = factor(tnt))) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  theme(legend.position = "bottom")
p2 <- ggplot(data = samp, 
       mapping = aes(x = elev, 
                     y = COUNT_TPA_ADJ, 
                     color = factor(tnt))) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  theme(legend.position = "bottom")
grid.arrange(p1, p2, ncol = 2)


## ---- echo = FALSE, out.width='90%'-----------------------------------------
library(gridExtra)
p1 <- ggplot(data = samp, 
       mapping = aes(x = tcc, 
                     y = BA_TPA_ADJ, 
                     color = factor(tnt))) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  theme(legend.position = "bottom")
p2 <- ggplot(data = samp, 
       mapping = aes(x = tcc, 
                     y = COUNT_TPA_ADJ, 
                     color = factor(tnt))) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  theme(legend.position = "bottom")
grid.arrange(p1, p2, ncol = 2)


## ---- echo = FALSE, out.width='90%'-----------------------------------------
p1 <- ggplot(data = samp, 
       mapping = aes(x = factor(tnt), 
                     y = BA_TPA_ADJ,
                     fill = factor(tnt))) +
  geom_boxplot() +
  guides(fill = "none")

p2 <- ggplot(data = samp, 
       mapping = aes(x = factor(tnt), 
                     y = COUNT_TPA_ADJ,
                     fill = factor(tnt))) +
  geom_boxplot() +
  guides(fill = "none")
grid.arrange(p1, p2, ncol = 2)



## ---------------------------------------------------------------------------
library(mase)

horvitzThompson(y = samp$BA_TPA_ADJ, N = pop$npixels,
                var_est = TRUE)


## ---------------------------------------------------------------------------
xpop <- filter(dat$stratalut, COUNTYFIPS == 16055) %>%
  select(tnt, Prop)
xpop


## ---------------------------------------------------------------------------
postStrat(y = samp$BA_TPA_ADJ, N = pop$npixels,
          xsample = samp$tnt, xpop = xpop,
          datatype = "means",
          var_est = TRUE,
          var_method = "SRSunconditional")


## ---------------------------------------------------------------------------
xsample <- select(samp, tcc, elev, ppt, tmean, tmin01) %>%
  as.data.frame()

xpop <- select(pop, names(xsample))

greg(y = samp$BA_TPA_ADJ, N = pop$npixels,
     xsample = xsample, xpop = xpop,
     var_est = TRUE, datatype = "means")


## ---------------------------------------------------------------------------
gregElasticNet(y = samp$BA_TPA_ADJ, N = pop$npixels,
     xsample = xsample, xpop = xpop,
     var_est = FALSE, datatype = "means", alpha = 0.5)


## ---- eval = FALSE----------------------------------------------------------
## greg(y = samp$BA_TPA_ADJ, N = pop$npixels,
##      xsample = xsample, xpop = xpop,
##      var_est = FALSE, datatype = "means",
##      model = "logistic")


## ---- eval = FALSE----------------------------------------------------------
## greg(y = samp$BA_TPA_ADJ, N = pop$npixels,
##      xsample = xsample, xpop = xpop,
##      var_est = FALSE, datatype = "means",
##      model = "logistic", pi = samp$INCLUSION_PROBS)

