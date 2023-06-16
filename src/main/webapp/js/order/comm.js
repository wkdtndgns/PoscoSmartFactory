/**
 * Spring01
 *
 * @author shjang02 < shjang02@simplexi.com >
 * @since 2023. 06. 16.
 */


$(document).ready(function () {
  $('#dataTable').DataTable({
    "columnDefs": [
      {
        "orderable": false,
        "targets": 0
      }
    ]
  });

  $('#selStatus').val($('#hidPrevStatus').val());

  $('#selStatus').change(function (){
    $('#frm').submit();
  });


  $('.allChk').click(function () {
    const b = $('.allChk').prop("checked");
    $('.rowChk:enabled').prop("checked", b);
  });

  $(document).delegate('.rowChk', 'click', function (e) {
    var bIsAllChecked = ($('.rowChk:checked').length === $('.rowChk').length) ? true : false;
    $('.allChk').prop('checked', bIsAllChecked);
  });

});