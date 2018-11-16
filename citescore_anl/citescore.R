d = read.csv('citescore_anl/scopus_climate_allyears.csv')
plot(d$age, d$Cited.by) 
corel <- lm(d$Cited.by~d$age)
print(summary(corel))

d2 = read.csv('citescore_anl/scopus_paleontology_allyears.csv')
d2$age = 2017 - d2$Year
plot(d2$age, d2$Cited.by) 
corel <- lm(d2$Cited.by~d2$age)
print(summary(corel))

d4 = read.csv('citescore_anl/scopus_structure_allyears.csv')
d4$age = 2017 - d4$Year
plot(d4$age, d3$Cited.by) 
corel <- lm(d3$Cited.by~d3$age)
print(summary(corel))
