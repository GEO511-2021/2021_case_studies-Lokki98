proposal
================
Ziqi Tang

# Introduction to problem/question

As Earth’s population continues to grow, remote sensing of nighttime
light emissions offers a unique perspective for investigations into some
of these human behaviors. China’s economy has developed rapidly in
recent years. However, there are gaps in urban construction and economic
development in different regions.

### Problem / Question

What are the characteristics of the distribution and change of night
lights in China from 2000 to 2020?

# Inspiring Examples

## Example 1

<center>
<img src="https://raw.githubusercontent.com/GEO511-2021/2021_case_studies-Lokki98/master/map.png">
</center>

I found this graphic easy to understand the CO2 emissions in different
countries. This type of graphic could be used to reflect the
distribution of night light in different provinces of China.

## Example 2

I found this graphic easy to understand the changes in annual emissions
in different countries. This type of graphic could be used to reflect
the trend of a phenomenon using simple ‘geom\_line’ in ggplot.

## Example 3

<center>
<img src="https://raw.githubusercontent.com/GEO511-2021/2021_case_studies-Lokki98/master/map.png">
</center>

# Proposed data sources

CO2 emissions: this data is sourced from the Global Carbon Project.

Greenhouse gas emissions (including methane, and nitrous oxide): this
data is sourced from the CAIT Climate Data Explorer, and downloaded from
the Climate Watch Portal.

Population & GDP

# Proposed methods

1.  Read data by “read\_csv” function.
2.  Divide the data into the following categories: United States,
    European Union, Japan, Russia, other high-come developed countries,
    China, India, Middle East & North Africa, Latin America, other
    developing Asia, etc.
3.  Use “piechart” to reflect the percent of annual emissions of
    different countries.
4.  Use “geom\_line” to reflect the changes in annual emissions, CO2 and
    GDP.
5.  Use “correlation” to show the relation coefficients of different
    countries.

# Expected results

1.  Piechart showing the percentage of annual emissions in different
    countries.
2.  Graph showing the changes of annual emissions, CO2, and GDP in 2000,
    2004, 2008, 2012.
3.  Graph showing the relation coefficients of different countries.
