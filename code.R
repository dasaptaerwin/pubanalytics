# load library
library('gridExtra')
library('tidyverse')

# FIRST TRIAL 

# load data
data.pp <- read.csv('scopus_pp.csv')
data.pc <- read.csv('scopus_pc.csv')
data.hess <- read.csv('scopus_HESS.csv')
data.joh <- read.csv('scopus_joh.csv')
data.sjp <- read.csv('scopus_sjp.csv')

# plot cited by
plot(data.pp$Cited.by)
plot(data.pc$Cited.by)
plot(data.hess$Cited.by)
plot(data.joh$Cited.by)
plot(data.sjp$Cited.by)

# plot histogram
dev.off()
par(mfrow=c(3,2))
hist(data.pp$Cited.by, xlim=c(0, 200))
hist(data.pc$Cited.by, xlim=c(0, 200))
hist(data.hess$Cited.by, xlim=c(0, 200))
hist(data.joh$Cited.by, xlim=c(0, 200))
hist(data.sjp$Cited.by, xlim=c(0, 200))

# calculate duration vs cited by
data.pp$duration <- (2018 - data.pp$Year)
data.pc$duration <- (2018 - data.pc$Year)
data.hess$duration <- (2018 - data.hess$Year)
data.joh$duration <- (2018 - data.joh$Year)
data.sjp$duration <- (2018 - data.sjp$Year)

# plot duration vs cited by
par(mfrow=c(3,2))
plot(data.pp$duration, data.pp$Cited.by, xlim=c(0, 10))
plot(data.pc$duration, data.pc$Cited.by, xlim=c(0, 10))
plot(data.hess$duration, data.hess$Cited.by, xlim=c(0, 10))
plot(data.joh$duration, data.joh$Cited.by, xlim=c(0, 10))
plot(data.sjp$duration, data.sjp$Cited.by, xlim=c(0, 10))

# SECOND TRIAL

data.paleo <- read.csv('scopus_paleo.csv')
data.cc <- read.csv('scopus_compsci.csv')
data.hydro <- read.csv('scopus_hydrology.csv')

# plot cited by
dev.off()
par(mfrow=c(1,3))
plot(data.paleo$Cited.by, ylim=c(0, 80))
plot(data.cc$Cited.by, ylim=c(0, 80))
plot(data.hydro$Cited.by, ylim=c(0, 80))

# plot histogram
dev.off()
par(mfrow=c(1,3))
hist(data.paleo$Cited.by, ylim=c(0, 1000), xlim=c(0, 80))
hist(data.cc$Cited.by, ylim=c(0, 1000), xlim=c(0, 80))
hist(data.hydro$Cited.by, ylim=c(0, 1000), xlim=c(0, 80))

# plot duration vs citation
data.paleo$duration <- (2018 - data.paleo$Year)
data.cc$duration <- (2018 - data.cc$Year)
data.hydro$duration <- (2018 - data.hydro$Year)


dev.off()
par(mfrow=c(1,3))
plot(data.paleo$duration, data.paleo$Cited.by, ylim=c(0, 80), xlim=c(0, 3))
plot(data.cc$duration, data.cc$Cited.by, ylim=c(0, 80), xlim=c(0, 3))
plot(data.hydro$duration, data.hydro$Cited.by, ylim=c(0, 80), xlim=c(0, 3))

# SEARCH RESULTS

keywords = c('hydrology', 'paleontology', 'computer science', 'structural geology', 'geological engineering')

total_docs = c(66091, 15568, 139603, 19608, 594)

search_results = data.frame(keywords, total_docs)

dev.off()
density(search_results)
barplot(search_results$total_docs, ylim = c(0,150000))
axis(1, at=search_results$keywords)
     
     
     labels=c('hydrology', 'paleontology', 'computer science', 'structural geology', 'geological engineering'))

dev.off()
