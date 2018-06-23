# analysis Indonesian journal

## loading data: for Indonesian data only

df = read.csv('prep_data/prep-data-citescore-ID-Apr-2018.csv')
head(df)
str(df)
row.names(df) <- df$source_short_title

## installing and loading libraries
install.packages('tidyverse')
install.packages('FactoMineR')
install.packages('factoextra')

library('tidyverse')
library('FactoMineR')
library('factoextra')
library('ggrepel') # for point labeling
library('gridExtra')

## basic stats

### histogram 2017 cs, sjr, snip
p1 = ggplot(df, aes(x=X2017cs)) +
  geom_histogram() +
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1))
p1 = p1 + expand_limits(x=c(0,100))

p2 = ggplot(df, aes(x=X2017sjr)) +
  geom_histogram() +
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1))
p2 = p2 + expand_limits(x=c(0,100))

p3 = ggplot(df, aes(x=X2017snip)) +
  geom_histogram() +
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1))
p3 = p3 + expand_limits(x=c(0,100))

grid.arrange(p1, p2, p3, ncol=1)

### boxplot 2015-2017 cs
 
p1 = ggplot(df, aes(x=pub_group_short, y=X2017cs)) +
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 1.5)

p2 = ggplot(df, aes(x=pub_group_short, y=X2016cs)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 1.5)

p3 = ggplot(df, aes(x=pub_group_short, y=X2015cs)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 1.5)

grid.arrange(p1, p2, p3, ncol=1)

### boxplot 2015-2017 sjr

p1 = ggplot(df, aes(x=pub_group_short, y=X2017sjr)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 0.5)
p1

p2 = ggplot(df, aes(x=pub_group_short, y=X2016sjr)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 0.5)
p2

p3 = ggplot(df2, aes(x=pub_group_short, y=X2015sjr)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 0.5)
p3

grid.arrange(p1, p2, p3, ncol=1)

### boxplot 2015-2017 snip

p1 = ggplot(df, aes(x=pub_group_short, y=X2017snip)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 2)

p2 = ggplot(df, aes(x=pub_group_short, y=X2016snip)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 2)

p3 = ggplot(df, aes(x=pub_group_short, y=X2015snip)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 2)

grid.arrange(p1, p2, p3, ncol=1)

## add new plot here ###

## loading data: for complete data

df2 = read.csv('prep_data/cite_score_2017.csv', sep = '\t')
head(df2)
str(df)
row.names(df2) <- df2$source_id

## plot all data citescore 2017
p1 = ggplot(df2, aes(x=source_title, y=X2017cs)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 2)
p1

p2 = ggplot(df, aes(x=pub_group_short, y=X2016snip)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 2)

p3 = ggplot(df, aes(x=pub_group_short, y=X2015snip)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45, size=8, hjust=1)) + ylim(0, 2)

grid.arrange(p1, p2, p3, ncol=1)


## correlations

### cs, sjr, snip 2017

itb.points = filter(df, pub_group_short == 'ITB') 

p1 = ggplot(data = df, aes(x=X2017cs, y=X2017sjr, color = pub_group_short)) + 
  geom_point() + xlim(0, 2) + ylim(0, 2) + theme(legend.position = 'none') + 
  annotate("text",
           itb.points$X2017cs,
           itb.points$X2017sjr,
           label="ITB",
           hjust=-0.1, vjust=1)

p2 = ggplot(data = df, aes(x=X2017cs, y=X2017snip, color = pub_group_short)) + 
  geom_point() + xlim(0, 2) + ylim(0, 2)+ theme(legend.position = 'none') +
  annotate("text",
           itb.points$X2017cs,
           itb.points$X2017snip,
           label="ITB",
           hjust=-0.1, vjust=1)

grid.arrange(p1, p2, ncol=2)

### cs, sjr, snip 2016

p1 = ggplot(data = df, aes(x=X2016cs, y=X2016sjr, color = pub_group_short)) + 
  geom_point() + xlim(0, 2) + ylim(0, 2) + theme(legend.position = 'none') + 
  annotate("text",
           itb.points$X2016cs,
           itb.points$X2016sjr,
           label="ITB",
           hjust=-0.1, vjust=1)

p2 = ggplot(data = df, aes(x=X2016cs, y=X2016snip, color = pub_group_short)) + 
  geom_point() + xlim(0, 2) + ylim(0, 2)+ theme(legend.position = 'none') +
  annotate("text",
           itb.points$X2016cs,
           itb.points$X2016snip,
           label="ITB",
           hjust=-0.1, vjust=1)

grid.arrange(p1, p2, ncol=2)

### cs, sjr, snip 2015

itb.points = filter(df, pub_group_short == 'ITB') 

p1 = ggplot(data = df, aes(x=X2015cs, y=X2015sjr, color = pub_group_short)) + 
  geom_point() + xlim(0, 2) + ylim(0, 2) + theme(legend.position = 'none') + 
  annotate("text",
           itb.points$X2015cs,
           itb.points$X2015sjr,
           label="ITB",
           hjust=-0.1, vjust=1)

p2 = ggplot(data = df, aes(x=X2015cs, y=X2015snip, color = pub_group_short)) + 
  geom_point() + xlim(0, 2) + ylim(0, 2)+ theme(legend.position = 'none') +
  annotate("text",
           itb.points$X2015cs,
           itb.points$X2015snip,
           label="ITB",
           hjust=-0.1, vjust=1)

grid.arrange(p1, p2, ncol=2)

# analysis all data

df2 = read.csv('prep_data/cite_score_2017.csv')
head(df2)
str(df2)
row.names(df) <- df$source_short_title

### cs, sjr, snip 2015

p1 = ggplot(data = df2, aes(x=X2015cs, y=X2015sjr)) + 
  geom_point(color='dark grey') + 
  xlim(0, 150) + ylim(0, 100) + 
  theme_light() +
  geom_smooth(method = lm) +
  stat_ellipse(type = "norm")
p1

p2 = ggplot(data = df2, aes(x=X2015cs, y=X2015snip)) + 
  geom_point(color='dark grey') + 
  xlim(0, 150) + ylim(0, 100) + 
  theme_light() +
  geom_smooth(method = lm) +
  stat_ellipse(type = "norm")
p2
grid.arrange(p1, p2, ncol=2)

p1 = ggplot(data = df2, aes(x=X2015cs, y=X2015sjr)) + 
  geom_point(color='dark grey') +  
  xlim(0, 20) + ylim(0, 20) + 
  theme_light() +
  geom_smooth(method = lm) 
p1
p2 = ggplot(data = df2, aes(x=X2015cs, y=X2015snip)) + 
  geom_point(color='dark grey') + 
  xlim(0, 20) + ylim(0, 20) + 
  theme_light() +
  geom_smooth(method = lm)
p2
grid.arrange(p1,p2,ncol=2)

### cs, sjr, snip 2016

p1 = ggplot(data = df2, aes(x=X2016cs, y=X2016sjr)) + 
  geom_point(color='dark grey') + 
  xlim(0, 150) + ylim(0, 100) + 
  theme_light() +
  geom_smooth(method = lm) +
  stat_ellipse(type = "norm")
p1

p2 = ggplot(data = df2, aes(x=X2016cs, y=X2016snip)) + 
  geom_point(color='dark grey') + 
  xlim(0, 150) + ylim(0, 100) + 
  theme_light() +
  geom_smooth(method = lm) +
  stat_ellipse(type = "norm")
p2
grid.arrange(p1, p2, ncol=2)

p1 = ggplot(data = df2, aes(x=X2016cs, y=X2016sjr)) + 
  geom_point(color='dark grey') +  
  xlim(0, 20) + ylim(0, 20) + 
  theme_light() +
  geom_smooth(method = lm) 
p1
p2 = ggplot(data = df2, aes(x=X2016cs, y=X2016snip)) + 
  geom_point(color='dark grey') + 
  xlim(0, 20) + ylim(0, 20) + 
  theme_light() +
  geom_smooth(method = lm)
p2
grid.arrange(p1,p2,ncol=2)


### cs, sjr, snip 2017

p1 = ggplot(data = df2, aes(x=X2017cs, y=X2017sjr)) + 
  geom_point(color='dark grey') + 
  xlim(0, 150) + ylim(0, 100) + 
  theme_light() +
  geom_smooth(method = lm) +
  stat_ellipse(type = "norm")
p1
p2 = ggplot(data = df2, aes(x=X2017cs, y=X2017snip)) + 
  geom_point(color='dark grey') + 
  xlim(0, 150) + ylim(0, 100) + 
  theme_light() +
  geom_smooth(method = lm) +
  stat_ellipse(type = "norm")
p2
grid.arrange(p1, p2, ncol=2)

p1 = ggplot(data = df2, aes(x=X2017cs, y=X2017sjr)) + 
  geom_point(color='dark grey') + 
  xlim(0, 20) + ylim(0, 20) + 
  theme_light() +
  geom_smooth(method = lm) 
p1
p2 = ggplot(data = df2, aes(x=X2017cs, y=X2017snip)) + 
  geom_point(color='dark grey') + 
  xlim(0, 20) + ylim(0, 20) + 
  theme_light() +
  geom_smooth(method = lm)
p2
grid.arrange(p1,p2,ncol=2)

### correlation analysis

# installing corrplot
install.packages('corrplot') # for making pretty pairs plot
library('corrplot')
library('RColorBrewer') # color library

# making new dataframe for correl analysis
c = select(df2, X2015cs:X2017snip) 
cc = cor(c, use = "pairwise.complete.obs") # using pairwise because there're many NAs
corrplot(cc, type="upper", order="hclust",
         col=brewer.pal(n=8, name="RdYlBu"))


# JOURNAL ANALYSIS
## loading data
jmfs = read.csv('prep_data/itb-jmfs.csv')
tel =  read.csv('prep_data/telkomnika.csv')
ternak =  read.csv('prep_data/j-peternakan.csv')
muslim =  read.csv('prep_data/ij-muslimsoc.csv')
ijog =  read.csv('prep_data/ijog.csv')
ijaseit =  read.csv('prep_data/ijaseit.csv')
ijg =  read.csv('prep_data/ijg.csv')
medica =  read.csv('prep_data/j-actamedica.csv')
agriv =  read.csv('prep_data/j-agrivita.csv')
hayati =  read.csv('prep_data/j-hayati.csv')

x <- summary(var)


a = summary(jmfs$Year)
a = data.frame(a=matrix(a),row.names=names(a))
a
b = summary(tel$Year)
b = data.frame(b=matrix(b),row.names=names(b))
b
c = summary(ternak$Year)
c = data.frame(c=matrix(c),row.names=names(c))
c
d = summary(muslim$Year)
d = data.frame(d=matrix(d),row.names=names(d))
d
e = summary(ijog$Year)
e = data.frame(e=matrix(e),row.names=names(e))
e
f = summary(ijaseit$Year)
f = data.frame(f=matrix(f),row.names=names(f))
f
g = summary(ijg$Year)
g = data.frame(g=matrix(g),row.names=names(g))
g
h = summary(medica$Year)
h = data.frame(h=matrix(h),row.names=names(h))
h
i = summary(agriv$Year)
i = data.frame(i=matrix(i),row.names=names(i))
i
j = summary(hayati$Year)
j = data.frame(j=matrix(j),row.names=names(j))
j

art_summary = data.frame(a,b,c,d,e,f,g,h,i,j)
write.csv(art_summary, file = "prep_data/art_summary.csv")

## plotting article distribution
p1 = ggplot(jmfs, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="ITB JMFS+ITB JoS") +
  xlim(2005, 2018) +
  ylim(0, 350) 
p1  
p2 = ggplot(tel, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="Telkomnika") +
  xlim(2005, 2018) +
  ylim(0, 350)
p2
p3 = ggplot(ternak, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="Media Peternakan") +
  xlim(2005, 2018) +
  ylim(0, 350)
p3
p4 = ggplot(muslim, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="IMS") +
  xlim(2005, 2018) +
  ylim(0, 350)
p4
p5 = ggplot(ijog, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="IJOG") +
  xlim(2005, 2018) +
  ylim(0, 350)
p5
p6 = ggplot(ijaseit, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="IJASEIT")+
  xlim(2005, 2018) +
  ylim(0,350)
p6
p7 = ggplot(ijg, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="IJG") +
  xlim(2005, 2018) +
  ylim(0, 350)
p7
p8 = ggplot(medica, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="AMI") +
  xlim(2005, 2018) +
  ylim(0, 350)
p8
p9 = ggplot(agriv, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="Agrivita") +
  xlim(2005, 2018) +
  ylim(0, 350)
p9
p10 = ggplot(hayati, aes(x=Year)) +
  geom_bar(position=position_dodge(0.9))+
  theme_light() +
  labs(title="Hayati") +
  xlim(2005, 2018) +
  ylim(0, 350)
p10
grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10, ncol=5)

dev.off()

## plotting citation distribution

p1 = ggplot(jmfs, aes(x=Cited.by)) +
  geom_histogram() +
  theme_light() +
  labs(title="ITB JMFS+ITB JoS") +
  ylim(0,250) +
  xlim(0,50)
p1
p2 = ggplot(tel, aes(x=Cited.by)) +
  geom_histogram() +
  theme_light() +
  labs(title="Telkomnika") +
  ylim(0,250) +
  xlim(0,50)
p2
p3 = ggplot(ternak, aes(x=Cited.by)) +
  geom_histogram() +
  theme_light() +
  labs(title="Media Peternakan") +
  ylim(0,250) +
  xlim(0,50)
p3
# NA p4 = ggplot(muslim, aes(x=Cited.by)) +
  geom_histogram(stat='count') +
  theme_light() +
  labs(title="IMS") +
  ylim(0,250) +
  xlim(0,50)
p5 = ggplot(ijog, aes(x=Cited.by)) +
  geom_histogram(stat='count') +
  theme_light() +
  labs(title="IJOG") +
  ylim(0,250) +
  xlim(0,50)
p5
p6 = ggplot(ijaseit, aes(x=Cited.by)) +
  geom_histogram() +
  theme_light() +
  labs(title="IJASEIT") +
  ylim(0,250) +
  xlim(0,50)
p6
p7 = ggplot(ijg, aes(x=Cited.by)) +
  geom_histogram() +
  theme_light() +
  labs(title="IJG") +
  ylim(0,250) +
  xlim(0,50)
p7
p8 = ggplot(medica, aes(x=Cited.by)) +
  geom_histogram() +
  theme_light() +
  labs(title="AMI") +
  ylim(0,250) +
  xlim(0,50)
p8
p9 = ggplot(agriv, aes(x=Cited.by)) +
  geom_histogram() +
  theme_light() +
  labs(title="Agrivita") +
  ylim(0,250) +
  xlim(0,50)
p9
p10 = ggplot(hayati, aes(x=Cited.by)) +
  geom_histogram() +
  theme_light() +
  labs(title="Hayati") +
  ylim(0,250) +
  xlim(0,50)
p10
grid.arrange(p1,p2,p3,p5,p6,p7,p8,p9,p10, ncol=5)


