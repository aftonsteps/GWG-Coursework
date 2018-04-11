
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = "styles.css",
  
  # Application title
  titlePanel(HTML("<span id=mainTitle>Game Play Hours on Steam</span>"),
             windowTitle = "Game Play Hours on Steam"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
            HTML("<span class=optionTitle id=mainOptControl>General Plot Controls</span>"),
            HTML("<br/><br/>"),
            HTML("<span class=optionTitle id=titleControls>Games:</span>"),
       checkboxGroupInput(inputId = "gameTitle", 
                    label = "",
                    choices= c(
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
                            ),
                    selected= c(
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
                   ),
       HTML("<span class=optionTitle id=minHours>Minimum hours played:</span>"),
       textInput(inputId="minHours",
                 label="",
                 value=0),
       HTML("<br/><br/>"),
       HTML("<span class=optionTitle id=histControl>Histogram Controls</span>"),
       HTML("<br/><br/>"),
       HTML("<span class=optionTitle id=binControl>Number of bins:</span>"),
       sliderInput("bins",
                   "",
                   min = 1,
                   max = 100,
                   value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
            HTML("<span class=plotTitle id=avgPlotTitle>Average Hours Played By Game</span>"),
            plotOutput("averagePlot"),
            HTML("<span class=plotTitle id=distPlotTitle>Players Per Hours Played</span>"),
            HTML("<br/>"),
            HTML("<span class=plotSubTitle id=distSubPlotTitle>(Includes all selected games)</span>"),
       plotOutput("distPlot")
    )
  )
))
