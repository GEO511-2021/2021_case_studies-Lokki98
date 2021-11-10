Case Study 10
================
Ziqi Tang
August 1, 2020

### Part 1

library(raster) library(rasterVis) library(rgdal) library(ggmap)
library(tidyverse) library(knitr) library(ncdf4)

dir.create(“data”,showWarnings = F)

lulc\_url=“<https://github.com/adammwilson/DataScienceData/blob/master/inst/extdata/appeears/MCD12Q1.051_aid0001.nc?raw=true>”

lst\_url=“<https://github.com/adammwilson/DataScienceData/blob/master/inst/extdata/appeears/MOD11A2.006_aid0001.nc?raw=true>”

download.file(lulc\_url,destfile=“data/MCD12Q1.051\_aid0001.nc”,
mode=“wb”)

download.file(lst\_url,destfile=“data/MOD11A2.006\_aid0001.nc”,
mode=“wb”)

lst=stack(“data/MOD11A2.006\_aid0001.nc”,varname=“LST\_Day\_1km”)

lw=SpatialPoints(data.frame(x= -78.791547,y=43.007211))

projection(lw) &lt;- “+proj=longlat”

spTransform(lw,crs(lst))

extractedPoint &lt;-
raster::extract(lst,lw,buffer=1000,fun=mean,na.rm=T) %&gt;% t() %&gt;%
as.data.frame() %&gt;% mutate(date = getZ(lst))

head(extractedPoint)

ggplot(extractedPoint,aes(x=date,y=V1 / 10)) + geom\_point() +
geom\_smooth(span = 0.01,n = 100) + ylab(“Monthly Mean Land Surface
Temperature”)

### Part 2

tmonth &lt;- as.numeric(format(getZ(lst),“%m”))

lst\_month &lt;- stackApply(lst /100000, indices = tmonth, fun=mean)

names(lst\_month)=month.name

rasterVis::gplot(lst\_month) + geom\_tile(aes(fill = value )) +
facet\_wrap(\~ variable) + scale\_fill\_gradient(low = ‘blue’, high =
“orange”) + coord\_equal()

monthly\_mean &lt;- cellStats(lst\_month / 10000,mean) monthly\_mean
