$("#test_answers").on("click", function (event) {
  var href = $("#test_answers").attr("href");
  event.preventDefault();
  if ($(".card-content #answer_comment").length != 0) {
    $(".card-content #answer_comment")[0].focus(function () {
      console.log("focusing on this element")
    });
  } else{
    $(location).attr('href', href);
  }
});
