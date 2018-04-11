library(ggplot2)
library(shiny)

#### COLORS ####################################################################
barChartColors <- read.csv("www/barChartColors.csv", stringsAsFactors=FALSE)[,1]
histogramColor <- read.csv("www/histogramColor.csv", stringsAsFactors=FALSE)[,1]
################################################################################

## Load files ------------------------------------------------------------------
includeCSS("www/styles.css")
dataset <- read.csv("steam-200k.csv", stringsAsFactors=FALSE)
## Fix the colnames because sometimes there are character encoding issues
colnames(dataset) <- c("id",
                       "game",	
                       "behavior",	
                       "hours",	
                       "filler") 

## Subset data to the brands in the app ui -------------------------------------
## Normally subsetting would be done offline to save time
## But the full dataset is left in here for you to play with.
topGames <-  c(
        "Dota 2",
        "Team Fortress 2",
        "Counter-Strike Global Offensive",
        "Unturned",
        "Left 4 Dead 2",
        "Counter-Strike Source",
        "Counter-Strike",
        "Garry's Mod",
        "The Elder Scrolls V Skyrim",
        "Warframe"
        )
dataset <- dataset[dataset$game %in% topGames, ]
playhours <- dataset[dataset$behavior!="purchase", ]

## Make plots ------------------------------------------------------------------
shinyServer(function(input, output) {
        ## Set up reactive values for subsetting by selections
        playSubset <- reactiveValues(values=playhours)
        
        ## Subset data by games included
        observeEvent(input$gameTitle, {
                newSubset <- playhours
                newSubset <- newSubset[newSubset$game %in% input$gameTitle, ]
                playSubset$values <- newSubset
        })
        
        ## Subset data by minimum hours
        observeEvent(input$minHours, {
                newSubset <- playhours
                newSubset <- newSubset[newSubset$hours >= input$minHours, ]
                playSubset$values <- newSubset
        })
        
        ## Make average plot using subsetted data
        output$averagePlot <- renderPlot({
                playhoursByGame <- playSubset$values
                ggplot(playhoursByGame, aes(x=factor(game), y=hours, fill=game)) + 
                        stat_summary(fun.y="mean", geom="bar") +
                        xlab("Game") +
                        ylab("Average Hours Played") +
                        theme_bw() +
                        theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
                        scale_fill_manual(values=c(barChartColors))
        })
        
        ## Make histogram using subsetted data
        output$distPlot <- renderPlot({
          playhoursByGame <- playSubset$values
          bins <- input$bins
          ggplot(data=playhoursByGame, aes(x=hours)) + 
                  geom_histogram(bins=bins, fill=histogramColor) +
                  xlab("Hours Played") +
                  ylab("Players At This Number of Hours") +
                  theme_bw()
   
  })
  
})
