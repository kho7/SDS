## SDS R Workshop II

# Create preload function
# Check if a package is installed.
# If yes, load the library
# If no, install package and load the library

preload<-function(x)
{
  x <- as.character(x)
  if (!require(x,character.only=TRUE))
  {
    install.packages(pkgs=x,  repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}

preload("gapminder")
data("gapminder")
if(!require(devtools)) install.packages("devtools")
devtools::install_github("dgrtwo/gganimate")
library(gganimate)
install.packages("ggplot2")
library(ggplot2)
# Basic scatter plot
mapping <- aes(x =gdpPercap, y = lifeExp, 
               size = pop, color = continent,
               frame = year) 
ggplot(gapminder, mapping = mapping) +
  geom_point() +
  theme_linedraw() + 
  scale_x_log10()+
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

anim_save("p.gif")

## Exercise
# 1. Check the variables in gapminder
# 2. Change the variable gdpPercap to size and pop to x