$(document).ready(function () {
  var checkbox = document.querySelector("input[name=checkbox]"),
      checklist_id = $('#checklist').attr("data-checklist");

  checkbox.addEventListener('change', function () {
    var checked;
    if (this.checked) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      url: '/checklists/' + checklist_id,
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
      },
      data: {
        'checklist[public]': checked
      },
      error: function (jqXHR) {
        if (jqXHR.status === 422) {
          eval(jqXHR.responseText);
        }
      }
    });
  });
});
