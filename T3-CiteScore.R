# loading data

df = read.csv('prep-data-citescore-ID-Apr-2018.csv')
head(df)
str(df)
row.names(df) <- df$source_short_title

# installing and loading libraries
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

# basic stats

p1 = ggplot(df, aes(x=pub_group_short, y=X2017cs)) +
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45)) + ylim(0, 1.5)

p2 = ggplot(df, aes(x=pub_group_short, y=X2016cs)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45)) + ylim(0, 1.5)

p3 = ggplot(df, aes(x=pub_group_short, y=X2015cs)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45)) + ylim(0, 1.5)

grid.arrange(p1, p2, p3, ncol=1)

p1 = ggplot(df, aes(x=pub_group_short, y=X2017sjr)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45)) + ylim(0, 0.5)

p2 = ggplot(df, aes(x=pub_group_short, y=X2016sjr)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45)) + ylim(0, 0.5)

p3 = ggplot(df, aes(x=pub_group_short, y=X2015sjr)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45)) + ylim(0, 0.5)

grid.arrange(p1, p2, p3, ncol=1)

p1 = ggplot(df, aes(x=pub_group_short, y=X2017snip)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45)) + ylim(0, 2)

p2 = ggplot(df, aes(x=pub_group_short, y=X2016snip)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45)) + ylim(0, 2)

p3 = ggplot(df, aes(x=pub_group_short, y=X2015snip)) + 
  geom_boxplot() + 
  theme_light() +
  theme(axis.text.x = element_text(angle=45)) + ylim(0, 2)

grid.arrange(p1, p2, p3, ncol=1)

# plotting
itb.points = filter(df, pub_group_short == 'ITB') 
View(itb.points)

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

dev.off()
