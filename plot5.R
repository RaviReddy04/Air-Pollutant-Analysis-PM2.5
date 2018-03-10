
library(ggplot2)
NEI <- readRDS( file.path(getwd(), "exdata_data_NEI_data","summarySCC_PM25.rds"))
SCC <- readRDS(file.path(getwd(), "exdata_data_NEI_data","Source_Classification_Code.rds"))


NEI_SCC<- merge(NEI,SCC, by= "SCC")

subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(("Total PM(2.5) Emissions")) +
  ggtitle('Total Emissions from motor vehicle ON-ROAD in Baltimore City, Maryland fips= "24510" from 1999 to 2008')
dev.off()

