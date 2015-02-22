setwd("~/Documents/work/projects/code2015//")
library(doBy)
library(data.table)
library(zoo)

# Download migrants dataset
temp <- tempfile()
download.file("http://www20.statcan.gc.ca/tables-tableaux/cansim/csv/00510019-eng.zip", temp)
migrants <- read.csv(unz(temp, "00510019-eng.csv"), header = TRUE)
unlink(temp)

# convert to data.table
migrants <- data.table(migrants)

migrants <- migrants[, Vector := NULL]
migrants <- migrants[, Coordinate := NULL]

migrants$Value <- as.numeric(as.character(migrants$Value))

# Rename columns
setnames(migrants, "Ref_Date", "Year")
setnames(migrants, "GEO", "Origin")
setnames(migrants, "PRO", "Destiniation")
migrants$Year <- as.factor(migrants$Year)

migrants$Origin <- gsub(", province of origin", "", migrants$Origin)
migrants$Destiniation <- gsub(", province of destination", "", migrants$Destiniation)

head(migrants)

