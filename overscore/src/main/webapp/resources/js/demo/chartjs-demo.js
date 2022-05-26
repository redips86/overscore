$(function () {

    var rankData = [3433, 3433, 3433, 3323, 3123, 2908, 3640];
    var lineData = {
        labels: ["2017-02-11", "2017-02-12", "2017-02-13", "2017-02-14", "2017-02-15", "2017-02-21", "2017-02-22"],
        datasets: [
            {
                type: 'line',
                label: '점수',
                fill: false,
                /*data: [3433, 3433, 3433, 3323, 3123, 2908, 3640]*/
                data: [0, 0, 0, -1, -2, -3, 3]
            },
            {
                type: 'bar',
                label: '승리',
                backgroundColor: "rgba(220,220,220,0.5)",
                data: [5, 2, 3, 9, 4, 0, 1]
            },
            {
                type: 'bar',
                label: '패배',
                backgroundColor: "rgba(151,187,205,0.5)",
                data: [-2, 0, -4, -12, -3, 0, -3]
            }
        ]
    };

    var lineOptions = {
        legend: {
            display: false
        },
        scales: {
            xAxes: [{
                stacked: true,
            }],
            yAxes: [{
                display: false,
                stacked: true,
                startValue: 0,
                ticks: {min: -12, max: 12, stepSize: Math.ceil(12 / 5)}
            }]
        },
        tooltips: {
            callbacks: {
                label: function (tooltipItems, data) {
                    return rankData;
                }
            }

        },
        stacked: true,
        responsive: true
    };


    /*var ctx = document.getElementById("lineChart").getContext("2d");
    new Chart(ctx, {type: 'bar', data: lineData, options:lineOptions});*/
    /*
        var barData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
                {
                    label: "Data 1",
                    backgroundColor: 'rgba(220, 220, 220, 0.5)',
                    pointBorderColor: "#fff",
                    data: [65, 59, 80, 81, 56, 55, 40]
                },
                {
                    label: "Data 2",
                    backgroundColor: 'rgba(26,179,148,0.5)',
                    borderColor: "rgba(26,179,148,0.7)",
                    pointBackgroundColor: "rgba(26,179,148,1)",
                    pointBorderColor: "#fff",
                    data: [28, 48, 40, 19, 86, 27, 90]
                }
            ]
        };

        var barOptions = {
            responsive: true
        };


        var ctx2 = document.getElementById("barChart").getContext("2d");
        new Chart(ctx2, {type: 'bar', data: barData, options:barOptions});

        var polarData = {
            datasets: [{
                data: [
                    300,140,200
                ],
                backgroundColor: [
                    "#a3e1d4", "#dedede", "#b5b8cf"
                ],
                label: [
                    "My Radar chart"
                ]
            }],
            labels: [
                "App","Software","Laptop"
            ]
        };

        var polarOptions = {
            segmentStrokeWidth: 2,
            responsive: true

        };

        var ctx3 = document.getElementById("polarChart").getContext("2d");
        new Chart(ctx3, {type: 'polarArea', data: polarData, options:polarOptions});

        var doughnutData = {
            labels: ["App","Software","Laptop" ],
            datasets: [{
                data: [300,50,100],
                backgroundColor: ["#a3e1d4","#dedede","#b5b8cf"]
            }]
        } ;


        var doughnutOptions = {
            responsive: true
        };


        var ctx4 = document.getElementById("doughnutChart").getContext("2d");
        new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});
    */

    var radarData = {
        labels: ["공격", "캐리", "생존", "명중", "스킬", "Cycling", "Running"],
        datasets: [
            {
                label: "My First dataset",
                backgroundColor: "rgba(220,220,220,0.2)",
                borderColor: "rgba(220,220,220,1)",
                data: [65, 59, 90, 81, 56, 55, 40]
            },
            {
                label: "My Second dataset",
                backgroundColor: "rgba(26,179,148,0.2)",
                borderColor: "rgba(26,179,148,1)",
                data: [28, 48, 40, 19, 96, 27, 100]
            }
        ]
    };

    var radarOptions = {
        responsive: true,
        legend: {
            position: 'bottom'
        }
    };

    var ctx5 = document.getElementById("radarChart").getContext("2d");
    new Chart(ctx5, {type: 'radar', data: radarData, options: radarOptions});


});