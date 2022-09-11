# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#color').colorpicker ->
    allowEmpty:true
    color: "#ffffff"
    showInput: true
    containerClassName: "full-spectrum",
    showInitial: true,
    showPalette: true,
    showSelectionPalette: true,
    showAlpha: true,
    maxPaletteSize: 7,
    preferredFormat: "hex"
