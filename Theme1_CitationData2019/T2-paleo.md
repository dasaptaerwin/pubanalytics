
# latar belakang
Berikut ini adalah upaya kami untuk menganalisis data sitasi.

# metode
Kami mengambil data dari Scopus, menyimpannya sebagai csv file, dan menganalisisnya menggunakan R pada platform Jupyter.


```python
# load library
library('gridExtra')
library('tidyverse')
```

    ── Attaching packages ─────────────────────────────────────── tidyverse 1.2.1 ──
    ✔ ggplot2 2.2.1     ✔ purrr   0.2.4
    ✔ tibble  1.4.2     ✔ dplyr   0.7.4
    ✔ tidyr   0.8.0     ✔ stringr 1.3.0
    ✔ readr   1.1.1     ✔ forcats 0.3.0
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::combine() masks gridExtra::combine()
    ✖ dplyr::filter()  masks stats::filter()
    ✖ dplyr::lag()     masks stats::lag()



```python
# load data
data.pp <- read.csv('prep_data/scopus_pp.csv')
data.pc <- read.csv('prep_data/scopus_pc.csv')
data.hess <- read.csv('prep_data/scopus_HESS.csv')
data.joh <- read.csv('prep_data/scopus_joh.csv')
data.sjp <- read.csv('prep_data/scopus_sjp.csv')
```


```python
# sorting data
data.pp <- arrange(data.pp, Cited.by)
data.pc <- arrange(data.pc, Cited.by)
data.hess <- arrange(data.hess, Cited.by)
data.joh <- arrange(data.joh, Cited.by)
data.sjp <- arrange(data.sjp, Cited.by)
```


```python
# plot cited by
par(mfrow=c(3,2))
plot(data.pp$Cited.by, xlim=c(0, 2000), ylim=c(0, 200))
plot(data.pc$Cited.by, xlim=c(0, 2000), ylim=c(0, 200))
plot(data.hess$Cited.by, xlim=c(0, 2000), ylim=c(0, 200))
plot(data.joh$Cited.by, xlim=c(0, 2000), ylim=c(0, 200))
plot(data.sjp$Cited.by, xlim=c(0, 2000), ylim=c(0, 200))
```


![png](output_4_0.png)



```python
# plot histogram
#dev.off()
par(mfrow=c(3,2))
hist(data.pp$Cited.by, xlim=c(0, 200), ylim=c(0, 1500))
hist(data.pc$Cited.by, xlim=c(0, 200), ylim=c(0, 1500))
hist(data.hess$Cited.by, xlim=c(0, 200), ylim=c(0, 1500))
hist(data.joh$Cited.by, xlim=c(0, 200), ylim=c(0, 1500))
hist(data.sjp$Cited.by, xlim=c(0, 200), ylim=c(0, 1500))
```


![png](output_5_0.png)



```python
# SECOND TRIAL

data.paleo <- read.csv('scopus_paleo.csv') %>% arrange(Cited.by)
data.cc <- read.csv('scopus_compsci.csv') %>% arrange(Cited.by)
data.hydro <- read.csv('scopus_hydrology.csv') %>% arrange(Cited.by)
```


```python
# plot cited by
par(mfrow=c(1,3))
plot(data.paleo$Cited.by, ylim=c(0, 80), xlim=c(0, 2000))
plot(data.cc$Cited.by, ylim=c(0, 80), xlim=c(0, 2000))
plot(data.hydro$Cited.by, ylim=c(0, 80), xlim=c(0, 2000))
```


![png](output_7_0.png)



```python
# plot histogram
par(mfrow=c(1,3))
hist(data.paleo$Cited.by, ylim=c(0, 1000), xlim=c(0, 80))
hist(data.cc$Cited.by, ylim=c(0, 1000), xlim=c(0, 80))
hist(data.hydro$Cited.by, ylim=c(0, 1000), xlim=c(0, 80))
```


![png](output_8_0.png)



```python
# plot duration vs citation
data.paleo$duration <- (2018 - data.paleo$Year)
data.cc$duration <- (2018 - data.cc$Year)
data.hydro$duration <- (2018 - data.hydro$Year)
```


```python
par(mfrow=c(1,3))
plot(data.paleo$duration, data.paleo$Cited.by, ylim=c(0, 80), xlim=c(0, 3))
plot(data.cc$duration, data.cc$Cited.by, ylim=c(0, 80), xlim=c(0, 3))
plot(data.hydro$duration, data.hydro$Cited.by, ylim=c(0, 80), xlim=c(0, 3))
```


![png](output_10_0.png)



```python
# SEARCH RESULTS

keywords = c('hydrology', 'paleontology', 'computer science', 'structural geology', 'geological engineering')
total_docs = c(66091, 15568, 139603, 19608, 594)
search_results = data.frame(keywords, total_docs)
search_results
```


<table>
<thead><tr><th scope=col>keywords</th><th scope=col>total_docs</th></tr></thead>
<tbody>
	<tr><td>hydrology             </td><td> 66091                </td></tr>
	<tr><td>paleontology          </td><td> 15568                </td></tr>
	<tr><td>computer science      </td><td>139603                </td></tr>
	<tr><td>structural geology    </td><td> 19608                </td></tr>
	<tr><td>geological engineering</td><td>   594                </td></tr>
</tbody>
</table>




```python

```

barplot(search_results$total_docs, ylim = c(0,150000))
axis(1, at=search_results$keywords)  
labels=c('hydrology', 'paleontology', 'computer science', 'structural geology', 'geological engineering')


```python

```
