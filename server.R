library(shiny)
library(dplyr)
library(rbokeh)
require(rCharts)

PrScO3 <- read.table('data/SSS_1.txt')
PrScO3 <- tbl_df(PrScO3)
NdScO3 <- read.table('data/SSS_2.txt')
NdScO3 <- tbl_df(NdScO3)
GdScO3 <- read.table('data/SSS_3.txt')
GdScO3 <- tbl_df(GdScO3)
TbScO3 <- read.table('data/SSS_4.txt')
TbScO3 <- tbl_df(TbScO3)
DyScO3 <- read.table('data/SSS_5.txt')
DyScO3 <- tbl_df(DyScO3)

colnames(PrScO3) <- c('eV', 'counts')
colnames(NdScO3) <- c('eV', 'counts')
colnames(GdScO3) <- c('eV', 'counts')
colnames(TbScO3) <- c('eV', 'counts')
colnames(DyScO3) <- c('eV', 'counts')


shinyServer(function(input, output) {

    output$myPlot <- renderChart({ 
      
      spectra_data <- switch(input$var, 
                             "PrScO3" = PrScO3, 
                             "NdScO3" = NdScO3, 
                             "GdScO3" = GdScO3, 
                             "TbScO3" = TbScO3, 
                             "DyScO3" = DyScO3
                             )
      
      r1 <- rPlot(counts ~ eV, type='point', data=spectra_data, size = list(const = 3))
      r1$layer(data = spectra_data, type='line', color=list(const='#888'), copy_layer=T, tooltip=NULL)
      r1$guides(x = list(title = "", min = input$range[2], max = input$range[1]))
      r1$addParams(dom = 'myPlot')
      return(r1)
      
#      figure(width = 800, height = 400, xlim=c(input$range[1], input$range[2])) %>% 
#        ly_lines(spectra_data) %>%
#        ly_points(eV, counts, data=spectra_data, hover=list(eV, counts), size = 7)
      

    })
})