setwd("~/Documents/work/projects/code2015/app/")

suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(googleVis))

# More info:
#   https://github.com/jcheng5/googleCharts
# Install:
#   devtools::install_github("jcheng5/googleCharts")
suppressPackageStartupMessages(library(googleCharts))

load("~/Documents/work/projects/code2015/app/cops.RData", envir=.GlobalEnv)

# nocSkillTypes <- unique(copsGroupings$SkillType)
# names(nocSkillTypes) <- nocSkillTypes

# skillId <- nocSkillTypes[nocSkillTypes$VM == "Business, finance and administration occupations",]
# skillCops <- copsGroupings[copsGroupings$SkillType == skillType$PV_Code,]
# skillCops$Label

# skillCopsGroupings <- copsGroupings[copsGroupings$SkillType == skillType$PV_Code,]
# skillMajors <- levels(as.factor(skillCopsGroupings$Label))
# names(skillMajors) <- skillMajors
# return(skillMajors)