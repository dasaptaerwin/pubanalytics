# kode ditulis oleh: Dasapta Erwin Irawan
# referensi: sthda.com

# load package

library('tidyverse')

# load data

dh = read.csv('jif_gs/jif_cite - humanities.csv')
dle = read.csv('jif_gs/jif_cite - lifesci_earthSci.csv')
dpm = read.csv('jif_gs/jif_cite - PHYSMATH.csv')
dss = read.csv('jif_gs/jif_cite - socsci.csv')

# humanities

## histogram

# kita ingin lihat distribusi sitasi berdasarkan institusi menggunakan histogram

ggplot(dh, aes(x=Cite_counts)) + 
  geom_histogram() + 
  facet_wrap(~inst)

## scatter plot
# kita ingin lihat distribusi institusi dalam korelasi antara jumlah sitasi dengan JIF 
ggplot(data=dh, aes(x=JIF, y=Cite_counts, color=inst)) +
  geom_point() + 
  facet_wrap(~inst)

# kita ingin lihat distribusi institusi dalam korelasi antara jumlah sitasi dengan JIF 
ggplot(data=dh, aes(x=JIF, y=Cite_counts, color=Pub2)) +
  geom_point() + 
  facet_wrap(~Pub2)
