// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require d3
//= require_tree .


function disableButton() {
  var button = document.getElementById("save_button");
  button.addEventListener('click', function() {
    setTimeout(function(){ button.disabled = true; }, 1);
  }, false);
}

function hideLastRow() {
  var container = document.getElementById("row_container");
  var last = container.lastElementChild;
  last.style.display = 'none';
}

