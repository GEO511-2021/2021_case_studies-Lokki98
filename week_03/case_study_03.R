library(ggplot2)
library(gapminder)
library(dplyr)
gapminder %>%
  filter(country != "Kuwait")

ggplot(gapminder,aes(x = lifeExp,y = gdpPercap)) +
  geom_point(aes(color = continent,size=pop/100000)) +
  scale_y_continuous(trans = "sqrt") +
  facet_wrap(~year,nrow=1) +
  labs(title = "Wealth and life expectancy through time")

gapminder_continent <- gapminder %>%
  group_by(continent,year) %>%
  summarize(country,
            gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
            pop = sum(as.numeric(pop)))
gapminder$country
ggsave("D://R/tmp//2021_case_studies-Lokki98//week_03//wealth&life1.png",device = "png",width = 15)

ggplot(gapminder,group = country) +
  geom_point(aes(x = year,y = gdpPercap,color = continent,size=pop/1000000)) +
  geom_line(aes(x = year, y = gdpPercap,color = continent)) + 
  geom_line(data = gapminder_continent,aes(x = year,y = gdpPercapweighted)) +
  geom_point(data = gapminder_continent,aes(x = year,y = gdpPercapweighted)) +
  facet_wrap(~continent,nrow = 1) + 
  theme_bw(
    base_size = 12,
    base_family = ""
  ) + 
  labs(title = "Wealth and life expectancy through time")

ggsave("D://R/tmp//2021_case_studies-Lokki98//week_03//wealth&life2.png",device = "png",width = 15)




