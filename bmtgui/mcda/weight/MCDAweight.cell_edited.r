# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/mcda/weight/MCDAweight.cell_edited.r'), '\n')
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
# ------------------------------------------------------------------------------
# Function for the editing of the cells
# ------------------------------------------------------------------------------
#
MCDAweight.cell_edited <- function(cell, path.string, new.text, data) {
  #checkPtrType(data, "behav_actkListStore")
  if (is.na(as.double(new.text) )) {
      showError("MCDA weight must be a number!")
 } else {
 MCDAweight.model <- data 
  path <- gtkTreePathNewFromString(path.string)
  print(paste("MCDAweight Edited row:", (as.numeric(path.string)+1)))
  column <- as.integer(cell$getData("column"))
  print(paste("MCDAweight Edited column:", column))
  iter <- MCDAweight.model$getIter(path)$iter
   #print(paste("new text:", new.text))
  	i <- path$getIndices()[[1]]+1
  	#print(paste("indice i:", i))
  #	print(pproductions[[i]])
  	MCDAweight_list[[i]][column+1] <<- as.double(new.text)           # [column+1]
  #	print(paste("indice column:", column+1))
  #	print(pproductions[[i]][column+1])
  	MCDAweight.model$set(iter, column, MCDAweight_list[[i]][column+1])

         for (r in 1:length(MCDAweight_list)) {
  MCDAweight_table[r,] <<- convert_numeric0_to_na(as.numeric(as.character(convert_numeric0_to_na(MCDAweight_list[[r]]))))
  }

}
}
