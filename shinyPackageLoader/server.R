#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(DT)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
values <- shiny::reactiveValues()

values$iterator <- 1

    observeEvent(eventExpr = c(input$packageRefresh,values$iterator),
                 handlerExpr = {
                     values$dfExistingPackages <- dplyr::select(.data = as.data.frame(installed.packages()),
                                                         Package,
                                                         Version,
                                                         License,
                                                         NeedsCompilation,
                                                         Built)
                 }
    )
    
    # Render Data Table
    output$dtExistingPackages <- DT::renderDataTable({values$dfExistingPackages})

    # Function to install the requested package
    {
        
        observeEvent(input$executeInstall,{
            
            install.packages(pkgs = input$packageToInstall)
            
            values$iterator <- values$iterator + 1
            
        }) # close observeEvent
        
    }
    
    # Provide feedback message that the package was installed
    
}) # close shinyServer Function
