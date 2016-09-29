attach(GPA)
reg=lm(V1~V2)
anova(reg)
summary(reg)
confint(reg,level=.99)
plot(V2~V1)
#A. B1 confidence interval is 1.273902675 to 2.95419590   this shows that a person
#will be 99% confident that any GPA they observe will be in this range. 
#it does not include 0 in the confidence interval and he would be interested
#because if you got a 0 for the confidence interval of B1 then it could mean
#there is no correlation between the data
#B.  we are testing the H0: B0=B1=0 using the ANOVA table and the p value is 
#.002917 so we are rejecting H0 and going with Ha that there is some inequality in
#the data
#C. the p value from the anova table is 0.002917 which is less than .05 so we
#would reject that B0=B1=0 so there is some correlation between GPA and what
#you score on the ACT
