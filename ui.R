library(shiny)

shinyUI(navbarPage(
    titlePanel(""), 
    tabPanel("BMI Calculation", 
    sidebarPanel(
        h3("Calculate your BMI"),
        selectInput("unit","Units", choices = c("Metric", "Imperial")), 
        numericInput("height", "Height (m or in)", value = 1.72), 
        numericInput("weight", "Weight (kg or lb)", value = 58), 
        submitButton("Calculate")
    ), 
    
    mainPanel(
       h5("This web app calculates Body Mass Index (BMI) from entered height and weight.
          Please select the unit you are going to use with the drop-down list on the left-hand 
          side. If \"Metric\" is selected, please enter the height in metres (m) and weight in
          kilograms (kg). If \"Imperial\" is selected, please enter the height in inches(in) and
          weight in pounds (lb). After you press the \"Calculate\" button, the BMI will be
          calculated and printed below along with the interpretation of whether you are
          within the normal weight range. Have fun :)"), 
       h4(textOutput("n_result")), 
       h4(textOutput("t_result"))
    )),
    tabPanel("Information about BMI", 
             h3("Body Mass Index (BMI)"), 
             h5("The BMI is a value derived from the body mass (aka weight) and the height of an
                #individual. It is defined as the weight in kilograms devided by square of height 
                #in metres; therefore, the universal unit is kg/m^2. "), 
             h5("It is widely accepted that 18.5 to 25 kg/m^2 is the normal weight range, also
                #known as the health weight range. A more detailed categories are listed below. 
                #These range of BMI values are valid only as statistical categories. (Wikipedia)"), 
             tableOutput("BMI_cat")),
    absolutePanel(h6("Reference: formula used in the application is taken from \"How to Calculate your BMI\" (thecalculatorsite.com)
          and the commonly accepted BMI ranges is taken from Wikipedia (wikipedia.org)."),
                  bottom = 5)
))
