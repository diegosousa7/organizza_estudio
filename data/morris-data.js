$(function() {

    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2016 Q1',
            "Pacote Fotografia de Casamento": 2666,
            "Pacote Fotografia 15 Anos": null,
            "Pacote Fotografia Formatura": 2647
        }, {
            period: '2016 Q2',
            "Pacote Fotografia de Casamento": 2778,
            "Pacote Fotografia 15 Anos": 2294,
            "Pacote Fotografia Formatura": 2441
        }, {
            period: '2016 Q3',
            "Pacote Fotografia de Casamento": 4912,
            "Pacote Fotografia 15 Anos": 1969,
            "Pacote Fotografia Formatura": 2501
        }, {
            period: '2016 Q4',
            "Pacote Fotografia de Casamento": 3767,
            "Pacote Fotografia 15 Anos": 3597,
            "Pacote Fotografia Formatura": 5689
        }, {
            period: '2017 Q1',
            "Pacote Fotografia de Casamento": 6810,
            "Pacote Fotografia 15 Anos": 1914,
            "Pacote Fotografia Formatura": 2293
        }, {
            period: '2017 Q2',
            "Pacote Fotografia de Casamento": 5670,
            "Pacote Fotografia 15 Anos": 4293,
            "Pacote Fotografia Formatura": 1881
        }, {
            period: '2017 Q3',
            "Pacote Fotografia de Casamento": 4820,
            "Pacote Fotografia 15 Anos": 3795,
            "Pacote Fotografia Formatura": 1588
        }, {
            period: '2017 Q4',
            "Pacote Fotografia de Casamento": 15073,
            "Pacote Fotografia 15 Anos": 5967,
            "Pacote Fotografia Formatura": 5175
        }, {
            period: '2018 Q1',
            "Pacote Fotografia de Casamento": 10687,
            "Pacote Fotografia 15 Anos": 4460,
            "Pacote Fotografia Formatura": 2028
        }],
        xkey: 'period',
        ykeys: ['Pacote Fotografia de Casamento', 'Pacote Fotografia 15 Anos', 'Pacote Fotografia Formatura'],
        labels: ['Pacote Fotografia de Casamento', 'Pacote Fotografia 15 Anos ', 'Pacote Fotografia Formatura'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 12
        }, {
            label: "In-Store Sales",
            value: 30
        }, {
            label: "Mail-Order Sales",
            value: 20
        }],
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2006',
            a: 100,
            b: 90
        }, {
            y: '2007',
            a: 75,
            b: 65
        }, {
            y: '2008',
            a: 50,
            b: 40
        }, {
            y: '2009',
            a: 75,
            b: 65
        }, {
            y: '2016',
            a: 50,
            b: 40
        }, {
            y: '2017',
            a: 75,
            b: 65
        }, {
            y: '2018',
            a: 100,
            b: 90
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true
    });
    
});
