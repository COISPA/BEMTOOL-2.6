# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/casestudy/casestudy.nostocks/reload_nostocks_table.r'), '\n')
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
reload_nostocks_table <- function(w) {
# if (printOK) if (printOK)   print('Calling function: reload_nostocks_tablew) {')


for (spsp in 1:length(BMT_SPECIES) ) {
    to_add <- data.frame( BMT_SPECIES[spsp])
     colnames(to_add)  <- "Stocks"
    nostockss <<- rbind(nostockss, to_add)
}
    

    nostocks_casestudy  <<- NULL
   nostocks_list <<- list()
nostocksIndex <<- 0
add.nostocks()
 nostocks.model <<- gtkListStoreNew("gchararray", "gboolean")  
  
 for (i in 1:length(nostocks_list)) {
    iter <-  nostocks.model$append()$iter
   nostocks.model$set(iter,0, nostocks_list[[i]])
   # discards.model$set(iter, 1, discards_list[[i]]$month)           
       #  nostocks.model$set(iter, 2, nostocks_list[[i]][3])
     nostocks.model$set(iter,1,TRUE)
  } 

nostocks.treeview$destroy()
nostocks.treeview <<- gtkTreeViewNewWithModel(nostocks.model)
nostocks.treeview$setRulesHint(TRUE)
nostocks.treeview$getSelection()$setMode("single")
nostocks.add_columns(nostocks.treeview)
nostocks.sw$add(nostocks.treeview)   
  
}
