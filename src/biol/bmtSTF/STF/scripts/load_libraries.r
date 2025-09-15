# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/src/biol/bmtSTF/STF/scripts/load_libraries.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.





#install.packages("ggplot2")
#install.packages("akima")
# list of packages to install:

# FLCore_2.5.0
# FLAssess_2.5.0
# FLXSA_2.5
# FLash_2.5.0
# FLBRP_2.5.0
# ggplotFL_0.1
# FLAdvice_1.0

# Load the libraries
library(FLCore)
#library(FLAssess)
#library(FLXSA)
#library(FLash)
#library(FLBRP)

# Needed for FLAdvice
library(ggplot2)
library(akima)
library(ggplotFL)
# library(FLAdvice) # Still experimental so don't blame me if it breaks!
library(plyr)

