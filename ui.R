library(shiny)
require(rCharts)

shinyUI(fluidPage(
  titlePanel("Surface Science Spectra"),
  
  sidebarLayout(
    sidebarPanel( 
      helpText("Single Crystal Rare-Earth Scandate Perovskites Analyzed Using X-Ray Photoelectron Spectroscopy"),

      selectInput("var", 
                  label = "Chose a variable to display",
                  choices = c("PrScO3", "NdScO3", "GdScO3", "TbScO3", "DyScO3"),
                  selected = "PrScO3"), 
      
      sliderInput("range", 
                  label = "Scale of x-axis",
                  min = 0, max = 2000, value = c(0,1400))
           ),
    mainPanel(
      showOutput("myPlot", "polycharts"))
    )
))