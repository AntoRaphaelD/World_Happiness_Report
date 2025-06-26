install.packages('dplyr')
library(dplyr)

open_data <- read.csv("countries.csv", stringsAsFactors=F)
happiness <- read.csv("2015.csv", stringsAsFactors=F)

colnames(open_data)[2] <- "Country"

open_data_happiness <- open_data %>%
  left_join(happiness, by = "Country") %>%
  mutate(Country = factor(Country)) %>%
  
  select(Country, Region, X2015.Score, Happiness.Score, Economy..GDP.per.Capita., 
         Family, Health..Life.Expectancy., Freedom, Trust..Government.Corruption., 
         Generosity, Dystopia.Residual)

colnames(open_data_happiness) <- c("Country", "Region", "Openness", "Happiness", "GDP", "Family", "Health", "Freedom", "Trust", "Generosity", "DystopiaResidual")

install.packages('formattable')
library(formattable)

open_data_happiness %>%
  arrange(desc(Openness)) %>%
  mutate_each(funs(round(., 2)), -c(Country, Region, Openness)) %>%
  head(10) %>%
  formattable(list(
    Openness = color_bar("yellow"),
    Happiness = color_bar("lightgreen"),
    GDP = color_bar("deepskyblue"),
    Family = color_bar("deepskyblue"),
    Health = color_bar("deepskyblue"),
    Freedom = color_bar("deepskyblue"),
    Trust = color_bar("deepskyblue"),
    Generosity = color_bar("deepskyblue"),
    DystopiaResidual = color_bar("deepskyblue")
  ), align = "l")

install.packages('ggplot2')
install.packages('ggthemes')
install.packages('viridis')

library(ggplot2)
library(ggthemes)
library(viridis)

ggplot(open_data_happiness, 
       aes(x = Openness, 
           y = Happiness)) +
  geom_point(aes(colour = Region),
             size = 2) +
  geom_smooth(method="lm") +
  labs(x = "Openness Score",
       y = "Happiness Score",
       title = "Are open data friendly countries happy countries?",
       subtitle = "Data openness and happiness by country in 2015") +
  scale_color_viridis(discrete = T) +
  theme_minimal() +
  theme(text = element_text(size=16))

install.packages('corrplot')
library(corrplot)

open_data_corr <- open_data_happiness %>%
  select(Openness, Happiness, GDP, Family, Health, 
         Freedom, Trust, Generosity, DystopiaResidual) %>%
  mutate(Openness = as.numeric(Openness))

od_corr <- cor(open_data_corr, use = "complete", method = "pearson")

corrplot(od_corr)