ui_global_variable<-list()


# menuItem
# menuSubItem 1
ui_global_variable$mI_1_0<-list(name="\u06af\u0632\u0627\u0631\u0634 \u06af\u06cc\u0631\u06cc",ID=NULL,name_en="EDA")
ui_global_variable$mI_1_0_2<-list(name="\u062f\u06cc\u062a\u0627\u0628\u06cc\u0633",ID=NULL,name_en="Database")
ui_global_variable$mI_1_1<-list(name="\u0645\u0634\u0627\u0647\u062f\u0647 \u062c\u062f\u0627\u0648\u0644",ID="mI_1_1",name_en="View Tables")
ui_global_variable$mI_1_2<-list(name="\u0645\u0634\u0627\u0647\u062f\u0647 \u0646\u0645\u0648\u062f\u0627\u0631",ID="mI_1_2",name_en="View plots")






class_convert<-function(fn){

  inner <- function(...){
    return(fn(class='shinydashboardPlusbox',...))
  }
  return(inner)

}
shinydashboardPlusbox_MF<-class_convert(shinydashboardPlus::box)



#########################################
############# timeout ###################
########################################

timeoutSeconds <- 5

inactivity <- sprintf("function idleTimer() {
var t = setTimeout(logout, %s);
window.onmousemove = resetTimer; // catches mouse movements
window.onmousedown = resetTimer; // catches mouse movements
window.onclick = resetTimer;     // catches mouse clicks
window.onscroll = resetTimer;    // catches scrolling
window.onkeypress = resetTimer;  //catches keyboard actions
function logout() {
Shiny.setInputValue('timeOut', '%ss')
}
function resetTimer() {
clearTimeout(t);
t = setTimeout(logout, %s);  // time is in milliseconds (1000 is 1 second)
}
}
idleTimer();", timeoutSeconds*1000, timeoutSeconds, timeoutSeconds*1000)

#######################################
