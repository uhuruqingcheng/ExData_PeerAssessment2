
# The encoding of the script is CP936
# R version 3.1.1 (2014-07-10) -- "Sock it to Me"
# Platform: i386-w64-mingw32/i386 (32-bit)
# Operating system: Windows 7 (SP1)
# 20140821 qingcheng

# Couresra-[Exploratory Data Analysis][exdata-005][Course Project 2]

# The overall goal of this assignment is to explore the National Emissions
# Inventory database and see what it say about fine particulate matter 
# pollution in the United states over the 10-year period 1999¨C2008. 

# Download and UnZip the dataset (29MB)
DataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
DataInfoUrl <- "http://www.epa.gov/ttn/chief/eiinformation.html"


download.file(DataUrl, "exdata-data-NEI_data.zip", mode = "wb")
# dateDownloaded <- date()
# dateDownloaded
# [1] "Thu Aug 21 14:39:28 2014"

unzip("exdata-data-NEI_data.zip")

