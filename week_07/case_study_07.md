Case Study 07
================
Ziqi Tang
August 13, 2020

## Install following packages

``` r
library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)
```

## Prepare country polygon data

``` r
world <- world %>%
  filter(name_long != "Antarctica")
as(world,"Spatial")
```

    ## class       : SpatialPolygonsDataFrame 
    ## features    : 176 
    ## extent      : -180, 180, -55.61183, 83.64513  (xmin, xmax, ymin, ymax)
    ## crs         : +proj=longlat +datum=WGS84 +no_defs 
    ## variables   : 10
    ## names       : iso_a2,   name_long,     continent,               region_un,                 subregion,              type,         area_km2,        pop,          lifeExp,        gdpPercap 
    ## min values  :     AE, Afghanistan,        Africa,                  Africa, Australia and New Zealand,           Country, 2416.87048266498,      56295,           50.621, 597.135168986395 
    ## max values  :     ZW,    Zimbabwe, South America, Seven seas (open ocean),            Western Europe, Sovereign country, 17018507.4094666, 1364270000, 83.5878048780488,  120860.06755829

## Prepare Climate Data

Load the WorldClim maximum temperature dataset at the lowest resolution

``` r
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)
```

Convert value back to degree C

``` r
gain(tmax_monthly) = 0.1
```

Calculate annual maximum temperature

``` r
tmax_annual <- max(tmax_monthly)
names(tmax_annual) <- "tmax"
```

## Calculate the maximum temperature observed in each country

``` r
tmax_temp <- raster::extract(tmax_annual,world,fun = max,na.rm=T, small=T,sp=T)
```

## Find the hottest country in each continent

``` r
ggplot(world,aes(fill = tmax)) +
  geom_sf(data = st_as_sf(tmax_temp)) +
  scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)") +
  theme(legend.position = 'bottom')
```

![](case_study_07_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

``` r
hottest_continents <- st_as_sf(tmax_temp) %>%
  group_by(continent) %>%
  select(name_long,continent,tmax) %>%
  arrange(desc(tmax)) %>%
  st_set_geometry(NULL) %>%
  top_n(1,tmax)

hottest_continents
```

    ## # A tibble: 7 x 3
    ## # Groups:   continent [7]
    ##   name_long                           continent                tmax
    ##   <chr>                               <chr>                   <dbl>
    ## 1 Algeria                             Africa                   48.9
    ## 2 Iran                                Asia                     46.7
    ## 3 United States                       North America            44.8
    ## 4 Australia                           Oceania                  41.8
    ## 5 Argentina                           South America            36.5
    ## 6 Spain                               Europe                   36.1
    ## 7 French Southern and Antarctic Lands Seven seas (open ocean)  11.8
