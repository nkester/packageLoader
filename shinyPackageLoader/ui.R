# Maintainer: Neil Kester
# Purpose: This simple shiny application allows users to see packages installed 
#  and accessible to the shiny-server user (normally 'shiny').
#
# Repository: https://github.com/nkester/Thesis-Containers


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Shiny Package Loader"),
    
    # Show a plot of the generated distribution
    mainPanel(
        
        hr(),
        
        fluidRow(
            
            h4('Session Information:'),
            
            column(width = 4,
                   
                   shiny::textOutput('txRVersion')
                   
            )
            
        ), # close fluidRow
        
        hr(),
        
        fluidRow(
            
            column(width = 9,
                   
                   h3('Existing Packages:'),
                   
                   DT::dataTableOutput('dtExistingPackages'),
                   
                   shiny::actionButton(inputId = 'packageRefresh',
                                       label = 'Refresh')
                   
            ), # close column
            
            column(width = 3,
                   
                   wellPanel(
                       
                       h3('Add New Packages:'),
                       
                       shiny::textInput(inputId = 'packageToInstall',
                                        label = 'Package To Install:',
                                        placeholder = 'dplyr'),
                       
                       shiny::actionButton(inputId = 'executeInstall',
                                           label = 'Install')
                       
                   ) # close wellPanel
                   
            ) # close column
            
        ) # close fluidRow
        
        
    ) # close mainPanel
    
) # close fluidPage
) # close ShinyUI
