# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/biological/assessment/VITpaths_combined/reload_VITpaths_combined_table.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.





#
#
#
#
#
#
#
#
#
#
# ------------------------------------------------------------------------------
# Function to reload the values for the selectivity according to the 
# selection of the selectivity function
# ------------------------------------------------------------------------------
#
reload_VITpaths_combined_table <- function(w) {
# if (printOK) if (printOK)   print('Calling function: reload_VITpaths_combined_tablew) {')

    VITpaths_combined_casestudy  <<- NULL
   VITpaths_combined_list <<- list()
VITpaths_combinedIndex <<- 0
add.VITpaths_combined()
 VITpaths_combined.model <<- gtkListStoreNew("gchararray", "gchararray", "gboolean")  
  
    if (!is.null(VITpaths_combineds) ) {  
 for (i in 1:length(VITpaths_combined_list)) {
    iter <-  VITpaths_combined.model$append()$iter
    VITpaths_combined.model$set(iter,0, as.character(VITpaths_combined_list[[i]][[1]]))
   VITpaths_combined.model$set(iter,1, as.character(VITpaths_combined_list[[i]][[2]]))       
     VITpaths_combined.model$set(iter,2,FALSE)
  } 
   }   

VITpaths_combined.treeview$destroy()
# ------------------------------
# create tree view
VITpaths_combined.treeview <<- gtkTreeViewNewWithModel(VITpaths_combined.model)
VITpaths_combined.treeview$setRulesHint(TRUE)
VITpaths_combined.treeview$getSelection()$setMode("single")
VITpaths_combined.add_columns(VITpaths_combined.treeview)
VITpaths_combined.sw$add(VITpaths_combined.treeview) 
 
}
