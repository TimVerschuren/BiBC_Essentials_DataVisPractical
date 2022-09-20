#INIT
#Install and load ggplot2 and tidyverse if not installed
#Load chicken data

require("ggplot2")
library("ggplot2")

require("tidyr")
library("tidyr")
chicken_data <- read.csv('C:/Users/Tim/OneDrive/BIBC/Year 1/Period 1/BiBC Essentials/Week 2 Practical 1/Scorings.csv', sep=";")

clean_chicken_data <- chicken_data %>% select(-AnimalIdentifier, 
                                              -Feet, 
                                              -Head, 
                                              -Type, 
                                              -FeatherColor) 
final_clean_chicken_data <- clean_chicken_data %>%  filter(Color %in% c("Black", "Blue"))



chicken_plot <- ggplot(data = final_clean_chicken_data, 
                       mapping = aes(x = Sex, y = Weight))
chicken_plot +
  ggtitle("Brahma chicken weight based on sex and color") +
  geom_boxplot(alpha=0) +
  geom_jitter(width=0.25, size=2, aes(color=Color)) +
  scale_color_manual(values=c("black", "cyan")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.position = "none")
