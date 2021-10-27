proposal
================
Ziqi Tang

[<i class="fa fa-file-code-o fa-1x" aria-hidden="true"></i> Download
this file as a
template](http://adamwilson.us/SpatialDataScience/scripts/Project_ProposalTemplate.Rmd).

# Introduction to problem/question

The Kyoto Protocol divides the world’s countries into two categories in
terms of carbon emissions, one is rich countries and the other is
developing countries. The agreement stipulates that the former will
reduce emissions, while the latter will not bear the obligation of
emission reduction due to the needs of economic development. After the
entry into force of the Kyoto Protocol in 1997, the carbon emissions of
Europe, the United States and other rich countries and regions did slow
down and GDP continued to grow rapidly. However, the carbon emissions of
developing countries increased explosively, and the speed of GDP
development was lower than those of these rich countries.

### Problem / Question

Is there any difference in the change of annual emissions in different
countries and the relationship between emissions and GDP?

# Inspiring Examples

## Example 1

<img src="D:\R\tmp\2021_case_studies-Lokki98\images\pie.png" width="40%" style="display: block; margin: auto;" />
<https://www.cgdev.org/media/developing-countries-are-responsible-63-percent-current-carbon-emissions>

I found this graphic easy to understand the percent of annual emissions
which countries produce. This type of graphic could be used to
illustrate the proportion of different sectors using simple ‘Piechart’
in ggplot.

## Example 2

<img src="D:\R\tmp\2021_case_studies-Lokki98\images\consumption-co2-per-capita.png" width="40%" style="display: block; margin: auto;" />
<https://ourworldindata.org/grapher/consumption-co2-per-capita?tab=chart&time=1800>..2018&country=\~CHN

I found this graphic easy to understand the changes in annual emissions
in different countries. This type of graphic could be used to reflect
the trend of a phenomenon using simple ‘geom\_line’ in ggplot.

## Example 3

<img src="D:\R\tmp\2021_case_studies-Lokki98\images\correlation.jpeg" width="40%" style="display: block; margin: auto;" />
<https://courses.lumenlearning.com/boundless-statistics/chapter/correlation/>

I found this graphic easy to understand the correlation between the
population and carbon emissions. This type of graphic could be used to
reflect the correlation between CO2 and greenhouse emissions in
different countries using package ‘correlation’.

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