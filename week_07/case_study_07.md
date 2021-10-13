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
st_as_sf(world)
```

    ## Simple feature collection with 176 features and 10 fields
    ## Geometry type: MULTIPOLYGON
    ## Dimension:     XY
    ## Bounding box:  xmin: -180 ymin: -55.61183 xmax: 180 ymax: 83.64513
    ## Geodetic CRS:  WGS 84
    ## # A tibble: 176 x 11
    ##    iso_a2 name_long continent region_un subregion type  area_km2     pop lifeExp
    ##  * <chr>  <chr>     <chr>     <chr>     <chr>     <chr>    <dbl>   <dbl>   <dbl>
    ##  1 FJ     Fiji      Oceania   Oceania   Melanesia Sove~   1.93e4  8.86e5    70.0
    ##  2 TZ     Tanzania  Africa    Africa    Eastern ~ Sove~   9.33e5  5.22e7    64.2
    ##  3 EH     Western ~ Africa    Africa    Northern~ Inde~   9.63e4 NA         NA  
    ##  4 CA     Canada    North Am~ Americas  Northern~ Sove~   1.00e7  3.55e7    82.0
    ##  5 US     United S~ North Am~ Americas  Northern~ Coun~   9.51e6  3.19e8    78.8
    ##  6 KZ     Kazakhst~ Asia      Asia      Central ~ Sove~   2.73e6  1.73e7    71.6
    ##  7 UZ     Uzbekist~ Asia      Asia      Central ~ Sove~   4.61e5  3.08e7    71.0
    ##  8 PG     Papua Ne~ Oceania   Oceania   Melanesia Sove~   4.65e5  7.76e6    65.2
    ##  9 ID     Indonesia Asia      Asia      South-Ea~ Sove~   1.82e6  2.55e8    68.9
    ## 10 AR     Argentina South Am~ Americas  South Am~ Sove~   2.78e6  4.30e7    76.3
    ## # ... with 166 more rows, and 2 more variables: gdpPercap <dbl>,
    ## #   geom <MULTIPOLYGON [arc_degree]>

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
