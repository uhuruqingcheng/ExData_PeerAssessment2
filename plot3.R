
# The encoding of the script is CP936
# R version 3.1.1 (2014-07-10) -- "Sock it to Me"
# Platform: i386-w64-mingw32/i386 (32-bit)
# Operating system: Windows 7 (SP1)
# 20140821 qingcheng

# Couresra-[Exploratory Data Analysis][exdata-005][Course Project 2]

# The overall goal of this assignment is to explore the National Emissions
# Inventory database and see what it say about fine particulate matter 
# pollution in the United states over the 10-year period 1999¨C2008. 

# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in 
# emissions from 1999¨C2008 for Baltimore City? Which have seen increases in 
# emissions from 1999¨C2008? Use the ggplot2 plotting system to make a plot 
# answer this question.


# see downloadData.R
# read dataset, this first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)


BaltimoreCity <- subset(NEI, fips == "24510")
s = aggregate(BaltimoreCity$Emissions ~ BaltimoreCity$year + 
                  BaltimoreCity$type, FUN=sum)
names(s) <- c("year", "type", "totalEmissions")

png("plot3.png", width=600, height=300)
qplot(year,totalEmissions,data=s,facets=.~type)+  
    ggtitle(expression("Total" ~ PM[2.5] ~
                           "emissions Of the four types of sources")) + 
    ylab(expression("Total" ~ PM[2.5] ~ "emissions (tons)"))
dev.off()

