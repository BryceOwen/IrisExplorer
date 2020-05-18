#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(tidyverse)


shinyUI(fluidPage(

    # Application title
    titlePanel("Exploring the Iris Data"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            selectInput("xvar", "x-variable:", choices=names(iris[,-5])),
            selectInput("yvar", "y-variable:", choices=names(iris[,-5]),selected = names(iris[2])),
            selectInput("dvar", "Distribution of which variable for box plot?", choices=names(iris[,-5]), selected = names(iris[3])),
            
            sliderInput("Sepal.Length", label = "Sepal.Length", min = min(iris$Sepal.Length), max = max(iris$Sepal.Length), 
                        value=c(min(iris$Sepal.Length),max(iris$Sepal.Length))),
            
            sliderInput("Sepal.Width", label = "Sepal.Width", min = min(iris$Sepal.Width), 
                        max = max(iris$Sepal.Width), value = c(min(iris$Sepal.Width),max(iris$Sepal.Width))),
            
            sliderInput("Petal.Length", label = "Petal.Length", min = min(iris$Petal.Length), 
                        max = max(iris$Petal.Length), value = c(min(iris$Petal.Length),max(iris$Petal.Length))),
            
            sliderInput("Petal.Width", label = "Petal.Width", min = min(iris$Petal.Width), 
                        max = max(iris$Petal.Width), value = c(min(iris$Petal.Width),max(iris$Petal.Width)))
            ),

        # Show a plot of the generated distribution
        mainPanel(
            
            dataTableOutput("subsetdata"),
            verbatimTextOutput("summary"),
            plotOutput("scatterplot"),
            plotOutput("boxplot")
            
        )
    )
))
