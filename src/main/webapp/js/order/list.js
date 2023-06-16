/**
 * Spring01
 *
 * @author shjang02 < shjang02@simplexi.com >
 * @since 2023. 06. 16.
 */

$(document).ready(function () {
  $('#btnOrderStatus').click(function () {
    const orderId = [];
    const aChecked = [];
    const bC = confirm("주문완료 처리 하시겠습니까?")

    if (bC) {
      $.each($('.rowChk:checked'), function (iKey, aRow) {
        aChecked.push($(this));
        orderId.push($(this).val())
      });

      if (!orderId.length > 0) {
        alert("주문을 선택해주세요.")
        return false;
      }

      $.ajax({
        url: "/order/updateStatus",
        type: "POST",
        data: JSON.stringify({
          orderId: orderId,
          status: 30,
        }),
        contentType: "application/json",
        dataType: "json",
        success: function (response) {
          // 서버로부터 받은 응답 데이터를 처리하는 코드
          $.each(aChecked, function (iKey, aRow) {
            $(this).prop('checked', false);
            $(this).prop('disabled', true)
          });

          alert("성공적으로 처리되었습니다. ")

          location.reload();
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