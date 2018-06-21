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
install.packages("wesanderson") # color palette

library('tidyverse')
library('FactoMineR')
library('factoextra')
library('ggrepel') # for point labeling
library('gridExtra')
library('wesanderson')

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


#+
  annotate("text",
           itb.points$X2015cs,
           itb.points$X2015snip,
           label="ITB",
           hjust=-0.1, vjust=1)
