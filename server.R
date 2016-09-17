install.packages("httr")
install.packages("pollstR")

library(shiny)
library(httr)
library("pollstR")
library("gdata")
library(ggplot2)
library(doBy)


shinyServer(function(input, output) {
  

  output$distPlot <- renderPlot({
  
    slug <- "obama-job-approval"
    
    start_date <- as.Date(input$startdate)
    end_date <- as.Date(input$startdate+11)
    
    chart <- pollstr_chart(slug)
    
    polls <- pollstr_polls(chart = slug, 
                           after = start_date, 
                           before = end_date,
                           max_pages = 1000000)
    
    
    questions <-
      subset(polls[["questions"]], question == "2016 National Presidential General Election")
    
    questions1=(summaryBy(observations~choice+value,data=questions))
    questions1$choice[questions1$choice=="Wouldn't vote"] <- "Wouldn't Vote"
    ggplot(questions1, aes(x=choice, y=value, fill=choice)) + geom_bar(stat="identity")
    
    
  })
})