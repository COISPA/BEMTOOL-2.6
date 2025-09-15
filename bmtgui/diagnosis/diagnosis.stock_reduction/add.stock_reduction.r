# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/diagnosis/diagnosis.stock_reduction/add.stock_reduction.r'), '\n')
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
# add elements to the list of the p production values
# ------------------------------------------------------------------------------
#
add.stock_reduction <- function() {
#print("Adding elements to the list...")   

  if (!is.null(bmt_stock_reduction)) {
    for (r in 1:nrow(bmt_stock_reduction)) {
        reduction_temp <- as.list(bmt_stock_reduction[r,]) 
        names(reduction_temp) <- c("Stock",	"% needed reduction (last year)",	"Fcurrent",	"Reference point",	"SSBcurrent",	"SSBref",	"Comments")
        stock_reduction_list <<- c(stock_reduction_list, list(reduction_temp)) 
    }
   } else {
 reduction_matrix <- data.frame(matrix("", nrow=length(BMT_SPECIES), ncol=7))
   colnames(reduction_matrix) <- c("Stock",	"% needed reduction (last year)",	"Fcurrent",	"Reference point",	"SSBcurrent",	"SSBref",	"Comments")
      reduction_matrix$Stock <- BMT_SPECIES
  bmt_stock_reduction <<- reduction_matrix   
 }
#print("stock_reduction (simulation) list successfully updated!", quote=F)
}
