#################
#      INIT     #
#################

chicken_data <- read.csv(
  'C:/Users/31637/OneDrive/Documentos/Master/BiBc Essentials/R/Data/Scorings.csv',
   sep=';'
  ) # Read chicken data with ; as a delimiter
chicken_data[chicken_data == ''] <- 'Unknown' #Replace empty variables with 'Unkown'

require(ggplot2, ggrepel) # Install necessary packages
library(ggplot2, ggrepel) # Load necessary packages



#################
#     Plot      #
#################

set.seed(1) # Set the randomness seed for jitter
chicken_plot <- ggplot(transform(chicken_data, 
                                 xjit=jitter(as.numeric(as.factor(Sex)))), 
                                  aes(x=Sex,y=Weight)) # Initialise plot

chicken_plot + 
  ggtitle("Brahma chicken weight based on sex and colour") + ylab("Weight (g)") + 
  geom_boxplot(alpha=0) +  
  geom_point(aes(fill=Color, x=xjit), colour="black", shape=21, size=5) + #Make jitter points with black circles around
  scale_fill_manual(values=c('#606060','#12c0c9', '#FFFFFF')) + # Set colours according to chicken colours
  
  geom_text_repel( # Annotate three points instead of using a legend
                  aes(x=xjit, 
                    label=ifelse(Weight>2900 & Weight<3150,as.character(Color),'')),
                  hjust=0,vjust=-1
                  ) +
  
  theme( # Set some visual themes
        legend.position="none",
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        axis.title.x=element_blank(),
        plot.title = element_text(hjust=.5, size=14, face='bold')
        ) 

