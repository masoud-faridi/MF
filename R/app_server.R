#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  #messageModule = callModule(mod_msg_message_dropdownMenu_server, 'messageUI')
  notificationModule = callModule(notificationServer, 'notificationUI')
  messageModule = callModule(messageServer, 'messageUI')
  taskItemModule = callModule(taskItemServer, 'taskItemUI')

  mod_module_1_1_server("module_1_1_1",
                        notificationModule
                        ,messageModule
                        ,taskItemModule
                        )
  #reactive()
  #messageModule$push_message(messageItem(sprintf('Tab 1: Pushed a message at %s', Sys.time())))


}
