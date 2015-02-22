setwd("~/Documents/work/projects/code2015/")

### Download COPS dataset

# Annual Employment Projections
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/employment_emploi.csv", temp)
aeProjections <- read.csv(temp, header = FALSE)
unlink(temp)

# Annual Change of the Projected Occupational Employment
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/employment_growth_croissance_emploi.csv", temp)
aeProjectionsChange <- read.csv(temp, header = FALSE)
unlink(temp)

# Replacement Demand in the Form of Annual Retirement Estimates
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/retirements_retraites.csv", temp)
dRetirement <- read.csv(temp, header = FALSE)
unlink(temp)

# Job Openings Due to the Replacement Due to Emigration and In-Service Morality
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/other_replacement_autre_remplacement.csv", temp)
dEmigration <- read.csv(temp, header = FALSE)
unlink(temp)

# Summation of All Projected Demand Components
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/jo_pe.csv", temp)
dDemandComponents <- read.csv(temp, header = FALSE)
unlink(temp)

# Estimates of School Leavers Seeking Jobs
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/school_leavers_sortants_scolaires.csv", temp)
sSchoolLeavers <- read.csv(temp, header = FALSE)
unlink(temp)

# Annual Projections of New Immigrants Seeking Jobs
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/immigration.csv", temp)
sImmigrants <- read.csv(temp, header = FALSE)
unlink(temp)

# Other Components such as Mobility, Working Students and Labour Market re-entrants. 
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/other_seekers_autres_chercheurs.csv", temp)
sOtherComponents <- read.csv(temp, header = FALSE)
unlink(temp)

# Summation of All Projected Supply Components (school leavers, immigration and other job seekers).
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/job_seekers_chercheurs_emploi.csv", temp)
sJobSeekers <- read.csv(temp, header = FALSE)
unlink(temp)

# Summary of Cumulative Job Openings and Job Seekers Over the Projection Period (2013-2022)
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/summary_sommaire.csv", temp)
temp
sSummary <- read.csv(temp, header = FALSE, fileEncoding="latin1")
unlink(temp)

# Assessment of the Labour Market Conditions (shortage, surplus or balance) in recent years (2010-2012)
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/rlmc_crmt.csv", temp)
sAssessRLMC <- read.csv(temp, header = FALSE, fileEncoding="latin1")
unlink(temp)

# Final Assessment of Projected Labour Market Conditions (shortage, surplus or balance) (2013-2022)
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/cesp-pcee/flmc_cfmt.csv", temp)
sAssessFLMC <- read.csv(temp, header = FALSE, fileEncoding="latin1")
unlink(temp)

# COPS Occupational Groupings
temp <- tempfile()
download.file("http://www.edsc-esdc.gc.ca/ouvert-open/bca-seb/imt-lmi/NOC_occ_grouping_eng.csv", temp)
copsGroupings <- read.csv(temp, header = FALSE, fileEncoding="latin1")
unlink(temp)

# National Occupational Classification (NOC) 2011 - Levels
temp <- tempfile()
download.file("http://www23.statcan.gc.ca/imdb-bmdi/pub/gen/odp/VD_122372_L.csv", temp)
nocLevels <- read.csv(temp, header = TRUE, fileEncoding="latin1")
unlink(temp)


# National Occupational Classification (NOC) 2011 - Parent/Child Structure
temp <- tempfile()
download.file("http://www23.statcan.gc.ca/imdb-bmdi/pub/gen/odp/VD_122372_S.csv", temp)
nocParentChild <- read.csv(temp, header = TRUE, fileEncoding="latin1")
unlink(temp)

rm(temp)

save.image("./cops-raw.RData")
