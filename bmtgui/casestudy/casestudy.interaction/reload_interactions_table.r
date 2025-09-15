# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/casestudy/casestudy.interaction/reload_interactions_table.r'), '\n')
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
reload_interaction_table <- function(w) {
# if (printOK) if (printOK)   print('Calling function: reload_interaction_tablew) {')

   #  interactions  <<- NULL
   interaction_list <<- list()
interactionIndex <<- 0
if (nrow(interactions) != 0) {
add.interaction()
}

 interaction.model <<- gtkListStoreNew("gchararray", "gchararray", "gboolean")  

 if (length(interaction_list) != 0) {
 for (i in 1:length(interaction_list)) {
    iter <-  interaction.model$append()$iter
   interaction.model$set(iter,0, interaction_list[[i]]$Species)
   interaction.model$set(iter, 1, interaction_list[[i]]$Fleet_Segment)           
     interaction.model$set(iter,2,FALSE)
  } 
}

 interaction.treeview$destroy()
 interaction.treeview <<- gtkTreeViewNewWithModel( interaction.model)
 interaction.treeview$setRulesHint(TRUE)
 interaction.treeview$getSelection()$setMode("GTK_SELECTION_MULTIPLE")
interaction.add_columns( interaction.treeview) 
interaction.sw$add(interaction.treeview)

 
}
