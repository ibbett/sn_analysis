# GENERALISED LINEAR MIXED EFFECTS MODELS

#Where:
# fm          fitted model
# ~ 0         don't fit an intercept (only wise for very basic level of analysis)
# ~ 1         do fit an intercept
# +           add in an effect
# (1|  )      add in a random effect
# *           add in an interaction between 2 variables
# glm         basic general linear model, used to test for association between x & co-variates
# plogis()    function used to transform coefficient estimate from the logit link scale 
#             to a detection probability scale (0-1)
# glmer       to fit a generalised linear mixed-effects model 
# family = "binomial"   specifies the type of distribution to use    
# confints    confident intervals for result

#Basic GLM to determine overall detection rate
fm0 <- glm(det ~ 1, data = sn, family = "binomial")
summary(fm0)
#Convert co-efficient estimate from logit scale to probability scale using plogis()
plogis(-1.4)

#Basic GLM, using team searching for snare as intercept
fm1 <- glm(det ~ 1 + tm.det, data = sn, family = "binomial")
summary(fm1)
# Results show logit estimate for intercept (tm1), plus estimates for 
# other tms in relation to intercept (tm1)
# Std. error est important to consider as show distribution of data around mean
# Significant levels unhelpful, suggest no significant different from zero
# Can switch off intercept comparison, to just provide estimates of detectability for each tm
fm1 <- glm(det ~ 0 + tm.det, data = sn, family = "binomial")

# Fitting a Generalised Linear Mixed-Effects Model
# in this example looking at detections, with team that searched for sn as random effect
fm2 <- glmer(det ~ 1 + (1|tm.det), data = sn, family = "binomial")


sn$tm <- factor(sn$tm)
fm3 <- glmer(det ~ 0 + (1 | tm.det) + (1 | tr) + (1 | tr:sq) + (1| tm), data = sn, family = "binomial")

fm4 <- glmer(det ~ 0 + tm + (1 | tm.det) + (1 | tr) + (1 | tr:sq), data = sn, family = "binomial")

fm5 <- glmer(det ~ 0 + factor(eff) + (1 | tm.det) + (1 | tr), data = sn, family = "binomial")


