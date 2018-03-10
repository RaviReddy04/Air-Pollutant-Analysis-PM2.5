library(ggplot2)
NEI <- readRDS( file.path(getwd(), "exdata_data_NEI_data","summarySCC_PM25.rds"))
SCC <- readRDS(file.path(getwd(), "exdata_data_NEI_data","Source_Classification_Code.rds"))


NEI_SCC<- merge(NEI,SCC, by= "SCC")
head(Agg_NEI_Year)
Sub_NEI_SSC<- grepl("Coal",NEI_SCC$Short.Name, ignore.case= TRUE )
Agg_NEI_Year<- aggregate(Emissions ~ year, data = NEI_SCC[Sub_NEI_SSC,] , sum)
?grep
png("plot4.png")
p <- ggplot(Agg_NEI_Year, aes(year,Emissions))
p+ geom_bar(stat="identity") +ggtitle("Baltimore PM2.5 emissions of coal  from 1999 to 2008")
dev.off()


