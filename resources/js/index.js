$(function() {
    var availableTags = [
      "basketball",
      "bar",
      "baseball"
    ];
    $( "#search" ).autocomplete({
        
      source: availableTags,
      autoFocus: true
    });
});