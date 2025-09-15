# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/src/utils/iscorrect_answer.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.





iscorrect_answer<-function(question, answer)  { 
# if (printOK) if (printOK)   print('Calling function: iscorrect_answerquestion, answer)  { ')
    
    if (question == "NEW_SCENARIO" | question == "MCDA" ) {
    if (as.character(answer) %in% c("Y","y","N","n")) {
        return(TRUE)
    } else {
        return(FALSE)
    }   
    } 
     
}
