## SDS R Workshop II

# Create preload function
# Check if a package is installed.
# If yes, load the library
# If no, install package and load the library

# Use gganimate to create animated charts
# Caveat: gganimate is frequently updated.  May not run on earlier versions of R


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

install.packages("ggplot2")
install.packages("wesanderson")
devtools::install_github("dgrtwo/gganimate")
library(gganimate)
library(ggplot2)

# Basic scatter plot

mapping <- aes(x =gdpPercap, y = lifeExp, 
               size = pop, color = continent,
               frame = year) 

# Note: manual color choices.

ggplot(g2, mapping = mapping) +
  geom_point() +
  theme_linedraw() + 
  scale_x_log10()+
  scale_color_manual(values=c("purple","green","red","light blue","cyan"))+
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  geom_text(aes(label=ifelse((gapminder$country == "China"), "China", ifelse(gapminder$country=="Taiwan", "Taiwan", ""))),vjust=0,nudge_y = 1,size=6) +
    transition_time(year) +
  ease_aes('linear')
    
anim_save("p.gif")

## Exercise
# 1. Check the variables in gapminder
# 2. Change the variable gdpPercap to size and pop to x