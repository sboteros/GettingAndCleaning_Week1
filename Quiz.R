# Getting and cleaning data
# Quiz - Week 1
# Santiago Botero Sierra
# sbotero@cofece.mx
# Encoding: UTF-8
# Date: 2019/06/17

setwd("d:/Users/sbotero/Comisión Federal de Competencia Económica/Varios - General/DataScienceSpecialization/3 Getting and cleaning data/Week1/GettingAndCleaning_Week1")
if (!dir.exists("./data")) {dir.create("./data")}

# 1. The American Community Survey distributes downloadable data about United 
# States communities. Download the 2006 microdata survey about housing for the 
# state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# and load the data into R. The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# How many properties are worth $1,000,000 or more?

  UrlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(UrlFile, "./data/IdahoHousing2016.csv")
  IdahoHousing <- read.table("./data/IdahoHousing2016.csv",
                             header = TRUE, sep = ",")
  sum(IdahoHousing[IdahoHousing$VAL == 20 & !is.na(IdahoHousing$VAL), "WGTP"])
  nrow(IdahoHousing[IdahoHousing$VAL == 20 & !is.na(IdahoHousing$VAL), ])
  nrow(IdahoHousing[IdahoHousing$VAL == 20, ])  

# 2. Use the data you loaded from Question 1. Consider the variable FES in the
# code book. Which of the "tidy data" principles does this variable violate?
  
  ## Tidy data has one variable per column.
  
# 3.Download the Excel spreadsheet on Natural Gas Aquisition Program here:
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
#  Read rows 18-23 and columns 7-15 into R and assign the result to a variable
#  called:
  library(xlsx)
  UrlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  download.file(UrlFile, "./data/Gas.xlsx")
  dat <- read.xlsx("./data/Gas.xlsx", 1, rowIndex = 18:23, colIndex = 7:15)
  
  # What is the value of:
  sum(dat$Zip*dat$Ext,na.rm=T)
  
# 4. Read the XML data on Baltimore restaurants from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# How many restaurants have zipcode 21231?

# 5. The American Community Survey distributes downloadable data about United
# States communities. Download the 2006 microdata survey about housing for the
# state of Idaho using download.file() from here:
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
#  using the fread() command load the data into an R object
  
  DT

# The following are ways to calculate the average value of the variable
# `pwgtp15` broken down by sex. Using the data.table package, which will deliver
# the fastest user time?
  rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
  
  DT[,mean(pwgtp15),by=SEX]
  
  sapply(split(DT$pwgtp15,DT$SEX),mean)
  
  mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
  
  mean(DT$pwgtp15,by=DT$SEX)
  
  tapply(DT$pwgtp15,DT$SEX,mean)
  