library(shiny)
library(datasets)
library(stringr)
library(reshape2)
library(shinyBS)

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output, session) {
    
    skillType <- reactive({
        nocSkillTypes[nocSkillTypes$VM == input$skillSelect,]
    })
    
    skillCops <- reactive({
        skillCopsGroupings <- copsGroupings[copsGroupings$SkillType == skillType()$PV_Code,]
        skillMajors <- levels(as.factor(skillCopsGroupings$Label))
        names(skillMajors) <- skillMajors
        return(skillMajors)
    })
    
    
#     output$skillSelectText <- renderUI({
#         textInput("skillSelectText", "Selected Skill Type", skillType()$PV_Code)
#     })
    
#     cops <- observe({
#         subset(copsGroupings, tolower(copsGroupings$Description) == tolower(str_sub(input$copsSelect, 9)))
#     })

    observe({
#         updateTextInput(session, "copsSelectText", value = input$copsSelect)
        c <- substr(input$copsSelect, 1, 5)
        output$viewSingle <- renderDataTable( 
            subset(aeProjections, aeProjections$COPS.Code == c),
            options = list(paging = FALSE))
        
        ae <- melt(aeProjections)
        ae <- subset(ae, COPS.Code == c)

        output$plot = renderPlot({
            plot(ae$variable, ae$value, xlab="YEAR", ylab="PROJECTED DEMAND (in thousands)", type="l", 
                main="Annual employment projections 2013-2022",
                sub=input$copsSelect)
            abline(h=0)
        })
        
        v <- subset(sAssessFLMC, sAssessFLMC$V1 == c)
        
#         createAlert(session, inputId = "v", alertId="v1",
#                     message=paste("PROJECTED", v$V2, " OF SUPPLY AND DEMAND"),
#                     type = "info")
        output$verdict <- renderText({paste("PROJECTED", v$V2, " OF SUPPLY AND DEMAND")})
        
#         if (v$V2 == "BALANCE") {
#             output$VERDICT <- renderText({"PROJECTED BALANCE OF SUPPLY AND DEMAND"})
#         } else if (verdict$V2 == 'SHORTAGE') {
#             output$verdict <- renderText({"PROJECTED SHORTAGE OF SUPPLY"})
#         } else {
#             output$verdict <- renderText({"PROJECTED SURPLUS OF SUPPLY"})
#         }

    })  
    
    output$copsSelect <- renderUI({
        selectInput("copsSelect", "Occupation:", choices = skillCops(), width = '50%')
    })

#     output$parcoord <- renderPlot({
#         par(mar = c(2, 4, 2, .1))
#         arrests <- USArrests[, -3]
#         plot(c(1, 3), range(as.matrix(arrests)), type = 'n', xaxt = 'n', las = 1,
#              xlab = '', ylab = 'Number of arrests (per 100,000)')
#         matlines(t(arrests), type = 'l', lty = 1, col = 'gray')
#         state <- input$copsSelect
#         
#         if (state != '') {
#             lines(1:3, arrests[state, ], lwd = 2, col = 'red')
#             text(2, arrests[state, 2], state, cex = 2)
#         }
#         axis(1, 1:3, colnames(arrests))
#     })

#     copsSelected <- reactive({
#         nocSkillTypes[nocSkillTypes$VM == input$copsSelect,]
#     })
    
    
    # By declaring datasetInput as a reactive expression we ensure 
    # that:
    #
    #  1) It is only called when the inputs it depends on changes
    #  2) The computation and result are shared by all the callers 
    #      (it only executes a single time)
    #
#     datasetInput <- reactive({
#         switch(input$dataset,
#                "rock" = rock,
#                "pressure" = pressure,
#                "cars" = cars)
#     })
    
    # The output$caption is computed based on a reactive expression
    # that returns input$caption. When the user changes the
    # "caption" field:
    #
    #  1) This function is automatically called to recompute the 
    #     output 
    #  2) The new caption is pushed back to the browser for 
    #     re-display
    # 
    # Note that because the data-oriented reactive expressions
    # below don't depend on input$caption, those expressions are
    # NOT called when input$caption changes.
#     output$caption <- renderText({
#         input$caption
#     })
    
    # The output$summary depends on the datasetInput reactive
    # expression, so will be re-executed whenever datasetInput is
    # invalidated
    # (i.e. whenever the input$dataset changes)
#     output$summary <- renderPrint({
#         dataset <- datasetInput()
#         summary(dataset)
#     })
    
    # The output$view depends on both the databaseInput reactive
    # expression and input$obs, so will be re-executed whenever
    # input$dataset or input$obs is changed. 

    output$view <- renderDataTable( subset(aeProjections, aeProjections$SkillType == skillType()$PV_Code))
})