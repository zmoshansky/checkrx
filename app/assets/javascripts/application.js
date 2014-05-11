// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function openDrugFormulary(p_din){
  var drug_window = window.open('http://apps.gov.yk.ca/pls/apex40p/f?p=161:9000','Yukon Drug Formulary');
  try{
  	drug_window.document.$('#P9000_SEARCH_CRITERIA').val(p_din);
  	drug_window.document.$('button.button-small-search-bg').click();
  } catch(e){

  }
}
function openDrugDatabase(p_din){
  var drug_window = window.open('http://webprod5.hc-sc.gc.ca/dpd-bdpp/index-eng.jsp','Drug Product Database');
  try{
    drug_window.document.$('#din').val(p_din);
  	drug_window.document.$('button[value=Search]');
  }  catch(e){
  	
  }
}