
# The encoding of the script is CP936
# R version 3.1.1 (2014-07-10) -- "Sock it to Me"
# Platform: i386-w64-mingw32/i386 (32-bit)
# Operating system: Windows 7 (SP1)
# 20140821 qingcheng

# Couresra-[Exploratory Data Analysis][exdata-005][Course Project 2]

# The overall goal of this assignment is to explore the National Emissions
# Inventory database and see what it say about fine particulate matter 
# pollution in the United states over the 10-year period 1999¨C2008. 

# Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?


# see downloadData.R
# read dataset, this first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)


CityMotor <- subset(NEI, (fips %in% c("24510","06037")) & type == "ON-ROAD")
s = aggregate(CityMotor$Emissions ~ CityMotor$year + CityMotor$fips, FUN=sum)
names(s) <- c("year","fips","totalEmissions")
s <- transform(s,region = ifelse(fips == "24510", 
                                 "Baltimore City", "Los Angeles County"))


png("plot6.png", width=600, height=400)
qplot(year,totalEmissions,data=s,facets=.~region) +  
    ggtitle(expression("Total" ~ PM[2.5] ~"from motor vehicle sources")) + 
    ylab(expression("Total" ~ PM[2.5] ~ "emissions (tons)"))
dev.off()

