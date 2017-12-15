
var cData = `Sentence_ID,Review_ID,Date,Category,Sentiment_Score,Sentiment_Label
                    1,1,2/3/2017,Venue,0.90,positive
                    1,1,2/3/2017,Venue,0.80,positive
                    2,2,7/18/2017,Price,0.68,positive
                    3,3,10/31/2017,Food,0.62,positive
                    4,4,2/3/2016,Food,0.00,positive
                    5,5,5/27/2016,Food,0.00,positive
                    6,6,12/3/2016,Food,0.74,positive
                    6,6,12/3/2016,Price,0.74,positive
                    7,7,5/31/2017,Miscellaneous,0.78,positive
                    8,8,7/29/2017,Food,0.85,positive
                    9,9,1/3/2017,Venue,0.88,positive
                    10,10,11/27/2016,Venue,0.00,positive
                    10,10,11/27/2016,Price,0.00,positive
                    11,11,2/3/2015,Venue,0.85,positive
                    12,12,4/3/2015,Miscellaneous,-0.91,negative
                    13,13,11/15/2015,Venue,0.89,positive
                    14,14,9/3/2017,Price,-0.57,negative
                    15,1,2/3/2017,Food,-0.61,negative
                    16,2,7/18/2017,Price,0.00,positive
                    17,3,10/31/2017,Price,0.91,positive
                    17,3,10/31/2017,Food,0.91,positive
                    18,4,2/3/2016,Food,0.98,positive
                    19,5,5/27/2016,Venue,0.00,positive
                    20,6,12/3/2016,Venue,-0.70,negative
                    21,7,5/31/2017,Food,0.76,positive
                    22,8,7/29/2017,Food,0.76,positive
                    23,9,1/3/2017,Food,-0.55,negative
                    24,10,11/27/2016,Service,0.00,positive
                    25,11,2/3/2015,Service,-0.52,negative
                    26,12,4/3/2015,Service,0.84,positive
                    26,12,4/3/2015,Food,0.84,positive`;

        function csvJSON(csv, separator) {

            if (!separator) separator = "\n";

            var lines = csv.split(separator);

            var result = [];

            var headers = lines[0].split(",");

            for (var i = 1; i < lines.length; i++) {

                var obj = {};
                var currentline = lines[i].split(",");

                for (var j = 0; j < headers.length; j++) {
                    obj[String(headers[j]).trim()] = String(currentline[j]).trim();
                }

                result.push(obj);

            }

            //return result; //JavaScript object
            return JSON.stringify(result); //JSON
        }

        //window.onresize = function () {
        //    window.location.href = window.location.href;
        //}
              
        function handleFiles() {
            //var selectedFile = document.getElementById('input').files[0];
            var file = document.getElementById("input").files[0];
            if (file) {
                var reader = new FileReader();
                reader.readAsText(file, "UTF-8");
                reader.onload = function (evt) {
                    window.cdata = evt.target.result;
                    loadData();
                }
                reader.onerror = function (evt) {
                    alert("error reading file");
                }
            }

        };

        function render() {
            renderGrid();
            onDocumentReady();
            renderlinechart()
        }

        var renderGrid = function () {

            var height = window.innerHeight - 80;
            var width = (window.innerWidth / 2) - 20;

            document.getElementById('power-gauge').style.height = height + 'px';
            document.getElementById('chart').style.height = height + 'px';
            document.getElementById('power-gauge').style.width = width + 'px';
            if (window.innerWidth < 850)
                document.getElementById('chart').style.width = (window.innerWidth - 40)+ 'px';
            else
                document.getElementById('chart').style.width = width + 'px';
        }

        $(document).ready(function () {
            window.sYear = 'All';
            verifyDataExists();
        });

        function verifyDataExists() {
            if (window.data)
                loadData();//first load data
            else {
                if (getcData()) {
                    $('#input').attr('disabled', 'disabled');
                    document.getElementById("input").style.display = 'none';
                    loadData();
                }
            }
        }

        function getcData() {
            try {
                if (cData) {
                    return cData;
                }
            } catch (e) {
                return undefined;
            }
        }

    </script>
    <script>

        function yearChanged() {
            var myselect = document.getElementById("trend");
            var opts = myselect.options;
            var selectedVal = myselect.options[myselect.selectedIndex].value;

            window.sYear = selectedVal;

            $('#power-gauge').empty();
            $('#chart').empty();

            loadData();
        }

        function bindYears(year) {
            var x = document.getElementById("trend");

            for (var i = 0; i < x.options.length; i++) {
                if (year == x.options[i].value) {
                    return;
                }
            }

            var option = document.createElement("option");
            option.text = year;
            option.value = year;
            x.add(option);
        }

        function loadData() {
            try {
                if (getcData())
                    data = JSON.parse(csvJSON(getcData(), "\n"));
                else
                    data = JSON.parse(csvJSON(window.cdata));
            } catch (e) {
                alert('Error while reading data from selected file. Please make sure provide proper CSV file.');
                return;
            }
            

            data.forEach(function (d) {
                d.Date = new Date(d.Date);
            });

            if (window.sYear != 'All') {
                data = data.filter(function (y) { return (y.Date).getFullYear().toString() == window.sYear + ''; });
            }

            data.forEach(function (d) {
                d.Date = __formatxDate(d.Date);
            });

            var months = [];

            for (var i = 0; i < data.length; i++) {
                if (months.indexOf(data[i]['Date']) < 0) {
                    months.push(data[i]['Date']);
                }
            }

            //Prepare line chart data
            var lineChartData = [];

            for (var i = 0; i < months.length; i++) {

                var cMonthData = data.filter(function (m) { return m.Date == months[i]; });

                var cPositive = cMonthData.filter(function (m) { return String(m.Sentiment_Label).toLowerCase() == 'positive'; });

                lineChartData.push({
                    date: new Date('1-' + months[i]),
                    'Total Review Count': getReviewCount(cMonthData).length,
                    'Total Sentence Count': cMonthData.length,
                    'Total Positive Sentences': cPositive.length,
                    '% Positive Score': getPositivePercentage(cPositive, cMonthData),
                    'Average Sentiment Score': getAvgScoreCount(cMonthData)
                });
            }

            window.lineChartData = lineChartData;

            //Prepare gauge chart data.

            //Get for each year
            var years = []

            for (var i = 0; i < months.length; i++) {
                var cy = months[i][months[i].length - 3] + months[i][months[i].length - 2] + months[i][months[i].length - 1];
                if (years.indexOf(cy) < 0) {
                    years.push(cy);
                }
            }

            var cats = [];

            for (var i = 0; i < data.length; i++) {
                if (cats.indexOf(data[i]['Category']) < 0) {
                    cats.push(data[i]['Category']);
                }
            }

            var yearlyCatdata = [];

            if (window.sYear == 'All') {
                for (var i = 0; i < years.length; i++) {

                    var pyear = years[i] + '';
                    if (years[i].includes('-')) {
                        pyear = pyear.replace('-', '20');
                    }

                    bindYears(pyear);
                }
            }

            if (window.sYear == 'All') {

                var perCat = {};

                perCat['Year'] = window.sYear;

                var cYearData = data;

                var cPositive = cYearData.filter(function (m) { return String(m.Sentiment_Label).toLowerCase() == 'positive'; });

                perCat['Total % Positive'] = ((cPositive.length / cYearData.length) * 100).toFixed(2);

                for (var j = 0; j < cats.length; j++) {

                    var cPos = cPositive.filter(function (m) { return m.Category == cats[j]; });

                    var cAll = cYearData.filter(function (m) { return m.Category == cats[j]; });

                    if (cPos.length > 0 && cAll.length > 0) {
                        perCat[cats[j] + ' % Positive'] = ((cPos.length / cAll.length) * 100).toFixed(2);
                    }
                    else {
                        perCat[cats[j] + ' % Positive'] = "0.00";
                    }

                }
                yearlyCatdata.push(perCat);
            }
            else {
                for (var i = 0; i < years.length; i++) {

                    var perCat = {};

                    var pyear = years[i] + '';
                    if (years[i].includes('-')) {
                        pyear = pyear.replace('-', '20');
                    }

                    perCat['Year'] = pyear;

                    var cYearData = data.filter(function (m) { return String(m.Date).includes(years[i]); });

                    var cPositive = cYearData.filter(function (m) { return String(m.Sentiment_Label).toLowerCase() == 'positive'; });

                    perCat['Total % Positive'] = ((cPositive.length / cYearData.length) * 100).toFixed(2);

                    for (var j = 0; j < cats.length; j++) {

                        var cPos = cPositive.filter(function (m) { return m.Category == cats[j]; });

                        var cAll = cYearData.filter(function (m) { return m.Category == cats[j]; });

                        if (cPos.length > 0 && cAll.length > 0) {
                            perCat[cats[j] + ' % Positive'] = ((cPos.length / cAll.length) * 100).toFixed(2);
                        }
                        else {
                            perCat[cats[j] + ' % Positive'] = "0.00";
                        }

                    }
                }

                yearlyCatdata.push(perCat);
            }

            window.gaugeChartData = yearlyCatdata;

            render();

            var lineChart = Number($(($('#chart').find('svg')[0])).attr('width'));

            $(($('#chart').find('svg')[0])).attr('width', (lineChart + 10));

        }

        function getAvgScoreCount(cMonthData) {

            var totalScore = 0;
            for (var i = 0; i < cMonthData.length; i++) {
                totalScore = totalScore + cMonthData[i]['Sentiment_Score'];
            }

            return (totalScore / (cMonthData.length));

        }

        function getPositivePercentage(cPositive, cMonthData) {
            if (cPositive.length > 0) {
                return Number(((cPositive.length / cMonthData.length) * 100).toFixed(2));
                //return (cPositive.length / cMonthData.length) * 100;
            }
            else
                return 0;
        }

        function getReviewCount(data) {

            var reviews = [];

            for (var i = 0; i < data.length; i++) {
                if (reviews.indexOf(data[0]['Review_ID']) < 0) {
                    reviews.push(data[0]['Review_ID']);
                }
            }
            return reviews;
        }

        function formatDate() {
            var xlbl = $("[style='text-anchor: middle; display: block;']");

            for (var i = 0; i < xlbl.length; i++) {
                var lbl = $(xlbl[i]);
                var slbl = $(lbl.find('tspan'));
                if (slbl) {
                    var sdate = __formatxDate(slbl[0].innerHTML);
                    slbl[0].innerHTML = sdate;
                }
            }
        }

        function formatxToolTip() {
            var tooltip = $('.c3-tooltip-container').find('.c3-tooltip tr th')[0];
            if (tooltip) {
                var sdate = __formatxDate(tooltip.innerHTML);
                tooltip.innerHTML = sdate;
            }
        }

        function __formatxDate(_date) {

            var arr = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
            var dd = new Date(_date);
            var m = dd.getMonth();
            var y = dd.getYear().toString();
            return arr[m] + "-" + y.substr(y.length - 2);
        }

        function renderlinechart() {

            data = window.lineChartData;

            var chart = c3.generate({
                data: {
                    json: data,
                    keys: {
                        x: Object.keys(data[0])[0],
                        value: Object.keys(data[0]).splice(1, Object.keys(data[0]).length)
                    }
                },
                axis: {
                    x: {
                        type: 'timeseries',
                        tick: {
                            format: function (x) {
                                if (x.getDate() === 1) {
                                    return x.toLocaleDateString();
                                }
                            }
                        }
                    }
                }
            });

            setTimeout(formatDate, 100);
        }