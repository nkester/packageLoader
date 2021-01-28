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
            h2('This will show a DT of installed packages'),
            DT::dataTableOutput('dtExistingPackages'),
            shiny::actionButton(inputId = 'packageRefresh',
                                label = 'Refresh'),
            br(),
            h3('This will provide the ability to add a new package'),
            shiny::textInput(inputId = 'packageToInstall',
                             label = 'Package To Install:',
                             placeholder = 'dplyr'),
            shiny::actionButton(inputId = 'executeInstall',
                                label = 'Install')
        )
    
))
