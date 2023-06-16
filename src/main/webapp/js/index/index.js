/**
 * Spring01
 *
 * @author shjang02 < shjang02@simplexi.com >
 * @since 2023. 06. 16.
 */
$(document).ready(function() {

  let sse = new EventSource("/sse/connect");

  sse.addEventListener('connect', (e) => {
    const { data: receivedConnectData } = e;
    console.log('connect event data: ',receivedConnectData);  // "connected!"
  });

  sse.addEventListener('count', e => {
    const { data: receivedCount } = e;
    console.log("count event data",receivedCount);
  });


  $('#dataTable').DataTable();


// Pie Chart Example
  var ctx = document.getElementById("gFactory");
  var gChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ["양극재", "음극재"],
      datasets: [{
        data: [$('.gFactoryAn').val(), $('.gFactoryCh').val()],
        backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
        hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: false
      },
      cutoutPercentage: 80,
    },
  });


  var ctx = document.getElementById("pFactory");
  var pFactory = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ["양극재", "음극재"],
      datasets: [{
        data: [$('.pFactoryAn').val(), $('.pFactoryCh').val()],
        backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
        hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: false
      },
      cutoutPercentage: 80,
    },
  });
  var ctx = document.getElementById("guFactory");
  var guChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ["양극재", "음극재"],
      datasets: [{
        data: [$('.guFactoryAn').val(), $('.guFactoryCh').val()],
        backgroundColor: ['#4e73df', '#1cc88a'],
        hoverBackgroundColor: ['#2e59d9', '#17a673'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: false
      },
      cutoutPercentage: 80,
    },
  });
});