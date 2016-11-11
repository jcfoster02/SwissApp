library(shiny)
library(dplyr)
library(ggplot2)
data(swiss)
swiss = mutate(swiss, Catholic=1* (Catholic>50))

shinyServer(function(input, output) {
    
    output$plot1 <- renderPlot({
        
        g <- ggplot(swiss, aes(x = Education, y = Fertility, colour = factor(Catholic)))
        g = g  + geom_point(size = 2)
        g = g + xlab("Education") + ylab("Fertility")
        g
        
        fit1 = lm(Fertility ~ Education, data=swiss)
        fit2 = lm(Fertility ~ Education + factor(Catholic), data = swiss)
        fit3 = lm(Fertility ~ Education * factor(Catholic), data = swiss)
        
        if(input$lm1) {
            g = g + geom_abline(intercept = coef(fit1)[1], slope = coef(fit1)[2])
            print(g)
        }
        
        if(input$lm2) {
        g = g + geom_abline(intercept = coef(fit2)[1] + coef(fit2)[3], slope = coef(fit2)[2], col = "pink3", size=1)
            print(g)
        }
        
        if(input$lm3) {
        g = g + geom_abline(intercept = coef(fit3)[1] + coef(fit3)[3], 
                            slope = coef(fit3)[2] + coef(fit3)[4], col="deepskyblue", size = 1)
            print(g)
        }
            
    })
    
})