$("#test_answers").on("click", function (event) {
  var href = $("#test_answers").attr("href");
  event.preventDefault();
  if ($(".card-content .answer_comment").length != 0) {
    $(".card-content .answer_comment textarea").focus();
    toastr.info('Please answer the question first!')
  } else {
    $(location).attr('href', href);
  }
});
