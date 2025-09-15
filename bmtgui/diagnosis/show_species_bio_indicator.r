# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/diagnosis/show_species_bio_indicator.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.




show_species_bio_indicator<-function(w) {
# if (printOK) if (printOK)   print('Calling function: show_species_bio_indicatorw) {')
    
  index_to_load = -1
  selected <- gtkComboBoxGetActiveText(bmt_diagnosis_species)
  
  if(!is_variable_ok("selected")){
    selected="ALL"
    
  }
  
  index_to_update <- which(BMT_SPECIES == selected)    
  
      
  index_to_load_indic = -1
  selected_indic <- gtkComboBoxGetActiveText(bmt_diagnosis_species_bio_indicator)
  
  index_to_update_indic <- which(BIOINDICATORS == selected_indic)   
   
 bio_indicator_path <- paste(mat_cfg_general[1,3],  "/Diagnosis/Biological Pressure Impact/", mat_cfg_general[1,2], " - ", selected_indic," - ", selected, ".jpg", sep="")   
img_bio_indicator_pb <<- try(gdkPixbufNewFromFileTrim(bio_indicator_path), silent = TRUE)

try(

  if (!inherits(img_bio_indicator_pb,'try-error')) {
    
    img_bio_indicator_resized <- gdkPixbufScaleSimple(img_bio_indicator_pb, 300, 300, "bilinear")
    img_bio_indicator <- gtkImageNewFromPixbuf(img_bio_indicator_resized)
    
  
bi_sw$destroy()
bi_sw <<- gtkScrolledWindowNew(NULL, NULL)
bi_sw$setShadowType("etched-in")
bi_sw$setPolicy("automatic", "automatic")
bi_sw$SetUsize(400, 400)  


bi_sw$add(img_bio_indicator)
vbox_indic$packStart(bi_sw, expand = T, fill = T, padding = 10)  
}

,silent=T)
}
