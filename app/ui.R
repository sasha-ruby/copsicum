# Define UI for dataset viewer application
# copsLabels <- levels(as.factor(copsGroupings$Label))
# names(copsLabels) <- copsLabels

shinyUI(fluidPage(
    
    # Application title
#     titlePanel("Reactivity"),
    
    # Sidebar with controls to provide a caption, select a dataset,
    # and specify the number of observations to view. Note that
    # changes made to the caption in the textInput control are
    # updated in the output area immediately as you type
    sidebarLayout(
        sidebarPanel(
            selectInput("skillSelect", "Skill type:", choices = skillTypes, width = '100%')
#             uiOutput("skillSelectText"),
#             uiOutput("majorSelect"),
#             uiOutput("copsSelect")
#             textInput("copsSelectText", "Suggestion 1:", value="")
        ),
        
        
        # Show the caption, a summary of the dataset and an HTML 
        # table with the requested number of observations
        mainPanel(
#             h3(textOutput("caption", container = span)),
#             
#             verbatimTextOutput("summary"), 
#
            
            tabsetPanel(
                tabPanel("Individual COPS Projection",
                         uiOutput("copsSelect"),
#                          bsAlert(inputId="v"),
                         uiOutput("verdict"),
                         plotOutput("plot"),
                         dataTableOutput("viewSingle")
                ),
                tabPanel("Projection by Skill Type",
                         
                         dataTableOutput("view")
                )
            )
#             dataTableOutput("viewSingle"),
#             plotOutput("plot"),
#             dataTableOutput("view")
        )
    )
))