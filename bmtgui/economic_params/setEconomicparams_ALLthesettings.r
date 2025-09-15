# if (printOK) if (printOK) cat('Sourcing file: ', basename('C:/Users/emant/Downloads/stecf_tech_measures-main3/stecf_tech_measures-main/BEMTOOL2.5/code/bmtgui/economic_params/setEconomicparams_ALLthesettings.r'), '\n')
# BEMTOOL - Bio-Economic Model TOOLs - version 2.5
# Authors: G. Lembo, I. Bitetto, M.T. Facchini, M.T. Spedicato 2018
# COISPA Tecnologia & Ricerca, Via dei Trulli 18/20 - (Bari), Italy 
# In case of use of the model, the Authors should be cited.
# If you have any comments or suggestions please contact the following e-mail address: facchini@coispa.it
# BEMTOOL is believed to be reliable. However, we disclaim any implied warranty or representation about its accuracy, 
# completeness or appropriateness for any particular purpose.








setEconomicparams_ALLthesettings <- function() {
# if (printOK) if (printOK)   print('Calling function: setEconomicparams_ALLthesettings) {')

bmt_fleet.cost_variable  <<- NULL
bmt_cost_variable_list <<- list()

bmt_fleet.cost_fuelprice <<- NULL
bmt_cost_fuelprice_list <<- list()

bmt_fleet.cost_fixed  <<- NULL
bmt_cost_fixed_list <<- list()

bmt_fleet.cost_capital  <<- NULL
bmt_cost_capital_list <<- list()

bmt_fleet.cost_crew_minwage <<- NULL
bmt_cost_crew_minwage_list <<- list()

bmt_fleet.behav_dyn <<- NULL
bmt_behav_dyn_list <<- list()

bmt_fleet.behav_act <<- NULL
bmt_behav_act_list <<- list()

bmt_fleet.behav_progr <<- NULL
bmt_behav_progr_list <<- list()

bmt_fleet.ecoind <<- NULL
bmt_ecoind_list <<- list()

bmt_fleet.indic_taxes <<- NULL
bmt_indic_taxes_list <<- list()

bmt_fleet.discard_cost <<- NULL
bmt_discard_cost_list <<- list()

bmt_fleet.cost_equipment <<- NULL
bmt_cost_equipment_list <<- list()

bmt_fleet.indic_subsidies <<- NULL
bmt_indic_subsidies_list <<- list()

bmt_fleet.labour_fuel <<- NULL
bmt_labour_fuel_list <<- list()

bmt_fleet.labour_commercial <<- NULL
bmt_labour_commercial_list <<- list()

bmt_fleet.labour_others <<- NULL
bmt_labour_others_list <<- list()

bmt_fleet.labour_sorting <<- NULL
bmt_labour_sorting_list <<- list()


}
  
