# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/diagnosis/show_fleet_economic_indicator.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.




show_fleet_economic_indicator<-function(w) {
# if (printOK) if (printOK)   print('Calling function: show_fleet_economic_indicatorw) {')
    
  index_to_load = -1
  selected <- gtkComboBoxGetActiveText(bmt_diagnosis_fleet_SF_combo)
  
  if (!is_variable_ok("selected")){
    selected="ALL"
    
  }
 # print(paste("selected:",selected))

  if (!is.null(selected)) {
  index_to_update <- which(BMT_FLEETSEGMENTS == selected)    
  
# image 1 *********************************************************************     #GSA 18 - Revenues-Landing DTS_VL0006-VL1218 SIM.jpg
img_RL_path <-   paste(mat_cfg_general[1,3],  "/Diagnosis/Economic indicators/", mat_cfg_general[1,2], " - Revenues-Landing ", selected,".jpg", sep="") 

try(
img_RL_pb <- try(gdkPixbufNewFromFileTrim(img_RL_path), silent = TRUE)
,silent=T)

try(
  if (!inherits(img_RL_pb,'try-error')) {
img_RL_sw$destroy()
img_RL_sw <<- gtkScrolledWindowNew(NULL, NULL)
img_RL_sw$setShadowType("etched-in")
img_RL_sw$setPolicy("automatic", "automatic")
img_RL_sw$SetUsize(300, 300)  


img_RL_resized <- gdkPixbufScaleSimple(img_RL_pb, 300, 300, "bilinear")
img_RL <- gtkImageNewFromPixbuf(img_RL_resized)


img_RL_sw$add(img_RL)


vbox_image_RL$packStart(img_RL_sw, expand = FALSE, fill = FALSE, padding = 5)


}

,silent=T)


# image 2 *********************************************************************     #GSA 18 - Profit-Salary-Capital DTS_VL0006-VL1218 SIM.jpg
img_PS_path <-   paste(mat_cfg_general[1,3],  "/Diagnosis/Economic indicators/", mat_cfg_general[1,2], " - Profit-Salary-Capital ", selected,".jpg", sep="") 
img_PS_pb <- try(gdkPixbufNewFromFileTrim(img_PS_path), silent = TRUE)

try(
  if (!inherits(img_PS_pb,'try-error')) {
    
    img_PS_resized <- gdkPixbufScaleSimple(img_PS_pb, 300, 300, "bilinear")
    img_PS <- gtkImageNewFromPixbuf(img_PS_resized)
  
  
  
img_PS_sw$destroy()
img_PS_sw <<- gtkScrolledWindowNew(NULL, NULL)
img_PS_sw$setShadowType("etched-in")
img_PS_sw$setPolicy("automatic", "automatic")
img_PS_sw$SetUsize(300, 300)  


img_PS_sw$add(img_PS)
vbox_image_PS$packStart(img_PS_sw,expand = F, fill = F, padding = 5)    
}

, silent=T)

# image 3 *********************************************************************     #GSA 18 - Avg.salary-Employment PGP_VL0006-VL0612 SIM.jpg
img_SE_path <-   paste(mat_cfg_general[1,3],  "/Diagnosis/Economic indicators/", mat_cfg_general[1,2], " - Avg.salary-Employment ", selected,".jpg", sep="") 
img_SE_pb <- try(gdkPixbufNewFromFileTrim(img_SE_path), silent = TRUE)



try(
if (!is.null(img_SE_pb[[1]])) {
img_SE_sw$destroy()
img_SE_sw <<- gtkScrolledWindowNew(NULL, NULL)
img_SE_sw$setShadowType("etched-in")
img_SE_sw$setPolicy("automatic", "automatic")
img_SE_sw$SetUsize(300, 300)  

img_SE <- gtkImageNewFromPixbuf(img_SE_pb[[1]])
img_SE_sw$add(img_SE)
vbox_image_SE$packStart(img_SE_sw,expand = F, fill = F, padding = 5)    
}
,silent=T)

# image 4 *********************************************************************     #GSA 18 - Net profit-R_BER DTS_VL2440 SIM.jpg
img_RB_path <-   paste(mat_cfg_general[1,3],  "/Diagnosis/Economic indicators/", mat_cfg_general[1,2], " - Net profit-R_BER ", selected,".jpg", sep="") 
img_RB_pb <-  try(gdkPixbufNewFromFileTrim(img_RB_path), silent = TRUE)

try(
  if (!inherits(img_RB_pb,'try-error')) {
    
    img_RB_resized <- gdkPixbufScaleSimple(img_RB_pb, 300, 300, "bilinear")
    img_RB <- gtkImageNewFromPixbuf(img_RB_resized)
  
  
img_RB_sw$destroy()
img_RB_sw <<- gtkScrolledWindowNew(NULL, NULL)
img_RB_sw$setShadowType("etched-in")
img_RB_sw$setPolicy("automatic", "automatic")
img_RB_sw$SetUsize(300, 300)  


img_RB_sw$add(img_RB)

# vbox_image_RB <- gtkVBoxNew(homogeneous = FALSE, spacing = 5)
vbox_image_RB$packStart(img_RB_sw,expand = F, fill = F, padding = 5)    
}
,silent = T)



}

}
