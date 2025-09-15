# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/mcda/runMCDA_bmt_action.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.



runMCDA_bmt_action <- function(w) {
# if (printOK) if (printOK)   print('Calling function: runMCDA_bmt_actionw) {')

gtkWidgetSetSensitive(BMTmain_window, FALSE)
wnd <- showMessage("        MCDA in progress...        ")

                                #paste(getwd(), "/src/mcda/Weights.csv", sep="")
write.table(MCDAweight_table, file= paste(getwd(), "/src/mcda/Weights.csv", sep=""), sep=";", row.names=F )

MCDAutility_table$Value[16] <- ifelse(MCDAutility_table$Value[16] ==1, "GVA", ifelse(MCDAutility_table$Value[16] ==2, "ROI", "PROFITS"))

write.table(MCDAutility_table, paste(getwd(), "/src/mcda/Utility_params.csv", sep=""), sep=";", row.names=F)


Run_MCDA()

wnd$destroy()   
gtkWidgetSetSensitive(BMTmain_window, TRUE)
wnd <- showMessageOK("        MCDA completed!        ")

}
