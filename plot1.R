## This first line will likely take a few seconds. Be patient!
NEI <- readRDS( file.path(getwd(), "exdata_data_NEI_data","summarySCC_PM25.rds"))
SCC <- readRDS(file.path(getwd(), "exdata_data_NEI_data","Source_Classification_Code.rds"))

Agg_NEI_Year<- aggregate(Emissions ~ year , data = NEI , sum)

png("plot1.png")
barplot(height= Agg_NEI_Year$Emissions, names.arg = Agg_NEI_Year$year ,xlab = "years", ylab= "Total PM2.5 Emmision in Tons", main="PM2.5 emissions at various years")
#NEI_SCC <- merge(NEI, SCC, by = "SCC")
dev.off()
?barplot
