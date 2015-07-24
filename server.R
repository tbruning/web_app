library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
shinyServer(function(input, output) {
    
    # Fill in the spot we created for a plot
    output$main_plot <- renderPlot({
        require(ggplot2)
        x <- input$n
        h <- vector()
        height <- matrix(nrow = x, ncol = 2)
        for( i in 1:x) {
            h[i] <- 100 + (200 * i)  - (5 * i^2);
            height[i,2] <- h[i]
            height[i,1] <- i
        }
        height_df <- as.data.frame(height)
        colnames(height_df) <- c("secs", "height")
        p1 <- ggplot(height_df, aes(secs, height)) + geom_point(aes(colour = "red", size = 2)) + theme(legend.position="none") + xlim(0, 40)
        if(x == 40) {
            p1 <- p1  + geom_text(x=38, y=100, label="Boom", colour = "red")
            }
        p1 <- p1 + geom_smooth( method = "lm")
        p1
    })
})