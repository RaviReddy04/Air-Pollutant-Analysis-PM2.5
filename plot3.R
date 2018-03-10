
NEI <- readRDS( file.path(getwd(), "exdata_data_NEI_data","summarySCC_PM25.rds"))
SCC <- readRDS(file.path(getwd(), "exdata_data_NEI_data","Source_Classification_Code.rds"))



NEI_Subset <- subset(NEI , NEI$fips== "24510")

Agg_NEI_Year<- aggregate(Emissions ~ year + type, data = NEI , sum)

png("plot3.png")
p <- ggplot(Agg_NEI_Year, aes(year,Emissions))
p+ geom_point(aes(colour= type)) +ggtitle("Baltimore PM2.5 emissions from 1999 to 2008")
dev.off()
