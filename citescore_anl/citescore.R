d = read.csv('scopus(2).csv')
plot(d$age, d$Cited.by) 
corel <- lm(d$Cited.by~d$age)
print(summary(corel))
