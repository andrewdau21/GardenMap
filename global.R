library(shiny)
library(googlesheets4)
library(DT)
library(plotly)
library(dplyr)


y = c(4,4,4,4,4,4,4,4,4, 3,3,3,3,3,3,3,3,3,rep(2,26), rep(1,26))
x = c(1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,seq(1,26)/2.6, seq(1,26)/2.6)
id = c(seq(19,88))

df_map <- data.frame(id,x,y)
