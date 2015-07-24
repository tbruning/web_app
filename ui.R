library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(    
        
        # Give the page a title
        titlePanel("How Linear Models Can Kill You"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar with one input
            sidebarPanel(
                h4("The Problem"),
                p("You are standing at point 40,0 on the plot on the right and a missle is fired from point 0,0. You are tracking the missle path denoted by ", span("red points", style = "color:red")," starting at point 0,0."),
p("The ", span("blue line", style = "color:blue"), "represents the linear model based on the missle tragectory. It doesn't know the algorithm that is driving the trajectory, only where it has been, and it's last data point."),
p("If you base your survival strategy on extrapolating from the linear model, and not on where it missle is at each interval, you will not survive 41 seconds after launch"),



                    sliderInput(inputId = "n",
                            label = "Number of Seconds:",
                                             min = 5, max = 40, value = 1, step = 5),
helpText("Move slider to change seconds since launch"),
h4("The Moral of the story"),
p("It pays to know the algorithm driving the underlying behavior.")
),
                                 
            mainPanel(
                plotOutput("main_plot")  
            )
            
        )
    )
)