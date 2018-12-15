library(tidyverse)
library(ggplot2)
library(maps)
library(mapdata)
library(qcc)
library(rsample)
library(broom)
library(Metrics)
library(purrr)
library(shinydashboard)
library(shiny)
#setwd('/Users/rabram/Desktop/NSS/data-question-5-opioids-camo-pythons')

state_count_opioids <- readRDS('./data/state_count_opioids.RDS')
ct <- readRDS('./data/ct.RDS')
reshape <- readRDS('./data/reshape.RDS')
prescriber_pareto_default <- readRDS('./data/prescriber_pareto_default.RDS')
state_info <- readRDS('./data/state_info.RDS')
ods_by_drug <- readRDS('./data/ods_by_drug.RDS')

colnames(state_info) <- c('Abbrev', 'state', "hs_grad_pct", "bach_pct",'uninsured_pct','unemployment_pct','poverty_pct')

theme_set(theme_grey(base_size = 18)) 
  