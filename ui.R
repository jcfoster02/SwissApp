
library(shiny)

shinyUI(fluidPage(
  titlePanel('Swiss Linear Regression Models'),
  sidebarLayout(
        sidebarPanel(
            checkboxInput("lm1", "Show LM: Fertility ~ Education (black line)", value=TRUE), 
            checkboxInput("lm2", "Show LM: Fertility ~ Education + Catholic (pink line)"), 
            checkboxInput("lm3", "Show LM: Fertility ~ Education * Catholic (blue line)"),
        
            hr(),
            helpText("Pick one or more linear models to plot with the data.")
            ),
        
        mainPanel(
            h3("Swiss Plot: Fertility vs. Education"),
            plotOutput("plot1")
            
        )
  )
))