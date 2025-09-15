# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/src/econ/runEcon.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.





# runEcon.r - Bemtool economic indicators in the simulation period
# Author: Paolo Accadia

runEcon <- function(Flyear, simperiod, n_fleet, m_stock) {
# if (printOK) if (printOK)   print('Calling function: runEconFlyear, simperiod, n_fleet, m_stock) {')

if (FALSE) {
Flyear = Fleetyear
y_int = 1
i=1
}

    for (y_int in 1:simperiod) {
        for (i in 1:n_fleet) {
          #Flyear[[t]]@fleetsegments[[i]]@DAYS.average.annual <- Flyear[[t]]@fleetsegments[[i]]@DAYS.annual/Flyear[[t]]@fleetsegments[[i]]@VESSELS.annual
#          Flyear[[t]]@fleetsegments[[i]]@GT.DAYS.annual <- Flyear[[t]]@fleetsegments[[i]]@GT.annual*Flyear[[t]]@fleetsegments[[i]]@DAYS.annual/Flyear[[t]]@fleetsegments[[i]]@VESSELS.annual
#          Flyear[[t]]@fleetsegments[[i]]@KW.DAYS.annual <- Flyear[[t]]@fleetsegments[[i]]@KW.annual*Flyear[[t]]@fleetsegments[[i]]@DAYS.annual/Flyear[[t]]@fleetsegments[[i]]@VESSELS.annual

# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@average.wage <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@labour.cost/Flyear[[y_int]]@fleetsegments[[i]]@employment )))
# PERC --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@average.wage.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@average.wage )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@total.cost <- sum(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@variable.cost$tot.var.cost)), as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@fixed.cost$tot.fix.cost)), as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@fixed.cost$maint.cost)), as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@labour.cost)), as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@capital.cost$tot.cap.cost)) ,na.rm=TRUE)
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@total.cost.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@total.cost )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@total.income <- sum(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@total.revenues)), as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@other.income)), na.rm=TRUE)
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@gross.value.added <- sum(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@total.revenues)), -as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@variable.cost$tot.var.cost)), -as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@fixed.cost$tot.fix.cost)) , -as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@fixed.cost$maint.cost)), na.rm=T)
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@gross.value.added.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@gross.value.added)))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@gross.cash.flow <- sum(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@gross.value.added)), -as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@labour.cost)), na.rm=T)
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@gross.cash.flow.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@gross.cash.flow)))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@profit <- sum(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@gross.cash.flow)),-as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@capital.cost$tot.cap.cost)),na.rm=TRUE)
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@profit.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@profit)))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@net.profit <- sum(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@profit)),-as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@taxes)), as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@other.income)),na.rm=TRUE)
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@net.profit.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@net.profit )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.BER  <- sum(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@fixed.cost$other.fix.cost)), as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@capital.cost$depreciation)), as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@capital.cost$interest)), na.rm=T) /  (1 -  ( sum( as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@labour.cost)), as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@variable.cost$tot.var.cost)) , as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@fixed.cost$maint.cost)) , na.rm=T)/  as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@total.revenues))  ) ) 
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.BER.CI.perc[1,]  <-  as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.BER ))
# --------------------------------------------------------          
Flyear[[y_int]]@fleetsegments[[i]]@EC.ROI  <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@profit/Flyear[[y_int]]@fleetsegments[[i]]@capital.value )))
# --------------------------------------------------------          
Flyear[[y_int]]@fleetsegments[[i]]@EC.ROI.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.ROI )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.NPV.discounted  <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@profit )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.NPV.discounted.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.NPV.discounted )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.landings.day  <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@total.landings/Flyear[[y_int]]@fleetsegments[[i]]@DAYS.annual )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.landings.day.CI.perc[1,]  <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.landings.day  )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.landings.vessel  <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@total.landings/Flyear[[y_int]]@fleetsegments[[i]]@VESSELS.annual   )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.landings.vessel.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.landings.vessel   )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.revenues.day   <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@total.revenues/Flyear[[y_int]]@fleetsegments[[i]]@DAYS.annual  )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.revenues.day.CI.perc[1,] <-  as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.revenues.day ))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.revenues.vessel  <- convert_numeric0_to_na(as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@total.revenues/Flyear[[y_int]]@fleetsegments[[i]]@VESSELS.annual )))     
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.revenues.vessel.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@EC.tot.revenues.vessel )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.GVA.vessel  <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@gross.value.added/Flyear[[y_int]]@fleetsegments[[i]]@VESSELS.annual  )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.GVA.vessel.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.GVA.vessel  )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.GCF.vessel  <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@gross.cash.flow/Flyear[[y_int]]@fleetsegments[[i]]@VESSELS.annual )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.GCF.vessel.CI.perc[1,]  <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.GCF.vessel )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.profit.vessel <- convert_numeric0_to_na(as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@profit/Flyear[[y_int]]@fleetsegments[[i]]@VESSELS.annual )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.profit.vessel.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.profit.vessel )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.net.profit.vessel <- convert_numeric0_to_na(as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@net.profit/Flyear[[y_int]]@fleetsegments[[i]]@VESSELS.annual  )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.net.profit.vessel.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.net.profit.vessel)))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.R_BER <- convert_numeric0_to_na(as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@total.revenues)))  / as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.BER ))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.R_BER.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.R_BER   )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.RoFTA  <-as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@profit)) / as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@capital.value))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.RoFTA.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.RoFTA )))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.vessel.util.ratio <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@DAYS.annual))) / as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@MAXDAYS.average.annual ))
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@EC.vessel.util.ratio.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.vessel.util.ratio))) 
# -------------------------------------------------------- # RoFTA (net profit)
Flyear[[y_int]]@fleetsegments[[i]]@EC.NP.cap.value  <- convert_numeric0_to_na(as.numeric(as.character( Flyear[[y_int]]@fleetsegments[[i]]@net.profit))) / as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@capital.value ))
# -------------------------------------------------------- # RoFTA (net profit)
Flyear[[y_int]]@fleetsegments[[i]]@EC.NP.cap.value.CI.perc[1,] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@EC.NP.cap.value   )))

for (m in 1:m_stock) {
# --------------------------------------------------------
Flyear[[y_int]]@fleetsegments[[i]]@price[m]  <-  as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@revenues.landing[m])) / as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@landing.weight[m]))

Flyear[[y_int]]@fleetsegments[[i]]@price.CI.perc[,m] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@price[m]  )))
    
Flyear[[y_int]]@fleetsegments[[i]]@price.landed_discard[m]  <-  as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@revenues.landed_discard[m])) / as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@discard.weight[m]))

Flyear[[y_int]]@fleetsegments[[i]]@price.landed_discard.CI.perc[,m] <- convert_numeric0_to_na(as.numeric(as.character(Flyear[[y_int]]@fleetsegments[[i]]@price.landed_discard[m]  )))
    
          }
        }
    }
    return(Flyear)
}

