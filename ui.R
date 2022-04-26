#ui.R
library(shiny)
library(rsconnect)
rsconnect::setAccountInfo(name='edaprojectmrse',
                          token='4E12DE65CEC43BEE6CCA5D8060368B34',
                          secret='EnhRwAVsCxxXFJJP1h45JedlfOoDaO+ZaRWWsuv2')
rsconnect::deployApp('C:/Users/dheer/OneDrive/Desktop/movieRec-master')

genre_list <- c("Action", "Adventure", "Animation", "Children", 
                "Comedy", "Crime","Documentary", "Drama", "Fantasy",
                "Film.Noir", "Horror", "Musical", "Mystery","Romance",
                "Sci.Fi", "Thriller", "War", "Western")

shinyUI(fluidPage(
  titlePanel("Movie Recommendation System"),
  fluidRow(
    
    column(4, h3("Select Movie Genres You Prefer (order matters):"),
           wellPanel(
      selectInput("input_genre", "Genre #1",
                  genre_list),
      selectInput("input_genre2", "Genre #2",
                  genre_list),
      selectInput("input_genre3", "Genre #3",
                  genre_list)
      #submitButton("Update List of Movies")
    )),
    
    column(4, h3("Select Movies You Like of these Genres:"),
           wellPanel(
      # This outputs the dynamic UI component
      uiOutput("ui"),
      uiOutput("ui2"),
      uiOutput("ui3")
      #submitButton("Get Recommendations")
    )),
    
    column(4,
           h3("You Might Like The Following Movies Too!"),
           tableOutput("table")
           #verbatimTextOutput("dynamic_value")
    )
  ),
  
  fluidRow(
    column(12,
           helpText("For a detailed description of this project please visit", 
                    a("the link", href="http://rpubs.com/jeknov/movieRec", target="_blank")),
           helpText("For a code, press", a("here", href = "https://github.com/jeknov/movieRec", target="_blank"))

    )
  )
))