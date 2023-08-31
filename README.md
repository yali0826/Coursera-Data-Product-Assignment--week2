---
title: "Developing-Data-Product-Assignment-week2"
author: "Yangyang.liu" 
date: "8/29/2023"
output: html_document
---
# August 31, 2023
# Description 
Create a web page using R Markdown that features a map created with leaflet. 
The web page features about DHL Freight Forwarding location in IAD and JFK.


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
library(leaflet)
```

## Including Plots

You can also embed plots, for example:

```{r, echo=FALSE}
library(leaflet)
my_map <- leaflet() %>% addTiles()
my_map <- my_map %>% addMarkers(lat=39.010632, lng=-77.398376, 
             popup="DGF Hub IAD play here")
my_map <- my_map %>% addMarkers(lat=40.735010, lng=-74.173090, 
             popup="DGF Hub JFK play here")
my_map
```
Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
