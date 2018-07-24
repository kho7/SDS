## SDS Workshop 0

print("Hello, world.  I am Karl.")

# Create a dataframe from an online data file
# The data file is in csv format (Comma Separated Values)

happy=read.csv("https://raw.githubusercontent.com/kho7/SDS/master/ProgrammingWorkshops/R/happy.csv")
hist(happy$hpindex,xlab="Gallup Life Satisfaction Index")
hist(happy$hpindex,xlab="Gallup Life Satisfaction Index",main="Happy Life")
hist(happy$hpindex,xlab="Gallup Life Satisfaction Index",main="Happy Life",col=rainbow(10)) 
hist(happy$hpindex,xlab="Gallup Life Satisfaction Index",main="Happy Life",col=heat.colors(10)) 
