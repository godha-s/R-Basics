#+eval=FALSE
# install the vcd package
# install.packages("vcd")

# import the vcd library
library(vcd)

# initializing the sales vector data as per the instruction document
sales <- c(10, 10, 12, 15, 20, 15, 25, 9, 8, 26)

# initializing the temperature vector data as per the instruction document
temperature <- c(69, 81, 78, 88, 81, 76, 83, 72, 60, 95)

# plot the sales ~ temperature data
plot(
  temperature,
  sales,
  main = "sales ~ temperature scatter plot",
  ylab = "Sales",
  xlab = "Temperature" ,
  col = "blue"
)

# added circle size and type of circle
plot(
  temperature,
  sales,
  main = "sales ~ temperature scatter plot",
  ylab = "Sales",
  xlab = "Temperature" ,
  col = "blue",
  pch = 19,
  cex = 5
)

# changed circle to different icon for scatter plot
plot(
  temperature,
  sales,
  main = "sales ~ temperature scatter plot",
  ylab = "Sales",
  xlab = "Temperature" ,
  col = "blue",
  pch = 18,
  cex = 5
)
