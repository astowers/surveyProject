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

# build figures
library(ggplot2)

## relationship between month of the year and mean weight
# data parsing
month_weight <- surveys%>%
  group_by(month) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

# figure 1
ggplot(data = month_weight, aes(x=month, y=mean_weight)) + geom_line() + scale_x_continuous(breaks=seq(1,12, 1)) + xlab("Month") + ylab("Mean weight (g)") + ggtitle("Figure 1 - Relationship between month and weight")

## distribution of weights amongst rodents 
# data parsing
rodent_weight <- surveys %>%
  filter(taxa == "Rodent") %>%
  select(genus, weight)

# figure 2
ggplot(data = rodent_weight, aes(x=genus, y=weight)) + geom_boxplot() + xlab("Genus") + ylab("Weight (g)") + ggtitle("Figure 2 - Distribution of weights by genus")+ theme(axis.text.x=element_text(angle = -30, hjust = 0))

## comparison of weights amongst taxa over time
# data parsing
year_weight <- surveys %>%
  group_by(year, plot_type) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

# figure 3
ggplot(data = year_weight, aes (x=year, y=mean_weight, by=plot_type)) + geom_line(aes(color=plot_type)) + xlab("Year") + ylab("Mean weight (g)") + ggtitle("Figure 3 - Comparison of weights by year")

