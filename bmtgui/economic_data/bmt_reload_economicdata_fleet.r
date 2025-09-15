# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/economic_data/bmt_reload_economicdata_fleet.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.





bmt_reload_economicdata_fleet<-function(w) {
# if (printOK) if (printOK)   print('Calling function: bmt_reload_economicdata_fleetw) {')
 #print(".......................................... [fisheryFun.r] --> reload_fleetsegment_info()", quote=F)
  index_to_load = -1
  selected <- gtkComboBoxGetActiveText(bmt_economicdata_fleet_combo)
  
  index_to_update <- which(BMT_FLEETSEGMENTS == selected)
  
if (!is.null(selected)) {
bmt_economic.COSTS <<- data.frame(ECONOMICDATA_COSTS_list[[index_to_update]],  stringsAsFactors = F)
bmt_economic.REVENUES <<- data.frame(ECONOMICDATA_REVENUES_list[[index_to_update]] ,  stringsAsFactors = F)
bmt_economic.REVENUES_discard <<- data.frame(ECONOMICDATA_REVENUES_discard_list[[index_to_update]] ,  stringsAsFactors = F)
bmt_economic.OTHERS <<- data.frame(ECONOMICDATA_OTHERS_list[[index_to_update]] ,  stringsAsFactors = F)

bmt_reload_COSTS_table()
bmt_reload_REVENUES_table()
bmt_reload_REVENUES_discard_table()
bmt_reload_OTHERS_table()
 } 
 
} 
