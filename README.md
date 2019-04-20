---
title: 'Readme: Publication analytics project'
author: Dasapta Erwin Irawan (ITB), Juneman Abraham (ITB), Lusia Marliana Nurani (ITB), Dini
  Sofiani Permatasari (ITB)
date: "April 17, 2018"
editor_options:
  chunk_output_type: inline
---

Publication Analytics project
===

# Introduction

Trend `scopas-scopus` will not be over soon. This plot from Google Trend shows the usage of `scopus journal` and `jurnal scopus` from Indonesia since 2004. 

![Google trend scopus in Indonesia since 2004, data from 170419](fig_01_scopusid.png)

We're not blaming anyone, because the whole world is doing the same thing. 

![Google trend scopus worldwide since 2004, data from 170419](fig_02_scopusww.png)

# About this repository

This repo stores all materials for publication analytics project, funded by The Ministry of Research and Higher Education of Indonesia 2018. It is connected with the [Open Paleo](https://github.com/Meta-Paleo/OpenPaleo) project initiated by Jon Tennant. We build this repo to give more examples of reproducible research. 

# Project team and contributors

The PubAnalytics Project team:

- Dasapta Erwin Irawan [GS](https://scholar.google.com/citations?hl=en&user=Myvc78MAAAAJ&view_op=list_works&sortby=pubdate) [ORCID](https://orcid.org/0000-0002-1526-0863): ideas, methodology, R coding
- Juneman Abraham [GS](https://scholar.google.com/citations?hl=en&user=QHRk4KYAAAAJ&view_op=list_works&sortby=pubdate) [ORCID](http://orcid.org/0000-0003-0232-2735): ideas, analysis
- [Lusia Marliana Nurani](https://scholar.google.co.id/citations?user=Dhswtw8AAAAJ&hl=en&oi=ao) and [Dini Sofiani Permatasari](https://scholar.google.co.id/citations?user=zAMXg80AAAAJ&hl=en): data integrator
- [Aidinia Annisa](https://www.instagram.com/aidinasyauqi/?hl=en): raw data harvesting 

Contributors:
- Eko Didik (Undip)
- M. Tanzil Multazam (Umsida)
- Ikhwan Arief (UNP)
- etc

# Project concept

## Problem

Indonesian universities and research institutions are now trying to put their names at several known rankings. One of the criteria they promote to Indonesian researchers is H-index. Using [SINTA platform](sinta2.ristekdikti.go.id), they rank researchers based on their SINTA scores, which are calculated from Google Scholar profiles and ScopusID profiles. From each profile, the H-index is calculated to form SINTA score. That said, here we argue that to rank H-index is the best way to measure researchers' impact and rank their productivity, following these conditions: 

- high disparity of research facilities. Research facilities in western Indonesia is better than the ones in the eastern part.
- large variation of research ecosystem in different field of science. The sum of researchers in social/economic field is much larger than the ones working in physical science, eg: geology and paleontology. 
- lacking of skills to express ideas in English. English is not the 1st or 2nd language for Indonesian.

At the moment, we have designed four working packages (WP), but we may make another WP or split the existing one to smaller chunks. 

## Themes (T)

1. T 1: [Google Scholar Classic Papers](https://osf.io/2jnb9/)
2. T 2: Comparing paleo and other fields
3. T 3: Cite Score
4. T 4: Indonesian journal impact 

## Methods

### T1: Google Scholar Classic Papers

1. We used Google Scholar Classic Papers 2016 for the main dataset.
2. A new table was generated by adding two main columns: Impact Factor (IF) and 5 years IF. A manual searching were conducted to list all the IFs.
3. We made some plots to see the indication of correlation between IF value and search for the Impact Factor (IF) of each journal displayed in the classic paper list.

### T2: Comparing paleo and other fields 

### T3: Cite Score 2017

1. We used 2017 Cite Score data from Scopus as the starting point. A complete dataset was downloaded.
2. Upon the dataset, we applied the following filters, based on subject: earth and planetary science, computer science, arts and humanities, and social science
3. Then we made some plots to explore the condition of impacts.

### T4: Indonesian journal impact

1. We selected the records of Indonesian journals in the Cite Score database,
2. Explore the characteristics of their publishing system with some metric as indicator of their impact. 

### T5: Who've been writing about Indonesia? 

A quick search and overview on papers telling story about Indonesia, based on Dimensions and WOS databases. Pls proceed to the [project folder](https://github.com/dasaptaerwin/pubanalytics/tree/master/article_about_ID) or [RMD slides](https://github.com/dasaptaerwin/pubanalytics/blob/master/article_about_ID/WOS_ID.rmd), or [PDF slides](https://github.com/dasaptaerwin/pubanalytics/blob/master/article_about_ID/WOS_ID.pdf).

## Expected outcome

`added later`

# How to use this repository

## Folder structure

The folder structure in this project will be arrange as follows:

1. Root: for code and processed data
2. Raw data: for raw data
3. Refs: potential cited references and reading materials.

At the moment, root is the only structure we have. We will arrange the folder and the containing file accordingly. Although you may find traces of R, but we will use Jupyter Notebook more in the future.

## File structure

We implement a literate programming schema to this project. Therefore, we combine code, data, and description all into one file. Here we used Jupyter Notebook (*.ipnyb). The future arrangement of file names will be as follows:

1. T1_pubanalytics.ipynb for Theme 1
2. T2_pubanalytics.ipynb for Theme 2
3. T3_pubanalytics.ipynb for Theme 3
4. T4_pubanalytics.ipynb for Theme 4
5. [T5_pubanalytics folder](https://github.com/dasaptaerwin/pubanalytics/tree/master/article_about_ID)    Theme 5 Pls open the PDF file for beamer slides
