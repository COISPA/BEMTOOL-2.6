# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/diagnosis/show_species_pressure_indicator.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.




show_species_pressure_indicator<-function(w) {
# if (printOK) if (printOK)   print('Calling function: show_species_pressure_indicatorw) {')
    
  index_to_load = -1
  selected <- gtkComboBoxGetActiveText(bmt_diagnosis_species_pressure)
 # print(paste("selected:",selected))

  if (is_variable_ok(selected)) {
  index_to_update <- which(BMT_SPECIES == selected)    
  
 pressure_indicator_path <- paste(mat_cfg_general[1,3],  "/Diagnosis/Biological Pressure Impact/", mat_cfg_general[1,2], " - Fishing Mortality ", selected,".jpg", sep="")   
img_pressure_indicator_pb <- try(gdkPixbufNewFromFileTrim(pressure_indicator_path), silent = TRUE)

try(

  if (!inherits(img_pressure_indicator_pb,'try-error')) {
    
    # img_pressure_indicator_resized <- gdkPixbufScaleSimple(img_yield_pb, 300, 300, "bilinear")
    img_pressure_indicator <- gtkImageNewFromPixbuf(img_pressure_indicator_pb)
  
Fmort_sw$destroy()
Fmort_sw <<- gtkScrolledWindowNew(NULL, NULL)
Fmort_sw$setShadowType("etched-in")
Fmort_sw$setPolicy("automatic", "automatic")
Fmort_sw$SetUsize(350, 350)  

# img_pressure_indicator <- gtkImageNewFromPixbuf(img_pressure_indicator_pb[[1]])   
Fmort_sw$add(img_pressure_indicator)
vbox_Fspecies$packStart(Fmort_sw, expand = T, fill = T, padding = 10) 
#gtkBoxReorderChild(vbox_Fspecies, hbox_diagnosis_Fspecies_combo, 1)
#gtkBoxReorderChild(vbox_Fspecies, hbox_diagnosis_Fspecies_combo, 1)
#gtkBoxReorderChild(vbox_Fspecies, Fmort_sw, 2)
#gtkBoxReorderChild(vbox_Fspecies, lbl_Fishing_perc, 3)
#gtkBoxReorderChild(vbox_Fspecies, bmt_fishingmortality.sw , 4)

}
,silent=T)

                                                                                     # GSA 18 - Percentage F by fleet - M. barbatus.csv
bmt_fishing_mort_path <- paste(mat_cfg_general[1,3],  "/Diagnosis/Biological Pressure Impact/", mat_cfg_general[1,2], " - Percentage F by fleet - ", selected, ".csv", sep="")
bmt_fishingmortality <<- try(data.frame(read.csv( file=bmt_fishing_mort_path, sep=";"),stringsAsFactors =F) )

if (class(bmt_fishingmortality) == "try-error") {
    bmt_fishingmortality <<- NULL
} 

names_of_fleets <- mat_cfg_SF[index_to_update,2:ncol(mat_cfg_SF)]
colnames(bmt_fishingmortality) <- c("Year", paste("% F to", names_of_fleets[names_of_fleets != "-" & names_of_fleets != "" ]))

# # --------------------------- stock reduction table
 index_to_load = -1
  selected_percentage_to_load <<- gtkComboBoxGetActiveText(bmt_diagnosis_species_pressure)
  index_to_update_percentage <<- which(BMT_SPECIES == selected_percentage_to_load)    
names_of_fleets <<- mat_cfg_SF[index_to_update_percentage,2:ncol(mat_cfg_SF)]
 
suppressWarnings(source(paste(getwd(), "/bmtgui/diagnosis/diagnosis.fishingmortality/bmt_reload_bmt_fishingmortality_table.r", sep=""))  )

}

}
