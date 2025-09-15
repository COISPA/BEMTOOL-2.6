# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/biological/deactivate_bio_items.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.


deactivate_RPs_externalfile<- function(w) {
# if (printOK) if (printOK)   print('Calling function: deactivate_RPs_externalfilew) {')

  if ( gtkToggleButtonGetActive(bmt_chk_RP_ALADYM_use) ) {
          gtkWidgetSetSensitive(btn_browse_externalRPs,F) 
           gtkWidgetSetSensitive(lbl_browse_externalRPs, F)
              gtkWidgetSetSensitive(lbl_bio_externalRP, F)  
  }   else {
     gtkWidgetSetSensitive(btn_browse_externalRPs, T) 
         gtkWidgetSetSensitive(lbl_browse_externalRPs, T) 
            gtkWidgetSetSensitive(lbl_bio_externalRP, T) 
  }

}


# if (printOK)   print('Calling function: deactivate_ALADYM_itemsw) {')
deactivate_ALADYM_items<- function(w) {

  if ( gtkToggleButtonGetActive(bmt_chk_runALADYM) ) {
          gtkWidgetSetSensitive(entry_biosettings_avg_years, T) 
              gtkWidgetSetSensitive(lbl_biosettings_avg_years, T)
           gtkWidgetSetSensitive(bmt_chk_RP_ALADYM_use, T) 
            gtkWidgetSetSensitive(bmt_chk_RP_ALADYM_calc, T)             
  }   else {
         gtkWidgetSetSensitive(entry_biosettings_avg_years, F)
           gtkWidgetSetSensitive(lbl_biosettings_avg_years, F) 
           gtkWidgetSetSensitive(bmt_chk_RP_ALADYM_use, F) 
            gtkWidgetSetSensitive(bmt_chk_RP_ALADYM_calc, F) 
  }

}

# if (printOK)   print('Calling function: activate_MalesFemalesVIT_itemsw) {')

activate_MalesFemalesVIT_items<- function(w) {

  if ( ! gtkToggleButtonGetActive(bmt_chk_assessment_sex_VIT) ) {
    gtkWidgetSetSensitive(radio_combined, T)
       gtkToggleButtonSetActive(radio_combined, T)
          gtkWidgetSetSensitive(radio_males, F) 
           gtkWidgetSetSensitive(radio_females, F)  
        gtkWidgetSetSensitive( VITpaths_females.sw, F) 
        gtkWidgetSetSensitive( VITpaths_males.sw, F) 
        gtkWidgetSetSensitive( VITpaths_combined.sw, T) 
  } else {
   gtkToggleButtonSetActive(radio_males, T)
           gtkWidgetSetSensitive(radio_combined, F)
       gtkToggleButtonSetActive(radio_combined, F)
          gtkWidgetSetSensitive(radio_males, T) 
           gtkWidgetSetSensitive(radio_females, T)
                   gtkWidgetSetSensitive( VITpaths_females.sw, T) 
        gtkWidgetSetSensitive( VITpaths_males.sw, T) 
        gtkWidgetSetSensitive( VITpaths_combined.sw, F)  
  }

}
