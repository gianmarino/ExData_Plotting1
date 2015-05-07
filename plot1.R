plot1<-function(){
  ## Plot1 -> plots a Global Active Power histogram
  
  ## Extraction and preparation of data. Takes from fullData and dumps it, clean, on partData
  fullData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
  fullData$Date<-as.Date(fullData[,"Date"],format="%d/%m/%Y")
  #fullData$Time<-strptime(fullData[,"Time"],format="%X") ## doubt
  filt1<-fullData$Date=="2007-02-01"|fullData$Date=="2007-02-02"
  partData<-fullData[filt1,]
  
  ## Opens device (png) and begins graphic routine. Closes device.
  png("plot1.png")
  hist(partData$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="orange")
  dev.off()
}