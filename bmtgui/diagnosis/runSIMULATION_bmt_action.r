# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/diagnosis/runSIMULATION_bmt_action.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.



runSIMULATION_bmt_action <- function(w) {
# if (printOK) if (printOK)   print('Calling function: runSIMULATION_bmt_actionw) {')

#bmt_wnd_sim <<- showMessage("SIMULATION in progress...")
#gtkWidgetSetSensitive(BMTmain_window, F)
 FINAL_BMTCFG <- saveBMTCFG()
# print(FINAL_BMTCFG)
 write.table(FINAL_BMTCFG, paste(getwd(), "/bmtconfig.csv", sep=""), sep=";", row.names=F, col.names=F)
 
 this_path <- paste(mat_cfg_general[1,3],  "/bmtconfig - ", mat_cfg_general[1,2], ".csv", sep="")  
 write.table(FINAL_BMTCFG, this_path, sep=";", row.names=F, col.names=F)
 
print("bmtconfig.csv saved!", quote=F)

go_on_bmt_sim <- check_bmt_simulation_economic_ts()

source(paste(getwd(), "/src/runBEMTOOL.r", sep=""))

}
