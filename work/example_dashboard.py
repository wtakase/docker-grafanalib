import grafanalib.core as G


dashboard = G.Dashboard(
    title='Test dashboard',
    panels=[
        G.Graph(
            title='CPU Usage by Namespace',
            dataSource='metricbeat',
            targets=[
                G.Target(
                    expr='whatever',
                    legendFormat='{{namespace}}',
                    refId='A',
                ),
            ],
            yAxes=[
                G.YAxis(
                    format=G.SHORT_FORMAT, label='CPU seconds'
                ),
                G.YAxis(format=G.SHORT_FORMAT),
            ],
            gridPos=G.GridPos(h=8, w=12, x=0, y=0)
        )
    ],
).auto_panel_ids()
