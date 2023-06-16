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

  $('.allChk').click(function () {
    const b = $('.allChk').prop("checked");
    $('.rowChk:enabled').prop("checked", b);
  });

  $(document).delegate('.rowChk', 'click', function (e) {
    var bIsAllChecked = ($('.rowChk:checked').length === $('.rowChk').length) ? true : false;
    $('.allChk').prop('checked', bIsAllChecked);
  });

  $('#btnOrderStatus').click(function () {
    const productionNo = []
    const orderNo = []
    const aChecked = [];
    const bC = confirm("생산완료 처리 하시겠습니까?")

    if (bC) {
      $.each($('.rowChk:checked'), function (iKey, aRow) {
        aChecked.push($(this));
        productionNo.push($(this).val())
        orderNo.push($(this).data('order_no').toString())
      });

      if (!productionNo.length > 0) {
        alert("선택해주세요.")
        return false;
      }

      $.ajax({
        url: "/production/updateStatus",
        type: "POST",
        data: JSON.stringify({
          orderNo: orderNo,
          productionIds: productionNo,
          status: 20,
        }),
        contentType: "application/json",
        dataType: "json",
        success: function (response) {
          $.each(aChecked, function (iKey, aRow) {
            $(this).prop('checked',false);
            $(this).prop('disabled',true)
          });

          // 서버로부터 받은 응답 데이터를 처리하는 코드
          alert("성공적으로 처리되었습니다. ")
          // 응답 데이터를 활용하여 필요한 작업 수행
        },
        error: function (xhr, status, error) {
          // AJAX 요청이 실패한 경우의 처리 코드
          alert("요청에 실패했습니다")
          console.error(error);
        }
      });
    }
  });
});