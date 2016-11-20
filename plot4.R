
R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> Plot 4
Error: unexpected numeric constant in "Plot 4"
> ## downloaded and unzipped necessary file
>  if(!file.exists("./data")){dir.create("./data")}
>  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
>  download.file(fileUrl,destfile="./data/Dataset.zip",method="auto")
trying URL 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
Content type 'application/zip' length 20640916 bytes (19.7 MB)
downloaded 19.7 MB

>  unzip(zipfile="./data/Dataset.zip",exdir="./data")
> 
> ## constructed path for files
>  wearpath <- file.path(C:\Users\Denise Laptop\Documents\data\household_power_consumption.txt)
Error: unexpected input in " wearpath <- file.path(C:\"
> 
> ## variable to list the files
>  files <-list.files(wearpath,recursive=TRUE)
Error in list.files(wearpath, recursive = TRUE) : 
  object 'wearpath' not found
> 
> ## Set working Directory
> setwd("~/data/")
> 
> ## reading files
> globalpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
> 
> ## assigning  names
> names(globalpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
> 
> ## assigning  2007 subset data
> globalpowerset <- subset(globalpower,globalpower$Date=="1/2/2007" | globalpower$Date =="2/2/2007")
> 
> ## Converting the date and time characters into objects
> globalpowerset$Date <- as.Date(globalpowerset$Date, format="%d/%m/%Y")
> globalpowerset$Time <- strptime(globalpowerset$Time, format="%H:%M:%S")
> globalpowerset[1:1440,"Time"] <- format(globalpowerset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
> globalpowerset[1441:2880,"Time"] <- format(globalpowerset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
> 
> ## making plot with four different graphs
> par(mfrow=c(2,2))
> with(globalpowerset,{
+ plot(globalpowerset$Time,as.numeric(as.character(globalpowerset$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
+ plot(globalpowerset$Time,as.numeric(as.character(globalpowerset$Voltage)), type="l",xlab="datetime",ylab="Voltage")
+ plot(globalpowerset$Time,globalpowerset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
+ with(globalpowerset,lines(Time,as.numeric(as.character(Sub_metering_1))))
+ with(globalpowerset,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
+ with(globalpowerset,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
+ legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
+ plot(globalpowerset$Time,as.numeric(as.character(globalpowerset$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")})
> 
> 
> 
> 
