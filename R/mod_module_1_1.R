#' module_1_1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#'
#' @import plotly
#'
#' @import DT
#'
#' @import shinydashboard
#'
#' @import shinyalert
mod_module_1_1_ui <- function(id){
  ns <- NS(id)
  #shinydashboardPlus::box(class ="shinydashboardPlusbox",
  shinydashboardPlusbox_MF(
    title = h1('\u0639\u0646\u0648\u0627\u0646'
                       ,class ="h1t2"
    ),
    closable = TRUE,
    width = 12,
    height = "500px",
    solidHeader = FALSE,
    collapsible = TRUE,
    #actionButton("update", "Toggle card sidebar"),
    sidebar = shinydashboardPlus::boxSidebar(
      id = ns("mycardsidebar"),
      width = 25

      ,sliderInput(
        ns("settings_line_size"),
        "line size(plot):",
        min = 0,
        max = 10,
        value = 4,step =0.25
      ),
      sliderInput(
        ns("settings_marker_size"),
        "marker size(plot):",
        min = 1,
        max = 15,
        value = 4,step =0.25
      )
    )
    ,actionButton(ns('send_message'), 'Send a message')
    ,actionButton(ns('delete_message'), 'Delete a message')
    ,actionButton(ns('show_message'), 'Show a message')
    ,actionButton(ns('show_message2'), 'Show a message')
    ,actionButton(ns('show_message3'), 'Show a message (input)')

    ,actionButton(ns('show_message4'), 'Show a message')
    ,actionButton(ns('show_message5'), 'Confirme')
    ,actionButton(ns('show_message6'), 'Confirme with timer')
    ,verbatimTextOutput(ns("vto"))
    ,plotlyOutput(ns("plotly_Output"))
    ,DTOutput(ns("dt_table"))

  )

}

#' module_1_1 Server Functions
#'
#' @noRd
mod_module_1_1_server <- function(id, notificationModule,messageModule,taskItemModule
                                  ){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(input$send_message, {
      notificationModule$push_notification(notificationItem(sprintf('Tab2: Pushed a notification at %s', Sys.time())))
      messageModule$push_message(messageItem(
        from="from admin"
        ,message=sprintf('Tab 1: Pushed a message at %s', Sys.time())

        ))
      taskItemModule$push_taskItem(
        taskItem(value = 90, color = "green", sprintf('Tab 1: Pushed a message at %s', Sys.time())
                 ))
    })


    observeEvent(input$delete_message, {
      notificationModule$pop_notification()
      taskItemModule$pop_taskItem()
      messageModule$pop_message()
    })

    observeEvent(input$show_message, {
      showModal(modalDialog(
              title = "suc",
              paste0("It seems the data has inserted successfully"),
              easyClose = TRUE,
              footer = NULL
            ))
    })


    observeEvent(input$show_message2, {
      shinyalert("Oops!", "Something went wrong.", type = "error")
    })

    observeEvent(input$show_message3, {
      shinyalert("Oops!", "Something went wrong.", type = "input"
                 ,callbackR=function(x){  output$vto <- renderPrint({ x })   }
                 )

    })

    observeEvent(input$show_message4, {
      showNotification(
        "showNotification",
        duration = 3,
        closeButton = TRUE,
        type ="warning" #c("default", "message", "warning", "error")
      )
    })

    observeEvent(input$show_message5, {
      shinyalert("Oops!", "Something went wrong.",

                 showCancelButton = TRUE,
                 showConfirmButton = TRUE,
                 confirmButtonText = "OK",
                 confirmButtonCol = "#AEDEF4",
                 cancelButtonText = "Cancel"
                 ,callbackR=function(x){  output$vto <- renderPrint({ x })   }
      )

    })

    observeEvent(input$show_message6, {
      shinyalert("Oops!", "confirm with timer.",
                 timer=2500,
                 showCancelButton = TRUE,
                 showConfirmButton = TRUE,
                 confirmButtonText = "OK",
                 confirmButtonCol = "#AEDEF4",
                 cancelButtonText = "Cancel"
                 ,callbackR=function(x){  output$vto <- renderPrint({ x })   }
      )

    })



  })
}

## To be copied in the UI
# mod_module_1_1_ui("module_1_1_1")

## To be copied in the server
# mod_module_1_1_server("module_1_1_1")


