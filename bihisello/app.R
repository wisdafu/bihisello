#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(DT)
library(plotly)
library(dplyr)
library(leaflet)
library(quantmod)

getSymbols('AAPL', from = '2016-01-01')

ui <- dashboardPage(
  dashboardHeader(title = "Stats"),
  
  dashboardSidebar(
    sidebarMenu(
      
    ) # end sidebarMenu
  ), # end dashboardSidebar
  
  dashboardBody(
    box(title = "Main Data Table", solidHeader = TRUE, status = "primary", width = 8, dataTableOutput("mainDataTable"))
  ) # end dashboardBody
) # end dashBoardPage

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$mainDataTable <- DT::renderDataTable({
    t <- AAPL
    
    DT::datatable(t, options = list(pageLength = 12, lengthChange = FALSE, searching = FALSE))
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)