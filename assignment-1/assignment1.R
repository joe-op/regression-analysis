### Forbes 40
forbes40 <- read.csv("FORBES40.csv", header=F);

## Quantitative
## http://www.r-tutor.com/elementary-statistics/quantitative-data/frequency-distribution-quantitative-data
age <- forbes40$V5;
range(age);   # 43 to 72; go [43, 73] by 2
breaks <- seq(43, 73, by=2);
age.cut <- cut(age, breaks, right=F)
age.freq <- table(age.cut);
cbind(age.freq);
hist(age, breaks=breaks, right=F, main="Frequency Distribution of Age");

## Qualitative
## http://www.r-tutor.com/elementary-statistics/qualitative-data/frequency-distribution-qualitative-data
## http://www.r-tutor.com/elementary-statistics/qualitative-data/bar-graph
degree <- forbes40$V6;
# frequency
degree.freq <- table(degree);
cbind(degree.freq);  # frequency dist.
barplot(degree.freq); # bar graph
pie(degree.freq);     # pie chart
# relative frequency
degree.relfreq <- degree.freq/nrow(forbes40);
cbind(degree.relfreq); # rel. frequency dist.
barplot(degree.relfreq);

### Faithful
duration <- faithful$waiting;
range(duration); # 43, 96 
sqrt(length(duration)); # 16.5, use 17 classes
(96-43)/17;
breaks <- seq(43, 97, by=3);
duration.cut <- cut(duration, breaks=breaks, right=F);
duration.freq <- table(duration.cut);
cbind(duration.freq); # frequency distribution
# relative frequency
duration.relfreq <- duration.freq/nrow(faithful);
cbind(duration.relfreq); # relative frequency distribution
h <- hist(duration, freq = duration.relfreq);
h$counts <- h$counts/nrow(faithful);
plot(h);
# cumulative frequency
duration.cumfreq <- cumsum(duration.freq);
cbind(duration.cumfreq);
# stem and leaf plot
stem(duration);
# scatter plot
plot(duration);
### Rainfall
rainfall <- read.csv("rainfall.txt", header=F);
head(rainfall);
rainfall.inches <- rainfall$V2;
mean(rainfall.inches); # 29.85
median(rainfall.inches); # 26.5
quantile(rainfall.inches, c(0.25, 0.5, 0.75));  # 22.75, 26.50, 34.25
# IQR
quantile(rainfall.inches, 0.75) - quantile(rainfall.inches, 0.25); # 11.5
# range, variance, SD
range(rainfall.inches); # [1, 72]
var(rainfall.inches); # 326.5553
sd(rainfall.inches);  # 18.07084
# box plot
boxplot(rainfall.inches, horizontal=T);
