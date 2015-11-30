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

## explore weight vs hindfood length within smaller species

# data parsing

month_weight <- surveys%>%
  group_by(month) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

rodent_weight <- surveys %>%
  filter(taxa == "Rodent") %>%
  select(genus, weight)

year_weight <- surveys %>%
  group_by(year, plot_type) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

# build figures
library(ggplot2)

# figure1 - relationship between month of the year and mean weight
ggplot(data = month_weight, aes(x=month, y=mean_weight)) + geom_point() + xlab("Month") + ylab("Mean weight (g)") + ggtitle("Figure 1 - Relationship between month and weight")

# figure2 - distribution of weights amongst rodents 
ggplot(data = rodent_weight, aes(x=genus, y=weight)) + geom_boxplot() + xlab("Genus") + ylab("Weight (g)") + ggtitle("Figure 2 - Distribution of weights by genus")

# figure3 - comparison of weights amongst taxa over time
ggplot(data = year_weight, aes (x=year, y=weight)) + geom_line()

## look at composition of data in sampling

## explore comparisons between variables

