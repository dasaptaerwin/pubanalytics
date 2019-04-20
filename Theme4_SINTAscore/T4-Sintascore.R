# analysis sinta data

## load basic library

#install.packages('tidyverse')
library('tidyverse')
#install.packages('corrplot')
library('corrplot')
install.packages('Hmisc')
library('Hmisc')

## load data
d = read.csv('sinta_ts/sinta_ts.csv')

## view data
head(d)

## calculating using hmisc
res = rcorr(as.matrix(d[,5:12]))

## plotting correlation matrix
corrplot(res$r, type="upper", order="hclust", 
         p.mat = res$P, sig.level = 0.01, insig = "blank")

install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
chart.Correlation(d[,5:12], histogram=TRUE, pch=19)

## calculating journal percentage 
d$sumdoc3 = (d$sumdoc2 / d$sumdoc)

## sorting based on sumdoc3
d = arrange(d, desc(sumdoc3))

p = ggplot(data=d, aes(x=reorder(name, sumdoc3), y=sumdoc3, fill=grup))+
  geom_bar(stat="identity")

p + theme(axis.text=element_text(size=6),
        axis.title=element_text(size=6))

p + coord_flip()

ggplot(data=d, aes(x=hind2, y=hind3, col=grup))+
  geom_point() + geom_smooth(method="auto", se=TRUE, fullrange=FALSE, level=0.95)

ggplot(data=d, aes(x=hind, y=hind3, col=grup))+
  geom_point() + geom_smooth(method="auto", se=TRUE, fullrange=FALSE, level=0.95)

m <- lm(hind3 ~ hind2, data = d)
summary(m)

m <- lm(hind3 ~ hind, data = d)
summary(m)

## cluster analysis
dd <- dist(scale(d[,5:12]), method = "euclidean")
hc <- hclust(dd, method = "ward.D2")
plot(hc, labels = d$name, hang = -1, cex = 0.6, ylab = "Height", xlab = "Name", col=as.factor(d$grup))

install.packages('ape')
library('ape')
plot(as.phylo(hc), type = "unrooted", cex = 0.6,
     no.margin = TRUE)
