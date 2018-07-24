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
# Basic scatter plot
mapping <- aes(x =pop , y = lifeExp, 
               size = gdpPercap, color = continent,
               frame = year) 
p <- ggplot(gapminder, mapping = mapping) +
  geom_point() +
  scale_x_log10()
# Animate
gganimate(p)

## Exercise
# 1. Check the variables in gapminder
# 2. Change the variable gdpPercap to size and pop to x
