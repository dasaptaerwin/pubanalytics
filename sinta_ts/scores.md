
# a short analysis on scores

## linear regression


```R
library('tidyverse')
```

    ── Attaching packages ─────────────────────────────────────── tidyverse 1.2.1 ──
    ✔ ggplot2 2.2.1     ✔ purrr   0.2.4
    ✔ tibble  1.4.2     ✔ dplyr   0.7.4
    ✔ tidyr   0.8.0     ✔ stringr 1.3.0
    ✔ readr   1.1.1     ✔ forcats 0.3.0
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()



```R
d = read.csv('sinta_ts.csv')
```


```R
head(d)
```


<table>
<thead><tr><th scope=col>no</th><th scope=col>grup</th><th scope=col>name</th><th scope=col>affil</th><th scope=col>sumdoc</th><th scope=col>sumdoc2</th><th scope=col>sumcitation</th><th scope=col>sumcitation2</th><th scope=col>hind</th><th scope=col>hind2</th><th scope=col>sumcitation3</th><th scope=col>hind3</th></tr></thead>
<tbody>
	<tr><td>1              </td><td>top10          </td><td>suharyo s.     </td><td>NA             </td><td>661            </td><td>635            </td><td>35031          </td><td>34799          </td><td>86             </td><td>86             </td><td>22082          </td><td>64             </td></tr>
	<tr><td>2              </td><td>top10          </td><td>johannes v.d.w.</td><td>NA             </td><td>109            </td><td>109            </td><td> 5716          </td><td> 5716          </td><td>43             </td><td>43             </td><td> 3812          </td><td>32             </td></tr>
	<tr><td>3              </td><td>top10          </td><td>suryadi i.     </td><td>NA             </td><td>152            </td><td>142            </td><td> 4963          </td><td> 4955          </td><td>32             </td><td>32             </td><td> 4577          </td><td>30             </td></tr>
	<tr><td>4              </td><td>top10          </td><td>ferry i.       </td><td>NA             </td><td>180            </td><td>131            </td><td> 3972          </td><td> 3866          </td><td>31             </td><td>31             </td><td> 2996          </td><td>26             </td></tr>
	<tr><td>5              </td><td>top10          </td><td>daniel m.      </td><td>NA             </td><td> 79            </td><td> 59            </td><td> 4644          </td><td> 4123          </td><td>30             </td><td>28             </td><td> 3639          </td><td>25             </td></tr>
	<tr><td>6              </td><td>top10          </td><td>bachti a.      </td><td>NA             </td><td>111            </td><td>101            </td><td> 2632          </td><td> 2531          </td><td>26             </td><td>26             </td><td> 2161          </td><td>24             </td></tr>
</tbody>
</table>




```R
#calculate percentage of journals in sumdoc: sumdoc2/sumdoc -> sumdoc3
d$sumdoc3 = (d$sumdoc2/d$sumdoc)*100
```


```R
head(d)
```


<table>
<thead><tr><th scope=col>no</th><th scope=col>grup</th><th scope=col>name</th><th scope=col>affil</th><th scope=col>sumdoc</th><th scope=col>sumdoc2</th><th scope=col>sumcitation</th><th scope=col>sumcitation2</th><th scope=col>hind</th><th scope=col>hind2</th><th scope=col>sumcitation3</th><th scope=col>hind3</th><th scope=col>sumdoc3</th></tr></thead>
<tbody>
	<tr><td>1              </td><td>top10          </td><td>suharyo s.     </td><td>NA             </td><td>661            </td><td>635            </td><td>35031          </td><td>34799          </td><td>86             </td><td>86             </td><td>22082          </td><td>64             </td><td> 96.06657      </td></tr>
	<tr><td>2              </td><td>top10          </td><td>johannes v.d.w.</td><td>NA             </td><td>109            </td><td>109            </td><td> 5716          </td><td> 5716          </td><td>43             </td><td>43             </td><td> 3812          </td><td>32             </td><td>100.00000      </td></tr>
	<tr><td>3              </td><td>top10          </td><td>suryadi i.     </td><td>NA             </td><td>152            </td><td>142            </td><td> 4963          </td><td> 4955          </td><td>32             </td><td>32             </td><td> 4577          </td><td>30             </td><td> 93.42105      </td></tr>
	<tr><td>4              </td><td>top10          </td><td>ferry i.       </td><td>NA             </td><td>180            </td><td>131            </td><td> 3972          </td><td> 3866          </td><td>31             </td><td>31             </td><td> 2996          </td><td>26             </td><td> 72.77778      </td></tr>
	<tr><td>5              </td><td>top10          </td><td>daniel m.      </td><td>NA             </td><td> 79            </td><td> 59            </td><td> 4644          </td><td> 4123          </td><td>30             </td><td>28             </td><td> 3639          </td><td>25             </td><td> 74.68354      </td></tr>
	<tr><td>6              </td><td>top10          </td><td>bachti a.      </td><td>NA             </td><td>111            </td><td>101            </td><td> 2632          </td><td> 2531          </td><td>26             </td><td>26             </td><td> 2161          </td><td>24             </td><td> 90.99099      </td></tr>
</tbody>
</table>




```R
#sort data based on sumdoc3 
arrange(d, desc(sumdoc3))
```


<table>
<thead><tr><th scope=col>no</th><th scope=col>grup</th><th scope=col>name</th><th scope=col>affil</th><th scope=col>sumdoc</th><th scope=col>sumdoc2</th><th scope=col>sumcitation</th><th scope=col>sumcitation2</th><th scope=col>hind</th><th scope=col>hind2</th><th scope=col>sumcitation3</th><th scope=col>hind3</th></tr></thead>
<tbody>
	<tr><td> 2             </td><td>top10          </td><td>johannes v.d.w.</td><td>NA             </td><td>109            </td><td>109            </td><td> 5716          </td><td> 5716          </td><td>43             </td><td>43             </td><td> 3812          </td><td>32             </td></tr>
	<tr><td>32             </td><td>top40          </td><td>remy e.p.m.    </td><td>NA             </td><td> 51            </td><td> 51            </td><td>  965          </td><td>  965          </td><td>17             </td><td>17             </td><td>  789          </td><td>14             </td></tr>
	<tr><td> 8             </td><td>top10          </td><td>effendy        </td><td>NA             </td><td> 79            </td><td> 78            </td><td> 1959          </td><td> 1959          </td><td>28             </td><td>28             </td><td> 1419          </td><td>22             </td></tr>
	<tr><td>38             </td><td>top40          </td><td>i ketut adnyana</td><td>NA             </td><td> 58            </td><td> 57            </td><td>  884          </td><td>  884          </td><td>14             </td><td>14             </td><td>  771          </td><td>13             </td></tr>
	<tr><td>42             </td><td>top50          </td><td>rintis n.      </td><td>NA             </td><td> 43            </td><td> 42            </td><td>  829          </td><td>  826          </td><td>14             </td><td>14             </td><td>  557          </td><td>12             </td></tr>
	<tr><td>40             </td><td>top40          </td><td>raymond r.t.   </td><td>NA             </td><td> 82            </td><td> 80            </td><td> 1062          </td><td>  979          </td><td>18             </td><td>17             </td><td>  793          </td><td>12             </td></tr>
	<tr><td>28             </td><td>top30          </td><td>a.m. gunawan i.</td><td>NA             </td><td> 94            </td><td> 91            </td><td>  846          </td><td>  836          </td><td>15             </td><td>15             </td><td>  706          </td><td>15             </td></tr>
	<tr><td>27             </td><td>top30          </td><td>m. hakimi      </td><td>NA             </td><td> 53            </td><td> 51            </td><td> 1190          </td><td> 1190          </td><td>16             </td><td>16             </td><td>  994          </td><td>15             </td></tr>
	<tr><td> 1             </td><td>top10          </td><td>suharyo s.     </td><td>NA             </td><td>661            </td><td>635            </td><td>35031          </td><td>34799          </td><td>86             </td><td>86             </td><td>22082          </td><td>64             </td></tr>
	<tr><td>46             </td><td>top50          </td><td>t. tedjo s.    </td><td>NA             </td><td> 44            </td><td> 42            </td><td> 1531          </td><td> 1496          </td><td>15             </td><td>14             </td><td> 1109          </td><td>11             </td></tr>
	<tr><td>11             </td><td>top20          </td><td>moch. hatta    </td><td>NA             </td><td>131            </td><td>125            </td><td> 1458          </td><td> 1417          </td><td>22             </td><td>22             </td><td> 1194          </td><td>20             </td></tr>
	<tr><td>13             </td><td>top20          </td><td>jamaluddin j.  </td><td>NA             </td><td> 54            </td><td> 51            </td><td> 2091          </td><td> 2090          </td><td>20             </td><td>20             </td><td> 1853          </td><td>19             </td></tr>
	<tr><td>48             </td><td>top50          </td><td>evy y.         </td><td>NA             </td><td> 54            </td><td> 51            </td><td>  717          </td><td>  707          </td><td>14             </td><td>14             </td><td>  461          </td><td>11             </td></tr>
	<tr><td>14             </td><td>top20          </td><td>syafruddin     </td><td>NA             </td><td> 97            </td><td> 91            </td><td> 1784          </td><td> 1773          </td><td>22             </td><td>22             </td><td> 1443          </td><td>19             </td></tr>
	<tr><td> 3             </td><td>top10          </td><td>suryadi i.     </td><td>NA             </td><td>152            </td><td>142            </td><td> 4963          </td><td> 4955          </td><td>32             </td><td>32             </td><td> 4577          </td><td>30             </td></tr>
	<tr><td>10             </td><td>top10          </td><td>ahmaf f.       </td><td>NA             </td><td> 60            </td><td> 56            </td><td> 1531          </td><td> 1530          </td><td>21             </td><td>21             </td><td> 1431          </td><td>20             </td></tr>
	<tr><td>23             </td><td>top30          </td><td>euis h.h.      </td><td>NA             </td><td> 60            </td><td> 56            </td><td>  953          </td><td>  941          </td><td>18             </td><td>18             </td><td>  709          </td><td>16             </td></tr>
	<tr><td>19             </td><td>top20          </td><td>abdul r.       </td><td>NA             </td><td>133            </td><td>123            </td><td> 1462          </td><td> 1421          </td><td>21             </td><td>21             </td><td>  992          </td><td>17             </td></tr>
	<tr><td>45             </td><td>top50          </td><td>dondin s.      </td><td>NA             </td><td> 50            </td><td> 46            </td><td> 1218          </td><td> 1182          </td><td>12             </td><td>12             </td><td> 1015          </td><td>11             </td></tr>
	<tr><td>33             </td><td>top40          </td><td>yana m.s.      </td><td>NA             </td><td> 95            </td><td> 87            </td><td> 1001          </td><td>  986          </td><td>17             </td><td>17             </td><td>  729          </td><td>14             </td></tr>
	<tr><td>37             </td><td>top40          </td><td>felycia e.s.   </td><td>NA             </td><td> 67            </td><td> 61            </td><td> 1023          </td><td> 1021          </td><td>14             </td><td>14             </td><td>  934          </td><td>13             </td></tr>
	<tr><td> 6             </td><td>top10          </td><td>bachti a.      </td><td>NA             </td><td>111            </td><td>101            </td><td> 2632          </td><td> 2531          </td><td>26             </td><td>26             </td><td> 2161          </td><td>24             </td></tr>
	<tr><td>15             </td><td>top20          </td><td>lesmana m.     </td><td>NA             </td><td> 55            </td><td> 50            </td><td> 1093          </td><td> 1073          </td><td>19             </td><td>19             </td><td>  994          </td><td>19             </td></tr>
	<tr><td>44             </td><td>top50          </td><td>togar m.s.     </td><td>NA             </td><td> 55            </td><td> 50            </td><td> 1550          </td><td> 1550          </td><td>12             </td><td>12             </td><td> 1496          </td><td>11             </td></tr>
	<tr><td>36             </td><td>top40          </td><td>damayanti      </td><td>NA             </td><td> 42            </td><td> 38            </td><td> 1379          </td><td> 1309          </td><td>15             </td><td>14             </td><td> 1002          </td><td>13             </td></tr>
	<tr><td> 7             </td><td>top10          </td><td>biran a.       </td><td>NA             </td><td> 71            </td><td> 64            </td><td> 1673          </td><td> 1609          </td><td>25             </td><td>24             </td><td> 1254          </td><td>23             </td></tr>
	<tr><td>18             </td><td>top20          </td><td>herawati s.    </td><td>NA             </td><td> 64            </td><td> 57            </td><td> 1467          </td><td> 1395          </td><td>21             </td><td>20             </td><td> 1028          </td><td>17             </td></tr>
	<tr><td>54             </td><td>top60          </td><td>m. yasin       </td><td>NA             </td><td>104            </td><td> 92            </td><td>  488          </td><td>  479          </td><td>12             </td><td>12             </td><td>  234          </td><td> 9             </td></tr>
	<tr><td>16             </td><td>top20          </td><td>taniawati s.   </td><td>NA             </td><td> 69            </td><td> 61            </td><td> 1278          </td><td> 1172          </td><td>23             </td><td>22             </td><td>  810          </td><td>18             </td></tr>
	<tr><td>12             </td><td>top20          </td><td>danny h.n.     </td><td>NA             </td><td> 51            </td><td> 45            </td><td> 2925          </td><td> 2868          </td><td>26             </td><td>25             </td><td> 2158          </td><td>20             </td></tr>
	<tr><td>29             </td><td>top30          </td><td>arridina s.s.  </td><td>NA             </td><td> 41            </td><td> 36            </td><td> 2004          </td><td> 1982          </td><td>17             </td><td>17             </td><td> 1666          </td><td>14             </td></tr>
	<tr><td>58             </td><td>top60          </td><td>unang s.       </td><td>NA             </td><td> 57            </td><td> 50            </td><td>  323          </td><td>  285          </td><td> 9             </td><td> 9             </td><td>  203          </td><td> 7             </td></tr>
	<tr><td>43             </td><td>top50          </td><td>dwi s.         </td><td>NA             </td><td> 78            </td><td> 68            </td><td>  784          </td><td>  776          </td><td>14             </td><td>14             </td><td>  570          </td><td>12             </td></tr>
	<tr><td>35             </td><td>top40          </td><td>iskandar m.    </td><td>NA             </td><td> 57            </td><td> 48            </td><td> 1420          </td><td> 1225          </td><td>23             </td><td>21             </td><td>  545          </td><td>14             </td></tr>
	<tr><td>50             </td><td>top50          </td><td>tole s.        </td><td>NA             </td><td>127            </td><td>106            </td><td>  656          </td><td>  548          </td><td>12             </td><td>11             </td><td>  395          </td><td>10             </td></tr>
	<tr><td>20             </td><td>top20          </td><td>jatna s.       </td><td>NA             </td><td> 60            </td><td> 47            </td><td> 1220          </td><td> 1049          </td><td>60             </td><td>19             </td><td>  765          </td><td>17             </td></tr>
	<tr><td> 5             </td><td>top10          </td><td>daniel m.      </td><td>NA             </td><td> 79            </td><td> 59            </td><td> 4644          </td><td> 4123          </td><td>30             </td><td>28             </td><td> 3639          </td><td>25             </td></tr>
	<tr><td>30             </td><td>top30          </td><td>terry m.       </td><td>NA             </td><td>116            </td><td> 86            </td><td> 1821          </td><td> 1798          </td><td>20             </td><td>20             </td><td>  962          </td><td>14             </td></tr>
	<tr><td>17             </td><td>top20          </td><td>agustinus a.n. </td><td>NA             </td><td>108            </td><td> 79            </td><td> 1695          </td><td> 1621          </td><td>19             </td><td>19             </td><td> 1316          </td><td>17             </td></tr>
	<tr><td> 4             </td><td>top10          </td><td>ferry i.       </td><td>NA             </td><td>180            </td><td>131            </td><td> 3972          </td><td> 3866          </td><td>31             </td><td>31             </td><td> 2996          </td><td>26             </td></tr>
	<tr><td>25             </td><td>top30          </td><td>heru s.        </td><td>NA             </td><td> 60            </td><td> 40            </td><td> 1501          </td><td> 1481          </td><td>15             </td><td>15             </td><td> 1297          </td><td>15             </td></tr>
	<tr><td>22             </td><td>top30          </td><td>siti m.        </td><td>NA             </td><td>102            </td><td> 66            </td><td> 1164          </td><td> 1046          </td><td>19             </td><td>18             </td><td>  857          </td><td>16             </td></tr>
	<tr><td>31             </td><td>top40          </td><td>ivandini t.a.  </td><td>NA             </td><td> 56            </td><td> 33            </td><td> 1342          </td><td> 1148          </td><td>19             </td><td>16             </td><td>  874          </td><td>14             </td></tr>
	<tr><td>51             </td><td>top60          </td><td>ig. wenten     </td><td>NA             </td><td> 73            </td><td> 41            </td><td>  965          </td><td>  923          </td><td>18             </td><td>18             </td><td>  417          </td><td> 9             </td></tr>
	<tr><td>39             </td><td>top40          </td><td>nandy p.       </td><td>NA             </td><td> 68            </td><td> 38            </td><td> 3727          </td><td> 3668          </td><td>14             </td><td>14             </td><td> 3515          </td><td>12             </td></tr>
	<tr><td>34             </td><td>top40          </td><td>rachmat h.     </td><td>NA             </td><td> 88            </td><td> 49            </td><td>  844          </td><td>  793          </td><td>15             </td><td>15             </td><td>  581          </td><td>14             </td></tr>
	<tr><td>21             </td><td>top30          </td><td>mikrajudin a.  </td><td>NA             </td><td>161            </td><td> 89            </td><td> 1392          </td><td> 1243          </td><td>20             </td><td>20             </td><td>  928          </td><td>16             </td></tr>
	<tr><td>24             </td><td>top30          </td><td>sri w.         </td><td>NA             </td><td> 81            </td><td> 44            </td><td> 3354          </td><td> 3295          </td><td>17             </td><td>17             </td><td> 2924          </td><td>15             </td></tr>
	<tr><td>52             </td><td>top60          </td><td>hadiyanto      </td><td>NA             </td><td> 89            </td><td> 45            </td><td>  466          </td><td>  380          </td><td>12             </td><td>10             </td><td>  316          </td><td> 9             </td></tr>
	<tr><td>26             </td><td>top30          </td><td>asep b.d.n.    </td><td>NA             </td><td>124            </td><td> 62            </td><td> 1507          </td><td> 1439          </td><td>20             </td><td>20             </td><td> 1047          </td><td>15             </td></tr>
	<tr><td>49             </td><td>top50          </td><td>edy t.b.       </td><td>NA             </td><td>141            </td><td> 70            </td><td>  801          </td><td>  557          </td><td>15             </td><td>15             </td><td>  300          </td><td>11             </td></tr>
	<tr><td>41             </td><td>top50          </td><td>hasanuddin z.a.</td><td>NA             </td><td> 95            </td><td> 46            </td><td> 1123          </td><td> 1046          </td><td>18             </td><td>18             </td><td>  772          </td><td>12             </td></tr>
	<tr><td>56             </td><td>top60          </td><td>jamari         </td><td>NA             </td><td>108            </td><td> 47            </td><td>  292          </td><td>  240          </td><td>10             </td><td> 9             </td><td>  157          </td><td> 8             </td></tr>
	<tr><td>59             </td><td>top60          </td><td>mauridhi hp.   </td><td>NA             </td><td>227            </td><td> 95            </td><td>  584          </td><td>  319          </td><td>11             </td><td> 9             </td><td>  195          </td><td> 7             </td></tr>
	<tr><td>60             </td><td>top60          </td><td>robbi r.       </td><td>NA             </td><td> 97            </td><td> 39            </td><td>  927          </td><td>  307          </td><td>19             </td><td>10             </td><td>  125          </td><td> 7             </td></tr>
	<tr><td>55             </td><td>top60          </td><td>ansari sa.     </td><td>NA             </td><td> 88            </td><td> 35            </td><td>  702          </td><td>  321          </td><td>16             </td><td>12             </td><td>  197          </td><td> 9             </td></tr>
	<tr><td>53             </td><td>top60          </td><td>khairurrijal   </td><td>NA             </td><td>194            </td><td> 70            </td><td>  714          </td><td>  510          </td><td>12             </td><td>12             </td><td>  299          </td><td> 8             </td></tr>
	<tr><td>47             </td><td>top50          </td><td>rosari s.      </td><td>NA             </td><td>132            </td><td> 39            </td><td>  886          </td><td>  664          </td><td>14             </td><td>13             </td><td>  521          </td><td>11             </td></tr>
	<tr><td> 9             </td><td>top10          </td><td>susanto r.     </td><td>NA             </td><td>326            </td><td> 91            </td><td> 3121          </td><td> 2072          </td><td>27             </td><td>24             </td><td> 1739          </td><td>20             </td></tr>
	<tr><td>57             </td><td>top60          </td><td>wisnu j.       </td><td>NA             </td><td>131            </td><td> 29            </td><td>  785          </td><td>  367          </td><td>17             </td><td>11             </td><td>  210          </td><td> 7             </td></tr>
</tbody>
</table>




```R
# Basic scatter plot
ggplot(d, aes(x=sumdoc, y=su
              mdoc3, color=grup)) + geom_point()
```




![png](output_8_1.png)



```R
# calculating correlation
m = lm(sumdoc ~ sumdoc3, data = d)
m
```


    
    Call:
    lm(formula = sumdoc ~ sumdoc3, data = d)
    
    Coefficients:
    (Intercept)      sumdoc3  
       166.7761      -0.8362  




```R
# correlation matrix
install.packages('corrplot')
```


```R
library('corrplot')
```


```R
res = rcorr(d[,4:12])
```


```R
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)
```


```R

```
