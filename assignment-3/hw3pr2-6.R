attach(airfreight)
reg=lm(V1~V2)
confint(reg,level=.95)
#A. we are 95% confident that with an increase of changes in a shipment then there 
# will be between 2.918388 and 5.081612 more ampules broken on average
anova(reg)
#there is a correlation between the data going from the p value in the ANOVA table
#basically being 0 or exactly 2.749e-05 so we reject H0 that B1=B2=0 meaning that 
#there should be a linear correlation
#C. we are 95% sure  the average number of ampules broken when there is no transfers
#of shipments is 8.670370 to 11.729630
