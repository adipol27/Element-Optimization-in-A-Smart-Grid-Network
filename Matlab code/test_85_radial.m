function mpc = test_85_radial
%InputProject    Power flow data for 9 bus, 3 generator case.
%   Please see CASEFORMAT for details on the case file format.
%   MATPOWER
%% MATPOWER Case Format : Version 2
mpc.version = '2';
%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100;
%% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
mpc.bus = [
1	3	0	0	0	0	11	11	11	11	11	11	0.9;
2	1	0	0	0	0	11	11	11	11	11	11	0.9;
3	1	0	0	0	0	11	11	11	11	11	11	0.9;
4	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
5	1	0	0	0	0	11	11	11	11	11	11	0.9;
6	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
7	1	0	0	0	0	11	11	11	11	11	11	0.9;
8	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
9	1	0	0	0	0	11	11	11	11	11	11	0.9;
10	1	0	0	0	0	11	11	11	11	11	11	0.9;
11	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
12	1	0	0	0	0	11	11	11	11	11	11	0.9;
13	1	0	0	0	0	11	11	11	11	11	11	0.9;
14	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
15	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
16	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
17	1	0.112	0.11426	0	0	11	11	11	11	11	11	0.9;
18	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
19	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
20	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
21	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
22	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
23	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
24	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
25	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
26	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
27	1	0	0	0	0	11	11	11	11	11	11	0.9;
28	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
29	1	0	0	0	0	11	11	11	11	11	11	0.9;
30	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
31	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
32	1	0	0	0	0	11	11	11	11	11	11	0.9;
33	1	0.014	0.01428	0	0	11	11	11	11	11	11	0.9;
34	1	0	0	0	0	11	11	11	11	11	11	0.9;
35	1	0	0	0	0	11	11	11	11	11	11	0.9;
36	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
37	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
38	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
39	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
40	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
41	1	0	0	0	0	11	11	11	11	11	11	0.9;
42	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
43	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
44	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
45	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
46	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
47	1	0.014	0.01428	0	0	11	11	11	11	11	11	0.9;
48	1	0	0	0	0	11	11	11	11	11	11	0.9;
49	1	0	0	0	0	11	11	11	11	11	11	0.9;
50	1	0.03628	0.03701	0	0	11	11	11	11	11	11	0.9;
51	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
52	1	0	0	0	0	11	11	11	11	11	11	0.9;
53	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
54	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
55	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
56	1	0.014	0.01428	0	0	11	11	11	11	11	11	0.9;
57	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
58	1	0	0	0	0	11	11	11	11	11	11	0.9;
59	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
60	1	0	0	0	0	11	11	11	11	11	11	0.9;
61	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
62	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
63	1	0.014	0.01428	0	0	11	11	11	11	11	11	0.9;
64	1	0	0	0	0	11	11	11	11	11	11	0.9;
65	1	0	0	0	0	11	11	11	11	11	11	0.9;
66	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
67	1	0	0	0	0	11	11	11	11	11	11	0.9;
68	1	0	0	0	0	11	11	11	11	11	11	0.9;
69	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
70	1	0	0	0	0	11	11	11	11	11	11	0.9;
71	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
72	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
73	1	0	0	0	0	11	11	11	11	11	11	0.9;
74	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
75	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
76	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
77	1	0.014	0.01428	0	0	11	11	11	11	11	11	0.9;
78	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
79	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
80	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
81	1	0	0	0	0	11	11	11	11	11	11	0.9;
82	1	0.056	0.05713	0	0	11	11	11	11	11	11	0.9;
83	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
84	1	0.014	0.01428	0	0	11	11	11	11	11	11	0.9;
85	1	0.03528	0.03599	0	0	11	11	11	11	11	11	0.9;
  ];
%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
	1	0 0 0 0 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
];
%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [
1	2	0.089	0.061	-0.0087	150	150	150	0	0	1	-360	360;
2	3	0.134	0.092	-0.0087	150	150	150	0	0	1	-360	360;
3	4	0.179	0.123	-0.0087	150	150	150	0	0	1	-360	360;
4	5	0.089	0.061	-0.0087	150	150	150	0	0	1	-360	360;
5	6	0.359	0.246	-0.0087	150	150	150	0	0	1	-360	360;
6	7	0.224	0.153	-0.0087	150	150	150	0	0	1	-360	360;
7	8	0.989	0.677	-0.0087	150	150	150	0	0	1	-360	360;
8	9	0.089	0.061	-0.0087	150	150	150	0	0	1	-360	360;
9	10	0.494	0.338	-0.0087	150	150	150	0	0	1	-360	360;
10	11	0.449	0.308	-0.0087	150	150	150	0	0	1	-360	360;
11	12	0.449	0.308	-0.0087	150	150	150	0	0	1	-360	360;
12	13	0.494	0.338	-0.0087	150	150	150	0	0	1	-360	360;
13	14	0.224	0.153	-0.0087	150	150	150	0	0	1	-360	360;
14	15	0.269	0.184	-0.0087	150	150	150	0	0	1	-360	360;
2	16	0.601	0.249	-0.0087	150	150	150	0	0	1	-360	360;
3	17	0.376	0.156	-0.0087	150	150	150	0	0	1	-360	360;
5	18	0.677	0.280	-0.0087	150	150	150	0	0	1	-360	360;
18	19	0.526	0.218	-0.0087	150	150	150	0	0	1	-360	360;
19	20	0.376	0.156	-0.0087	150	150	150	0	0	1	-360	360;
20	21	0.676	0.280	-0.0087	150	150	150	0	0	1	-360	360;
21	22	1.279	0.530	-0.0087	150	150	150	0	0	1	-360	360;
19	23	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
7	24	0.752	0.312	-0.0087	150	150	150	0	0	1	-360	360;
8	25	0.376	0.156	-0.0087	150	150	150	0	0	1	-360	360;
25	26	0.300	0.124	-0.0087	150	150	150	0	0	1	-360	360;
26	27	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
27	28	0.225	0.093	-0.0087	150	150	150	0	0	1	-360	360;
28	29	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
29	30	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
30	31	0.225	0.093	-0.0087	150	150	150	0	0	1	-360	360;
31	32	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
32	33	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
33	34	0.676	0.280	-0.0087	150	150	150	0	0	1	-360	360;
34	35	0.526	0.218	-0.0087	150	150	150	0	0	1	-360	360;
35	36	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
26	37	0.300	0.124	-0.0087	150	150	150	0	0	1	-360	360;
27	38	0.828	0.343	-0.0087	150	150	150	0	0	1	-360	360;
29	39	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
32	40	0.376	0.156	-0.0087	150	150	150	0	0	1	-360	360;
40	41	0.828	0.343	-0.0087	150	150	150	0	0	1	-360	360;
41	42	0.225	0.093	-0.0087	150	150	150	0	0	1	-360	360;
41	43	0.376	0.156	-0.0087	150	150	150	0	0	1	-360	360;
34	44	0.828	0.343	-0.0087	150	150	150	0	0	1	-360	360;
44	45	0.752	0.312	-0.0087	150	150	150	0	0	1	-360	360;
45	46	0.752	0.312	-0.0087	150	150	150	0	0	1	-360	360;
46	47	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
35	48	0.526	0.218	-0.0087	150	150	150	0	0	1	-360	360;
48	49	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
49	50	0.300	0.124	-0.0087	150	150	150	0	0	1	-360	360;
50	51	0.376	0.156	-0.0087	150	150	150	0	0	1	-360	360;
48	52	1.128	0.468	-0.0087	150	150	150	0	0	1	-360	360;
52	53	0.376	0.156	-0.0087	150	150	150	0	0	1	-360	360;
53	54	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
52	55	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
49	56	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
9	57	0.225	0.093	-0.0087	150	150	150	0	0	1	-360	360;
57	58	0.676	0.280	-0.0087	150	150	150	0	0	1	-360	360;
58	59	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
58	60	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
60	61	0.601	0.249	-0.0087	150	150	150	0	0	1	-360	360;
61	62	0.828	0.342	-0.0087	150	150	150	0	0	1	-360	360;
60	63	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
63	64	0.601	0.249	-0.0087	150	150	150	0	0	1	-360	360;
64	65	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
65	66	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
64	67	0.376	0.156	-0.0087	150	150	150	0	0	1	-360	360;
67	68	0.752	0.312	-0.0087	150	150	150	0	0	1	-360	360;
68	69	0.902	0.374	-0.0087	150	150	150	0	0	1	-360	360;
69	70	0.376	0.156	-0.0087	150	150	150	0	0	1	-360	360;
70	71	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
67	72	0.150	0.061	-0.0087	150	150	150	0	0	1	-360	360;
68	73	0.978	0.405	-0.0087	150	150	150	0	0	1	-360	360;
73	74	0.225	0.093	-0.0087	150	150	150	0	0	1	-360	360;
73	75	0.828	0.343	-0.0087	150	150	150	0	0	1	-360	360;
70	76	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
65	77	0.075	0.030	-0.0087	150	150	150	0	0	1	-360	360;
10	78	0.526	0.218	-0.0087	150	150	150	0	0	1	-360	360;
67	79	0.451	0.186	-0.0087	150	150	150	0	0	1	-360	360;
12	80	0.601	0.249	-0.0087	150	150	150	0	0	1	-360	360;
80	81	0.300	0.124	-0.0087	150	150	150	0	0	1	-360	360;
81	82	0.075	0.030	-0.0087	150	150	150	0	0	1	-360	360;
81	83	0.902	0.374	-0.0087	150	150	150	0	0	1	-360	360;
83	84	0.828	0.343	-0.0087	150	150	150	0	0	1	-360	360;
13	85	0.676	0.280	-0.0087	150	150	150	0	0	1	-360	360;
  ];

%%----- OPF Data -----%%
%% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
mpc.gencost = [
	2	1500	0	3	0.11	5	150;
];