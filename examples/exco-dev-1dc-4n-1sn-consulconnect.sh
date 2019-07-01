
<head>
    <style>
        html * {
            font-size: small;
            font-family: "Arial Narrow", Arial, sans-serif !important;
        }

        table {
            border-collapse: collapse;
        }

        th {
            background-color: #dddddd;
        }

        th,
        td {
            border: 1px solid lightgrey;
        }

        tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .roleApigee {
            font-weight: bold;
            color: #f83100;
        }
        .role3rdParty {
            font-weight: bold;
            color: blue;s
        }
        .nodeID {
            font-weight: bold;
        }
    </style>
</head><table>

<thead>
    <tr>
        <th>DC</th>
        <th>Node #</th>
        <th>Role(s)</th>
        <th>Rack</th>
        <th>Subnet</th>
        <th>Hostname</th>
        <th>IP</th>
    </tr>
</thead>
<tbody>
<tr>
    <td>dc-1</td>
    <td>Node <bold><span class="nodeID">1</span></bold></td>
    <td><span class="roleApigee">UI</span>,<span class="roleApigee">MS</span>,<span class="role3rdParty">OL</span>,<span class="role3rdParty">CS</span>,<span class="role3rdParty">ZK</span></td>
    <td style="text-align:right; background-color:#159702;">1</td>
    <td>edge-devportal</td>
    <td>c1.consul</td>
    <td>172.20.106.101</td>
</tr>
<tr>
    <td>dc-1</td>
    <td>Node <bold><span class="nodeID">2</span></bold></td>
    <td><span class="roleApigee">UI</span>,<span class="roleApigee">MS</span>,<span class="roleApigee">PS</span>,<span class="roleApigee">QS</span>,<span class="role3rdParty">PGm</span>,<span class="role3rdParty">OL</span>,<span class="role3rdParty">QD</span>,<span class="role3rdParty">CS</span>,<span class="role3rdParty">ZK</span></td>
    <td style="text-align:right; background-color:#159702;">1</td>
    <td>edge-devportal</td>
    <td>c2.consul</td>
    <td>172.20.106.102</td>
</tr>
<tr>
    <td>dc-1</td>
    <td>Node <bold><span class="nodeID">3</span></bold></td>
    <td><span class="roleApigee">R</span>,<span class="roleApigee">MP</span>,<span class="roleApigee">PS</span>,<span class="roleApigee">QS</span>,<span class="role3rdParty">PGs</span>,<span class="role3rdParty">QD</span>,<span class="role3rdParty">CS</span>,<span class="role3rdParty">ZK</span></td>
    <td style="text-align:right; background-color:#159702;">1</td>
    <td>edge-devportal</td>
    <td>c3.consul</td>
    <td>172.20.106.103</td>
</tr>
<tr>
    <td>dc-1</td>
    <td>Node <bold><span class="nodeID">4</span></bold></td>
    <td><span class="roleApigee">R</span>,<span class="roleApigee">MP</span></td>
    <td style="text-align:right; background-color:#159702;">1</td>
    <td>edge-devportal</td>
    <td>c4.consul</td>
    <td>172.20.106.104</td>
</tr></tbody></table>

