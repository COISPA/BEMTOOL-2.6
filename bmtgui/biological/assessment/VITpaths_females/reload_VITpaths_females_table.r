# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/biological/assessment/VITpaths_females/reload_VITpaths_females_table.r'), '\n')
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
reload_VITpaths_females_table <- function(w) {
# if (printOK) if (printOK)   print('Calling function: reload_VITpaths_females_tablew) {')

    VITpaths_females_casestudy  <<- NULL
   VITpaths_females_list <<- list()
VITpaths_femalesIndex <<- 0
add.VITpaths_females()
 VITpaths_females.model <<- gtkListStoreNew("gchararray", "gchararray", "gboolean")  
  
    if (!is.null(VITpaths_femaless) ) {  
 for (i in 1:length(VITpaths_females_list)) {
    iter <-  VITpaths_females.model$append()$iter
    VITpaths_females.model$set(iter,0, as.character(VITpaths_females_list[[i]][[1]]))
   VITpaths_females.model$set(iter,1, as.character(VITpaths_females_list[[i]][[2]]))       
     VITpaths_females.model$set(iter,2,FALSE)
  } 
   }   

VITpaths_females.treeview$destroy()
# ------------------------------
# create tree view
VITpaths_females.treeview <<- gtkTreeViewNewWithModel(VITpaths_females.model)
VITpaths_females.treeview$setRulesHint(TRUE)
VITpaths_females.treeview$getSelection()$setMode("single")
VITpaths_females.add_columns(VITpaths_females.treeview)
VITpaths_females.sw$add(VITpaths_females.treeview) 
 
}
