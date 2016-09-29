attach(GPA)
reg=lm(V1~V2)
new=data.frame(V2=28)
predict(reg,new,se.fit=T,interval="confidence",level=.95)
#A. the confidence interval for freshman who scored 28 is 3.061384 to 3.341033
#and this is showing that we are 95% confident a freshmans GPA after getting a 
#28 will be between these numbers
new=data.frame(V2=28)
predict(reg,new,se.fit=T,interval="prediction",level=.95)
#B.  the confidence interval for Mary Jones is 1.959355 to 4.443063 which is 
#showing that we are 95% confident that since she got a 28 on her ACT then she will
#have a freshman GPA in that range
#C.  The prediction interval is bigger and it should be because it is harder to 
#predict what will happen than it is to see an interval with actual data
