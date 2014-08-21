
# The encoding of the script is CP936
# R version 3.1.1 (2014-07-10) -- "Sock it to Me"
# Platform: i386-w64-mingw32/i386 (32-bit)
# Operating system: Windows 7 (SP1)
# 20140821 qingcheng

# Couresra-[Exploratory Data Analysis][exdata-005][Course Project 2]

# The overall goal of this assignment is to explore the National Emissions
# Inventory database and see what it say about fine particulate matter 
# pollution in the United states over the 10-year period 1999¨C2008. 

# Question 5
# How have emissions from motor vehicle sources changed from 1999¨C2008 in
# Baltimore City?


# see downloadData.R
# read dataset, this first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


BaltimoreCityMotor <- subset(NEI, fips == "24510" & type == "ON-ROAD")
s <- tapply(BaltimoreCityMotor$Emissions, BaltimoreCityMotor$year, sum)


png("plot5.png", width=480, height=480)
plot(names(s), s, xlab="Year", type="l", 
     main=expression(PM[2.5]~"from motor vehicle sources in Baltimore City"),
     ylab=expression("Total " ~ PM[2.5] ~ " emissions (tons)"))
dev.off()

