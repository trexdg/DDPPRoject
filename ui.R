library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Developing Data Products Course Project"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    selectInput("make", "Choose a car make:", 
                choices = c("Mazda", "Datsun", "Hornet","Valiant","Duster","Merc","Cadillac","Lincoln","Chrysler","Fiat","Honda","Toyota","Dodge","AMC","Camaro","Pontiac","Porsche","Lotus","Ford","Ferrari","Maserati","Volvo")),
    
    selectInput("feature", "Choose a car feature:", 
                choices = c("qsec","mpg", "cyl", "disp","hp","drat","wt","vs","am","gear","carb"))
    
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    verbatimTextOutput("make"),
    
    verbatimTextOutput("feature"),
    
    verbatimTextOutput("tabletext"),
    
    tableOutput("view"),
    
    verbatimTextOutput("mean")
  )
))