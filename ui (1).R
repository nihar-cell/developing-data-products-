library(shiny)
# ui.R file for the shiny app
# This app was developed to help people choose the best car for their trip

library(markdown)
shinyUI(navbarPage("The Fuel-efficiency ratings of your Dream automobile",
       tabPanel("Home",
       # Sidebar
       sidebarLayout(
               sidebarPanel(
                       helpText("To ensure the best delivery experience, please enter the requested information in the options"),
                       numericInput('dis', 'Distance to road (in miles/gallon):', 10, min = 10, max = 40),
                       numericInput('cost', 'Gasoline Price (US$/gallon):', 2, min = 2, max = 4, step=0.01),
       numericInput('gas', 'Maximum expenditure on gasoline (US$):', 1, min=1, max=1000),
       checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
       sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
       sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
       checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
       ),
       mainPanel(
       dataTableOutput('table')
       )
       )
       ),
       tabPanel("About",
       mainPanel(
       includeMarkdown("about.Rmd")
       )
       )
))   