## survey project in R

# install and load library
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

#download a file
download.file("http://files.figshare.com/2236372/combined.csv",  "data/portal_data_joined.csv")
#import file
surveys <- read.csv('data/portal_data_joined.csv')

#### time, species, sex, hindfoot, weight, taxa, plot type/plot ID

## explore sex vs hindfood length within smaller species

# data parsing

surveys_sml <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, hindfoot_length)
 
# build figure
library(ggplot2)
ggplot(data = surveys, aes(x=hindfoot_length, y=sex)) + geom_point()

## look at composition of data in sampling

## explore comparisons between variables

