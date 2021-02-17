#!/usr/bin/env Rscript

library(ggplot2)
library(readr)
library(gridExtra)
library(grid)
library(plyr)

iris=read.csv('./iris.csv')

iris[sample(nrow(iris),10),]
