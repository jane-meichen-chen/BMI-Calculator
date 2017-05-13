library(shiny)

shinyServer(function(input, output) {
    bmi <- reactive({
        if (input$unit == "Metric") input$weight / (input$height^2) 
        else input$weight / (input$height^2) * 703
    })
    
    result <- reactive ({
        if(bmi() < 18.5) "Underweight"
        else if (bmi() > 18.5 & bmi() < 25) "Normal Weight"
        else if (bmi() > 25 & bmi() < 30) "Overweight"
        else if (bmi() > 30) "Obese"
    })
    
    output$n_result <- renderText(paste("BMI: ", round(bmi(), digits = 1)))
    output$t_result <- renderText(result())
    
    category <- c("Very Severely Underweight", "Severely Underweight", "Underweight", 
             "Normal (Healthy) Weight", "Overweight", "Obese Class I (Moderately Obese)",
             "Obese Class II (Severly Obese)", "Obese Class III (Very Severely Obese)")
    from <- c("", 15, 16, 18.5, 25, 30, 35, 40)
    to <- c(15, 16, 18.5, 25, 30, 35, 40, "")
    cat_df <- data.frame(category, from, to)
    output$BMI_cat <- renderTable(cat_df, striped = TRUE, hover = TRUE)
})