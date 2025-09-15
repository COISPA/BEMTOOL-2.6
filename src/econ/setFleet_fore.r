# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/src/econ/setFleet_fore.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.





# runEcon.r - Bemtool economic indicators in the simulation period
# Author: Paolo Accadia

setFleet_fore<- function(Fyear) {
# if (printOK) if (printOK)   print('Calling function: setFleet_foreFyear) {')

 # Fyear = Fleetyear



for (y_int in 1:foreperiod) {
    for (m in 1:m_stock) {
        Fyear[[simperiod+y_int]]@import.weight[m] <- convert_numeric0_to_na(as.numeric(as.character(pmat4[[m,y_int]])))
    }
    for (n_int in 1:n_fleet) {
        Fyear[[simperiod+y_int]]@fleetsegments[[n_int]]@fuel.price <- convert_numeric0_to_na(as.numeric(as.character(vcvec[[y_int]])))
        Fyear[[simperiod+y_int]]@fleetsegments[[n_int]]@other.income <- convert_numeric0_to_na(as.numeric(as.character(tsmat1[[n_int,y_int]])))
        Fyear[[simperiod+y_int]]@fleetsegments[[n_int]]@taxes <- convert_numeric0_to_na(as.numeric(as.character(tsmat2[[n_int,y_int]])))
        Fyear[[simperiod+y_int]]@fleetsegments[[n_int]]@new.equipment.costs <- convert_numeric0_to_na(as.numeric(as.character(tsmat3[[n_int,y_int]])))
    } 
}  


return(Fyear)
}
    
