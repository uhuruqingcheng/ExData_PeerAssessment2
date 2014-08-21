
# The encoding of the script is CP936
# R version 3.1.1 (2014-07-10) -- "Sock it to Me"
# Platform: i386-w64-mingw32/i386 (32-bit)
# Operating system: Windows 7 (SP1)
# 20140821 qingcheng

# Couresra-[Exploratory Data Analysis][exdata-005][Course Project 2]

# The overall goal of this assignment is to explore the National Emissions
# Inventory database and see what it say about fine particulate matter 
# pollution in the United states over the 10-year period 1999¨C2008. 

# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make 
# a plot answering this question.


# see downloadData.R
# read dataset, this first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


BaltimoreCity <- subset(NEI, fips == "24510")
s = aggregate(BaltimoreCity$Emissions ~ BaltimoreCity$year, FUN=sum)
names(s) <- c("year","totalEmissions")


png("plot2.png", width=480, height=480)
plot(s$year, s$totalEmissions, type="l",
     main=expression(PM[2.5] ~ "for Baltimore City"), xlab="Year",
     ylab=expression("Total " ~ PM[2.5] ~ " emissions from all sources (tons)"))
dev.off()

