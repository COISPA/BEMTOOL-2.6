# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.

#if (exists("wnd_sim")) {
#wnd_sim$destroy()
#}

 if (BMT_STATE == "DO_SCENARIO")   {
  STOP <<- FALSE

      # #############################################################################################
      # run Harvest Rules
      # #############################################################################################
      phase <<- "FORECAST"                                       
     # readline(prompt = "Compile the forecast-bmtcfg.csv and press any digit to run the FORECAST >> ")
            ALADYM_spe <<- 1

      # if (exists("ALADYM_GUI_fleets_fore")) {rm(ALADYM_GUI_fleets_fore)}
      if (exists("ALADYM_GUI_forecast_int")) {rm(ALADYM_GUI_forecast_int)}
        
      # reload configuration file
      cfg_simu <<- data.frame(read.csv(file=paste(getwd(), "/bmtconfig.csv", sep=""), sep=";", na.strings = "NA", header=FALSE) )
      cfg_fore <<- data.frame(read.csv(file=paste(getwd(), "/bmtconfig scenario.csv", sep=""), sep=";", na.strings = "NA", header=FALSE) )
      
     # name_config <<- paste(casestudy_path, "/",harvest_rule_id, "/", casestudy_name, " - BMTCONFIG FORE ", harvest_rule_id,".csv", sep="")
#      write.table(cfg_fore, file = name_config, sep=";", row.names=F)
      
      max_num_col <- max(ncol(cfg_simu), ncol(cfg_fore))

if (max_num_col > ncol(cfg_simu)) {
    finalist_simu <- data.frame(cbind(cfg_simu, matrix("", ncol=max_num_col-ncol(cfg_simu), nrow=nrow(cfg_simu))) )
    finalist_fore <- data.frame(cfg_fore )
} else if (max_num_col <= ncol(cfg_simu)) {
    finalist_fore <- data.frame(cbind(cfg_fore, matrix("", ncol=max_num_col-ncol(cfg_fore), nrow=nrow(cfg_fore))) )
    finalist_simu <- data.frame(cfg_simu )
}

colnames(finalist_simu) <- paste("col", c(1:ncol(finalist_simu)), sep="")
colnames(finalist_fore) <- paste("col", c(1:ncol(finalist_fore)), sep="")

cfg <<- data.frame(rbind(finalist_simu, finalist_fore))

cfg[is.na(cfg)] <- ""

 null_row_names <- c( which( as.character(cfg[,1]) == ""), which( !is.na(as.numeric(as.character(cfg[,1]) ))) , which(is.na(cfg[,1])) )
 
 levels(cfg[,1]) <- factor(c(levels(cfg[,1]),  c(1:length(null_row_names))))  
 
    cfg[null_row_names,1]  <- c(1:length(null_row_names))

      
      nm <- as.character(cfg[,1])
      empty_indices <- which(nm!="")
      nm <- nm[empty_indices]
      cfg <<- cfg[,2:ncol(cfg)]
      rownames(cfg)[empty_indices] <- nm
  
      BMT_SCENARIO <<-  as.numeric(as.character(cfg[rownames(cfg) == "casestudy.HR",1]))   # 13 
      
      MEY_CALCULATION <<-  as.logical(as.character(cfg[rownames(cfg) == "casestudy.MEY",1])) 
      casestudy.startforecast <<- as.numeric(as.character(cfg[rownames(cfg) == "casestudy.startforecast",1]))      
      casestudy.endforecast <<- as.numeric(as.character(cfg[rownames(cfg) == "casestudy.endforecast",1]))   
  
    
years.forecast <<- c(casestudy.startforecast:casestudy.endforecast)
foreperiod <<-  casestudy.endforecast - casestudy.startforecast  +  1 
     
			        Fleetyear <<- Fleetyear[1:simperiod]
              Interactionsyear <<- Interactionsyear[1:simperiod] 
              
              source(suppressWarnings(paste(getwd(), "/src/ini/forecast_fleetcreation.r", sep="")))
              source(suppressWarnings(paste(getwd(), "/src/ini/forecast_interactioncreation.r", sep=""))) 

      if (!MEY_CALCULATION) {  
       
       TAC_ROUND <<- 1
        BMT_SCENARIO <<-  as.numeric(as.character(cfg[rownames(cfg) == "casestudy.HR",1]))     # 13
      
      harvest_rule_code <<- ifelse(phase=="FORECAST",  as.character(cfg[rownames(cfg) == "casestudy.HR",1]) , "Diagnosis")   # 13  
      harvest_rule_level <<- ifelse(phase=="FORECAST",  as.character(cfg[rownames(cfg) == "casestudy.HR",2]), "")
      harvest_rule_id <<- ifelse(phase=="FORECAST", paste("HR", harvest_rule_code, "-", harvest_rule_level, sep=""), "" )
      casestudy_name <<- as.character(cfg[rownames(cfg) == "casestudy.name",1])
       
      source(suppressWarnings(paste(getwd(), "/src/utils/create_folders.fore.r", sep="")))
      source(suppressWarnings(paste(getwd(), "/src/econ/readEconparams_fore.r", sep="")))  
      
      Fleetyear <<- setFleet_fore(Fleetyear)
     
     write.table(cfg_fore, file= paste(casestudy_path, "/",harvest_rule_id, "/", casestudy_name, " - bmtconfig scenario ", harvest_rule_id,".csv", sep=""), sep=";", col.names = F, row.names=F)
      
       #print(paste("Running forecast for", BMT_SPECIES[ALADYM_spe], "..."))
      source(paste(getwd(), "/src/hr/runHR.r", sep=""))
      
      } else {
         # IF del MEY
          BMT_STATE <<- "MEY"
               print("MEY calculation in progress...", quote=F)
      #   Fleetyear <<- Fleetyear[1:simperiod]
#        Interactionsyear <<- Interactionsyear[1:simperiod] 
   
        MEY_EFFORT_PERIOD <<-  as.numeric(as.character(cfg[rownames(cfg) == "casestudy.MEY",4]))  
             
        casestudy.endforecast <<- casestudy.endsimulation + MEY_EFFORT_PERIOD
        years.forecast <<- c(casestudy.startforecast:casestudy.endforecast)
        
        foreperiod <<-  casestudy.endforecast - casestudy.startforecast  +  1

        source(suppressWarnings(paste(getwd(), "/src/ini/forecast_fleetcreation.r", sep="")))
        source(suppressWarnings(paste(getwd(), "/src/ini/forecast_interactioncreation.r", sep=""))) 
        source(suppressWarnings(paste(getwd(), "/src/econ/readEconparams_fore.r", sep="")))  

          source(suppressWarnings(paste(getwd(), "/src/hr/MEYcalculation.r", sep="")))
          BMT_STATE <<- "FINISH"
     }
    
}
   
   #  source(suppressWarnings(paste(getwd(), "/src/hr/getEconomicTable_CI.r", sep=""))) 
   #  source(suppressWarnings(paste(getwd(), "/src/hr/getEconomicTable.r", sep="")))               


if (BMT_STATE == "FORECAST" & !MEY_CALCULATION) { 

if (!INTEGRATED_APPROACH | BMT_SCENARIO == BMT_HR_TAC_BESC_FCAP_STRATEGY) {

if ( BMT_SCENARIO == BMT_HR_TAC_BESC_FCAP_STRATEGY) {


FINALE_FC <- data.frame(matrix(nrow=0, ncol=6) )
colnames(FINALE_FC) <- c( "Year", "Month","run", "species", "Fleet_segment", "FC") 
                 
for (spi in 1:length(BMT_SPECIES) ) {

#associated_fleetsegment <<- as.vector(cfg[rownames(cfg)==paste("casestudy.S", spi, ".associatedFleetsegment", sep=""), ])   
#associated_fleetsegment <<- associated_fleetsegment[!is.na(associated_fleetsegment) & associated_fleetsegment!="" & associated_fleetsegment!="-"]

save_path_fc <- paste(workingfilesDIR,"/", prefix_outfiles, "Fishing coefficients - ", BMT_SPECIES[spi] ," - ", suffix_outfiles,".csv", sep="")  
 COEFF_final_temp <- data.frame(read.csv(save_path_fc, sep=";", header=T))
     
   SQ_FISHING_EFF <- data.frame(cbind(rep(years[simperiod], 12), cbind(MONTHS, INP$Fishing_efforts[c (((simperiod-1)*12 + 2):((simperiod)*12+1) ),])) )
   colnames(SQ_FISHING_EFF) <- c("Year", "Month", colnames(INP$Fishing_efforts) )
      
      if ("run" %in% colnames(COEFF_final_temp) ) {
       SQ_FISHING_EFF$run <- 1
      }
       
    COEFF_final_temp <- data.frame(rbind(COEFF_final_temp, SQ_FISHING_EFF) ) 

    COEFF_final_temp_SQ <- COEFF_final_temp[COEFF_final_temp$Year == years[simperiod], ]    
        COEFF_final_temp_SQ <- COEFF_final_temp_SQ[!is.na(COEFF_final_temp_SQ$Year) , ]       
          COEFF_final_temp <- COEFF_final_temp[COEFF_final_temp$Year > years[simperiod], ]
             COEFF_final_temp <- COEFF_final_temp[!is.na(COEFF_final_temp$Year) , ] 
             

                      
          if ( length(COEFF_final_temp[, colnames(COEFF_final_temp) == "run"]) == 0) {
            COEFF_final_temp$run <- 1
          }
          
          COEFF_final_temp$species <- BMT_SPECIES[spi]
 
    temp_dt <-  melt(COEFF_final_temp, id = c(1:2, (ncol(COEFF_final_temp)-1):ncol(COEFF_final_temp)), measures= c(3:(2+length(BMT_FLEETSEGMENTS)) ) ) 
    colnames(temp_dt) <- c( "Year", "Month","run", "species", "Fleet_segment", "FC")  
             FINALE_FC <- data.frame(rbind(FINALE_FC, temp_dt))       

}
                                       # ~ FC
          casted =  dcast(FINALE_FC, Year + Month + run + species ~ Fleet_segment )
           casted[is.na(casted)] <- 0
        
}
# aggiorna i giorni


  for (ye_f in 1:foreperiod) {
            yy <- ye_f + simperiod
  if ( BMT_SCENARIO == BMT_HR_TAC_BESC_FCAP_STRATEGY ) {
        COEFF_final_temp_ye <- casted[casted$Year == years.forecast[ye_f], ]
        Fleetyear <<-  updateDAYSfromTAC( Fleetyear, yy, COEFF_final_temp_ye, COEFF_final_temp_SQ)
     } 
       Fleetyear <<- updateFleetfromInteraction(Fleetyear, yy)
        }
        
        for (ye_f in 1:foreperiod) {
         yy <- ye_f + simperiod
         Fleetyear <<- runEcon.fore( Fleetyear, yy)
        }  
       # }
         
numb_yearsNPV <- ifelse(foreperiod < 15, foreperiod, 15)  
  numb_yearsNPV_plus <- ifelse(foreperiod < 16, foreperiod, 16)          
    
    for (fleet_i in 1:n_fleet) {
    NPV15_calculated <- Fleetyear[[simperiod]]@fleetsegments[[fleet_i]]@EC.NPV.discounted 
     NPV15_calculated_perc <- Fleetyear[[simperiod]]@fleetsegments[[fleet_i]]@EC.NPV.discounted.CI.perc
       for (ye_f in (simperiod+1):(simperiod+numb_yearsNPV)) {
                   NPV15_calculated <- NPV15_calculated + Fleetyear[[ye_f]]@fleetsegments[[fleet_i]]@EC.NPV.discounted  
                     NPV15_calculated_perc <- NPV15_calculated_perc + Fleetyear[[ye_f]]@fleetsegments[[fleet_i]]@EC.NPV.discounted.CI.perc 
        }

          bmtindicators_discount_rate <- as.numeric(as.character(eimat[8,fleet_i]))  
     for (ye_f in 1:foreperiod) {
            Fleetyear[[ye_f]]@fleetsegments[[fleet_i]]@EC.NPV15 <- NPV15_calculated 
            Fleetyear[[ye_f]]@fleetsegments[[fleet_i]]@EC.NPV15.CI.perc <- NPV15_calculated_perc 
            
						Fleetyear[[ye_f]]@fleetsegments[[fleet_i]]@EC.NPV15.infinite <-  (Fleetyear[[numb_yearsNPV_plus-1]]@fleetsegments[[fleet_i]]@EC.NPV.discounted/ bmtindicators_discount_rate)*( (1 + bmtindicators_discount_rate )^ (- (numb_yearsNPV_plus)) )  +   Fleetyear[[ye_f]]@fleetsegments[[fleet_i]]@EC.NPV15
					
					for (PERC in c(1:5)) {	
						Fleetyear[[ye_f]]@fleetsegments[[fleet_i]]@EC.NPV15.infinite.CI.perc[1,PERC] <-  (Fleetyear[[numb_yearsNPV_plus-1]]@fleetsegments[[fleet_i]]@EC.NPV.discounted.CI.perc[1,PERC]/ bmtindicators_discount_rate)*( (1 + bmtindicators_discount_rate )^ (- (numb_yearsNPV_plus)) )  +   Fleetyear[[ye_f]]@fleetsegments[[fleet_i]]@EC.NPV15.CI.perc[1,PERC]
						}
     }
     }
           
              
 }


# harvest_rule_code <<-  ifelse(phase=="FORECAST",  as.character(cfg[rownames(cfg) == "casestudy.HR",1]) , "Diagnosis") #  13        
#harvest_rule_level <<- ifelse(phase=="FORECAST",  as.character(cfg[rownames(cfg) == "casestudy.HR",2]), "")
#harvest_rule_id <<- ifelse(phase=="FORECAST", paste("HR", harvest_rule_code, "-", harvest_rule_level, sep=""), "" )
#casestudy_name <<- as.character(cfg[rownames(cfg) == "casestudy.name",1])
  

name_bioind <<- paste(casestudy_path, "/",harvest_rule_id, "/", casestudy_name, " - Biological indicators ", harvest_rule_id,".csv", sep="")
name_bioind_CI <<- paste(casestudy_path, "/",harvest_rule_id, "/", casestudy_name, " - Biological indicators ", harvest_rule_id," quantiles.csv", sep="")
name_pressind <<- paste(casestudy_path, "/",harvest_rule_id, "/", casestudy_name, " - Pressure impact indicators ", harvest_rule_id,".csv", sep="")
name_pressind_CI <<- paste(casestudy_path, "/",harvest_rule_id, "/", casestudy_name, " - Pressure impact indicators ", harvest_rule_id," quantiles.csv", sep="")
name_econind <<- paste(casestudy_path, "/",harvest_rule_id, "/", casestudy_name, " - Economic output ", harvest_rule_id,".csv", sep="")
name_econind_CI <<- paste(casestudy_path, "/",harvest_rule_id, "/", casestudy_name, " - Economic output ", harvest_rule_id," quantiles.csv", sep="")

Rworking_env <- paste(casestudy_path, "/",harvest_rule_id, "/working files/", casestudy_name, " - BEMTOOL forecast ", harvest_rule_id, ".Rdata", sep="")
save.image(file=Rworking_env) 

Rworking_env_selection <- paste(casestudy_path, "/",harvest_rule_id, "/working files/", casestudy_name, " - BEMTOOL forecast ", harvest_rule_id, "-rev.Rdata", sep="")

save(file=Rworking_env_selection, list = c("casestudy_path","casestudy_name", "Populations", "FleetStockInteractions", "Interactionsyear" , "Fleetyear", "XSAinfo", "XSAinfo_empty", "VITinfo", "VITinfo_empty" , "SURBAinfo", "SURBAinfo_empty",  "ReportINFO", "ReportINFO_empty", "ALADYM_GUI_fleets",  "ALADYM_GUI_populations" , "ALADYM_GUI_simulations", "BMT_SPECIES", "BMT_FLEETSEGMENTS", "years", "years_forecast", "FleetList_forecast"))           #   "ALADYM_GUI_fleets_fore",
  
   
print("FORECAST in progress [State indicators]...", quote=F)
write.table(getBiologicalTable(c(years, years.forecast)), file=name_bioind, sep=";", row.names=F)
bio_CI_output <- getBiologicalTable_CI()
if (nrow(bio_CI_output) != 0) {
write.table(bio_CI_output, file=name_bioind_CI, sep=";", row.names=F)
}
print("FORECAST in progress [Pressure/Impact indicators]...", quote=F)
write.table(getPressureImpactTable(c(years, years.forecast)), file=name_pressind, sep=";", row.names=F)
press_CI_output <- getPressureImpactTable_CI()
if (nrow(press_CI_output) != 0) {
write.table(press_CI_output, file=name_pressind_CI, sep=";", row.names=F)
}
print("FORECAST in progress [Economic indicators]...", quote=F)
write.table(getEconomicTable(c(years, years.forecast)), file=name_econind, sep=";", row.names=F)
eco_CI_output <- getEconomicTable_CI()
if (nrow(eco_CI_output) != 0) {
write.table(eco_CI_output, file=name_econind_CI, sep=";", row.names=F)
}                  
# write.table(getEconomicTable(c(years, years.forecast)), file="C:/test_eco_ind.csv", sep=";", row.names=F)

# ALADYM_home <- "C:/BEMTOOL-ver2.0.7-2015_29012016_ultima/src/biol/bmtALADYM/ALADYM-ver10.1.4b-2015"

print("Saving Kobe plot...", quote=F)
suppressWarnings(bmtsaveKobePlot(c(years, years.forecast), name_bioind, name_pressind) )
print("Saving biological indicators plot...", quote=F)
suppressWarnings(saveSingleIndicatorPlot(c(years, years.forecast), name_bioind, name_pressind, name_bioind_CI, name_pressind_CI)    )
print("Saving F plot...", quote=F)
suppressWarnings(saveF_Plot(c(years, years.forecast), name_pressind, name_bioind) )
print("Saving Yield barplot...", quote=F)
suppressWarnings(saveYield_barPlot(c(years, years.forecast), name_pressind) )

suppressWarnings(saveSingleIndicatorPlot_econ(c(years, years.forecast), name_econind, name_econind_CI)  )

print("Saving Revenues-Landings plot...", quote=F)
suppressWarnings(saveRevenues_Plot(c(years, years.forecast), name_econind, name_econind_CI)  )
print("Saving Revenues-Discard plot...", quote=F)
suppressWarnings(saveRevenues_discard_Plot(c(years, years.forecast), name_econind, name_econind_CI)  )
print("Saving Avg.salary-Employment plot...", quote=F)                                                
try(suppressWarnings(saveSalary_Plot(c(years, years.forecast), name_econind, name_econind_CI)    ))
print("Saving Net profit-R/BER plot...", quote=F)
try(suppressWarnings(saveProfit_Plot(c(years, years.forecast), name_econind, name_econind_CI)  ))
print("Saving Profit-Salary-Capital barplot...", quote=F)
try(suppressWarnings(save_EconomicbarPlot(c(years, years.forecast), name_econind, name_econind_CI)  ))
print("Saving Estimated price plot...", quote=F)
try(suppressWarnings(plotEstimatedPrice(c(years, years.forecast), name_econind, name_econind_CI)  ))
print("Saving Estimated discard price plot...", quote=F)
try(suppressWarnings(plotEstimatedPrice_discard(c(years, years.forecast), name_econind, name_econind_CI)   ))
print("Saving Estimated variable costs plot...", quote=F)
try(suppressWarnings(plotEstimatedVC(c(years, years.forecast), name_econind, name_econind_CI)   ))
print("Saving Estimated capital costs plot...", quote=F)
try(suppressWarnings(plotEstimatedCC(c(years, years.forecast), name_econind, name_econind_CI)  ))
print("Saving Estimated fixed costs plot...", quote=F)
try(suppressWarnings(plotEstimatedFC(c(years, years.forecast), name_econind, name_econind_CI)  ))
print("Saving Estimated labour costs plot...", quote=F)
try(suppressWarnings(plotEstimatedLC(c(years, years.forecast), name_econind, name_econind_CI) ))

# updating dropdown menu
casestudy_path <- str_replace_all(casestudy_path, "\\\\", "/" )

scenarios_dirs <<- list.dirs(path = casestudy_path, recursive=F,  full.names = FALSE)
scenarios_dirs <<- scenarios_dirs[str_detect(scenarios_dirs[], "HR")  ]

scenario_names <<- c()
for (len in 1:length(scenarios_dirs)) {
vect_ <- str_split(as.character(scenarios_dirs[len]), "/")
vect_ <- vect_[[1]]
scenario_names <<- c(scenario_names, vect_[length(vect_)])
}

.GlobalEnv$bmt_forecast_executed_scenarios$appendText(harvest_rule_id) 
gtkComboBoxSetActive(.GlobalEnv$bmt_forecast_executed_scenarios, (which(scenario_names == harvest_rule_id)))
                                 
#suppressWarnings(source(paste(getwd(), "/bmtgui/scenarios/loadScenario_script.r", sep="")) )		

gtkLabelSetText(lbl_current_step, " Step 8 of 9 ")  
gtkNotebookSetCurrentPage(BMTnotebook, 7)   
gtkWidgetSetSensitive(gtkNotebookGetNthPage(BMTnotebook, 0), F)  
gtkWidgetSetSensitive(gtkNotebookGetNthPage(BMTnotebook, 1), F)          
gtkWidgetSetSensitive(gtkNotebookGetNthPage(BMTnotebook, 2), F)
gtkWidgetSetSensitive(gtkNotebookGetNthPage(BMTnotebook, 3), F)
gtkWidgetSetSensitive(gtkNotebookGetNthPage(BMTnotebook, 4), F)
gtkWidgetSetSensitive(gtkNotebookGetNthPage(BMTnotebook, 5), F)
gtkWidgetSetSensitive(gtkNotebookGetNthPage(BMTnotebook, 6), F)
gtkWidgetSetSensitive(gtkNotebookGetNthPage(BMTnotebook, 7), T)
gtkWidgetSetSensitive(gtkNotebookGetNthPage(BMTnotebook, 8), F)
gtkWidgetSetSensitive(btn_runSIMULATION_bmt, F)
gtkWidgetSetSensitive(btn_runFORECAST_bmt, F)
gtkWidgetSetSensitive(btn_load_CS, F) 
gtkWidgetSetSensitive(btn_load_LOADSCENARIO, F)   
  
  BMT_STATE <<- "FINISH"

} 




if (BMT_STATE == "ASK_MCDA") {
 ISCORRECT <- FALSE
        while (!ISCORRECT) {
            ANSWER <- readline(prompt = "Do you want to execute MCDA?  Y/N >> ")   
            if (iscorrect_answer("MCDA", ANSWER) & (ANSWER == "Y" | ANSWER == "y")) {
                source(paste(getwd(), "/src/mcda/Run_MCDA.r", sep=""))
                ISCORRECT <- TRUE 
            } else if (iscorrect_answer("MCDA", ANSWER) & (ANSWER == "N" | ANSWER == "n")) {
              BMT_STATE <<- "FINISH"
              ISCORRECT <- TRUE
              print("BEMTOOL model successfully terminated!", quote=F)
              BMT_STATE <<- "ESC" 
             # source(suppressWarnings(paste(getwd(), "/src/runBEMTOOL.r", sep="") ) )
              } else {
                print("ATTENTION: Input not valid! Insert the correct answer >>", quote = FALSE)
                ISCORRECT <- FALSE
            }
        }
}

