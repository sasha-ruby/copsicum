setwd("~/Documents/work/projects/code2015/")

library(doBy)
library(data.table)
library(zoo)

# Load imported dataset

load("./cops-raw.RData")


## PROCESS NOC LEVELS

# clean up - replace HTML entities
nocLevels$VM <- gsub("&#40;", "(", nocLevels$VM)
nocLevels$VM <- gsub("&#41;", ")", nocLevels$VM)
nocLevels$VM <- gsub("&#44;", ",", nocLevels$VM)
nocLevels$VM <- gsub("&#45;", "-", nocLevels$VM)
nocLevels$VM <- gsub("&#46;", ".", nocLevels$VM)

# trim leading and trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
nocLevels$VM <- trim(nocLevels$VM)

nocLevels <- nocLevels[nocLevels$Locale_Id == 1,]
nocSkillTypes <- nocLevels[nocLevels$VD_Level == 1,]

write.csv(nocSkillTypes, file="noc_skill_types.csv", eol="\n")
nocSkillTypes <- read.csv("./noc_skill_types.csv", header = TRUE)
skillTypes <- levels(nocSkillTypes$VM)
names(skillTypes) <- skillTypes

nocMajor <- nocLevels[nocLevels$VD_Level == 2,]
nocMajor$VM <- gsub("&#44;", ",", nocMajor$VM)
write.csv(nocMajor, file="noc_major.csv", eol="\n")
nocMajor <- read.csv("./noc_major.csv", header = TRUE)


## PROCESS COPS GROUPINGS
#  convert to data.table
# copsGroupings <- data.table(copsGroupings)

setnames(copsGroupings, "V1", "NOC.Code")
setnames(copsGroupings, "V2", "Description")
setnames(copsGroupings, "V3", "NOC.List")
copsGroupings$Label <- paste(copsGroupings$NOC.Code, "-", copsGroupings$Description)

copsGroupings$SkillType <- substr(as.character(copsGroupings$NOC.Code), 2, 2)

copsGroupings$Major <- substr(as.character(copsGroupings$NOC.Code), 3, 3)
copsGroupings$Minor <- substr(as.character(copsGroupings$NOC.Code), 4, 4)
copsGroupings$Unit <- substr(as.character(copsGroupings$NOC.Code), 5, 5)

copsLabels <- levels(as.factor(copsGroupings$Label))
names(copsLabels) <- copsLabels

projNames <- c("COPS.Code", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022")

names(aeProjections) <- projNames
names(aeProjectionsChange) <- projNames
names(dDemandComponents) <- projNames
names(dEmigration) <- projNames
names(dRetirement) <- projNames
names(sImmigrants) <- projNames
names(sJobSeekers) <- projNames
names(sOtherComponents) <- projNames
names(sSchoolLeavers) <- projNames

aeProjections$SkillType <- as.factor(substr(as.character(aeProjections$COPS.Code), 2, 2))
aeProjectionsChange$SkillType <- as.factor(substr(as.character(aeProjectionsChange$COPS.Code), 2, 2))
dDemandComponents$SkillType <- as.factor(substr(as.character(dDemandComponents$COPS.Code), 2, 2))
dEmigration$SkillType <- as.factor(substr(as.character(dEmigration$COPS.Code), 2, 2))
dRetirement$SkillType <- as.factor(substr(as.character(dRetirement$COPS.Code), 2, 2))
sImmigrants$SkillType <- as.factor(substr(as.character(sImmigrants$COPS.Code), 2, 2))
sJobSeekers$SkillType <- as.factor(substr(as.character(sJobSeekers$COPS.Code), 2, 2))
sOtherComponents$SkillType <- as.factor(substr(as.character(sOtherComponents$COPS.Code), 2, 2))
sSchoolLeavers$SkillType <- as.factor(substr(as.character(sSchoolLeavers$COPS.Code), 2, 2))



# migrants <- migrants[, Vector := NULL]
# migrants <- migrants[, Coordinate := NULL]
# 
# migrants$Value <- as.numeric(as.character(migrants$Value))
# 
# # Rename columns
# setnames(migrants, "Ref_Date", "Year")
# setnames(migrants, "GEO", "Origin")
# setnames(migrants, "PRO", "Destiniation")
# migrants$Year <- as.factor(migrants$Year)
# 
# migrants$Origin <- gsub(", province of origin", "", migrants$Origin)
# migrants$Destiniation <- gsub(", province of destination", "", migrants$Destiniation)
# 
# head(migrants)
# 
# 

save.image("app/cops.RData")