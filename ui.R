install.packages("shiny")
library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Election Polls"),
  
  #Option to give the date
  sidebarLayout(
      sidebarPanel(
        h3("Enter date for election poll result for 10 days"),
               dateInput("startdate", 
                             label = h3("Start Date input"), 
                             value = "2016-03-01")  ,
              submitButton("Submit"))
    ,
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))