$(document).ready(function () {
  $('input#input_text, input#input_answer').characterCounter();
  
  var checkbox = document.querySelector("input[name=checkbox]");

  var checklist_id = $('#checklist').attr("data-checklist");

  checkbox.addEventListener('change', function () {
    let checked;
    if (this.checked) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      url: `/checklists/${checklist_id}`,
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
      },
      data: {
        'checklist[publish]': checked
        },
      error: function (jqXHR) {
        if (jqXHR.status === 422) {
          eval(jqXHR.responseText);
        }
      }
    });
  });
});