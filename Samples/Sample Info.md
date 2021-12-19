  <style>
  table {
      width: 100%; /*表格宽度*/
      border-collapse: collapse; /*使用单一线条的边框*/
      empty-cells: show; /*单元格无内容依旧绘制边框*/
  }
	
  table th,td {
    height: 35px; /*统一每一行的默认高度*/
  }
	
  table th {
      font-weight: bold; /*加粗*/
      text-align: center !important; /*内容居中，加上 !important 避免被 Markdown 样式覆盖*/
      background: #ECF2F9; /*背景色*/
      white-space: nowrap; /*表头内容强制在一行显示*/
  }
	
  /* 隔行变色 */
  table tbody tr:nth-child(2n) {
      background: #F4F7FB; 
  }
  /* 悬浮变色 */
  table tr:hover {
      background: #B2B2B2; 
  }
	
  /* 首列不换行 */
  table td:nth-child(1) {
      white-space: nowrap; 
  }
  /* 指定列宽度 */
  table th:nth-of-type(2) {
    	width: 200px;
     white-space: nowrap;
  }
  </style>
  
### <center> Sample Information Table </center>

| Sample ID |	Age | Disease	| Disease Stage |	Smoke | Lobe	| Platform	| Aiming Reads	| PCR Cycles	| Seq Length |
| :------------: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
| LTC46 |66| Healthy	| NA	| non smoker	| RML	| Illumina® NovaSeq 6000	| 100,000 reads/cell X 10,000 cells/library	| 14	| 2 x150 | 
| LTC50	|66| Healthy	| NA	| non smoker	| Right	| Illumina® NovaSeq 6000	| 100,000 reads/cell X 10,000 cells/library	| 14	| 2 x150 | 
| LTC55	|68| Healthy	| NA	| non smoker	| RUL	| Illumina® NovaSeq 6000	| 100,000 reads/cell X 10,000 cells/library	| 14	| 2 x150 | 
| LTC22	|45| IPF ILD	| End stage	| non smoker | RLL	| Illumina® NovaSeq 6000	| 100,000 reads/cell X 10,000 cells/library	| 14	| 2 x150 | 
| LTC34	|64| IPF	| End stage	| non smoker	| RLL	| Illumina® NovaSeq 6000	| 100,000 reads/cell X 10,000 cells/library	| 14	| 2 x150 | 
| LTC52	|68| IPF	| End stage	| non smoker	| Whole lung	| Illumina® NovaSeq 6000	| 100,000 reads/cell X 10,000 cells/library	| 14	| 2 x150 | 
