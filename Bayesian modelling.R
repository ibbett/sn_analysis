#Bayesian Modelling

bm1 <- brm(det ~ 1 + tm.det, data = sn, family = "bernoulli")
p.bm1 <- predict(bm1, newdata = data.frame(tm.det = c("tm1","tm2","tm3","tm4")))


bm4 <- brm(det ~ 0 + factor(eff) + (1 | tm.det) + (1 | tr), data = sn, 
           family = "bernoulli")