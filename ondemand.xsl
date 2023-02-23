<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="ProfilesData/ondemand_ids.xsl"/>
  <!-- <xsl:import href="ondemand_ids.xsl"/> -->

  <xsl:template match="/">
	<xsl:call-template name="OnDemandScanLogFormat" />
  </xsl:template>

  <xsl:template name="OnDemandScanLogFormat">
	<xsl:text disable-output-escaping="yes"> &lt;!DOCTYPE html&gt;</xsl:text>
	<xsl:comment>Log format version "14.0.23.1"</xsl:comment>
	<html>
		<!-- <xsl:attribute name="class">
			<xsl:value-of select="ScanSession/@uiTheme" />
		</xsl:attribute> -->
	  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>
		  <xsl:value-of select="$IDS_XSL_BITDEF_LOG_FILE"/>
		</title>

		<!-- Styles section-->
		<style type="text/css">
			a {
				text-decoration:none;
			}
			
			body {
				margin:0;
				padding:40px 0;
				font-family: "Segoe UI", Arial, sans-serif;
				font-weight: normal;
				min-width:800px;
				overflow:auto;
				background-color: white;
		  	}

		  	div.imp {
				font-size: 14px;
				color: #07152d;
				line-height: 22px;
				word-break: break-all;
		  	}

			.path {
				color: #384357;
				font-size: 12px;
				line-height: 16px;
				margin-bottom: 16px;
				margin-left: 40px;
				margin-right: 40px;
			}

			hr {
				border:none;
			}

			span.label {
				color: #384357;
				padding-right: 5px;
				min-width: 236px;
				display: inline-block;
			}

			span.val {
				display: inline-block;
				overflow: hidden;
			}

			.row {
				border-bottom: 1px solid #EDEDEE;
				padding: 12px 0;
				display: flex;
				margin-left: 40px;
				margin-right: 40px;
			}

			td {
				border:0;
				padding:10px 10px 20px 10px;
				vertical-align:top;
			}

			.log-title {
				font-size: 24px;
				font-weight: bold;
				margin-bottom: 8px;
				line-height: 30px;
				color: #07152D;
				margin-left: 40px;
				margin-right: 40px;
			}

			.task-name {
				display:inline-block;
				padding-right:8px;
			}

			.h1 {
				font-size: 16px;
				line-height: 20px;
				color: #07152D;
				margin-bottom: 8px;
				margin-top: 34px;
				font-weight: bold;
				padding-left: 40px;
				padding-right: 40px;
			}

			.issues {
				height: 44px;
				font-size: 14px;
				font-weight: 600;
				line-height: 43px;
				color: #07152d;
				cursor: pointer;
				position: relative;
				background-repeat: repeat;
				positon: relative;
				background-repeat: no-repeat;
				background-position: right center;
				background-size: 52px 7px;
				background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAAHCAYAAABHlm7oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDAyIDc5LjE2NDQ2MCwgMjAyMC8wNS8xMi0xNjowNDoxNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDplZWU1ZWQ0NC1iZTg4LWM5NDEtYjQwNi0wODk0OGMyNjllMTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTI4QzAxRTM2MjQ0MTFFQkFFREVDODRBQTFGQjA3NUQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTI4QzAxRTI2MjQ0MTFFQkFFREVDODRBQTFGQjA3NUQiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MjBlNzBlYzctY2VmOS1hNDQxLWI3ZTAtMDNhNDI3MDY0OTZmIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6NTNiMTEzZGUtY2Y3ZS1jYjRmLTk5MjctYzliOTFhNGFmOGI0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+mGWZBQAAAJ9JREFUeNpitHAO52JgYIgA4nkM+EESEK84vmfFN4ZBDJiA2A2I5wBxPxAzYlHDCJWbA1U7qAELEG8A4lggXgTEPECcAcR/ofLMQDwDGjuxULWD3kMgsBSIvwLxKiAGJcFEqPh8IA4F4uCh4BlkDzFAHewDpXmhYi5QsV0MQwSwoPFBDvcA4s1QPoh9iGEIARYsYiAPuELZpxiGGAAIMABsjhpcssja8AAAAABJRU5ErkJggg==');
				padding-left: 40px;
				padding-right: 40px;
			}

			.issues#scan_paths_title {
				font-weight:  normal;
			}

			.issues.simple {
				font-weight: normal;
				background-image: none;
				cursor: default;
			}

			.issues.simple:hover {
				background-color: #fff;
				border-color: #fff;
			}

			.border-bottom {
				position: absolute;
				height: 1px;
				left: 40px;
				right: 40px;
				bottom: 0;
				background-color: #ededee;
			}


			.issues:hover {
				background-color: #f7f7f7;
			}
		
			.issues.open {
				background-color: #f7f7f7;
				background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAAHCAYAAABHlm7oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDAyIDc5LjE2NDQ2MCwgMjAyMC8wNS8xMi0xNjowNDoxNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDplZWU1ZWQ0NC1iZTg4LWM5NDEtYjQwNi0wODk0OGMyNjllMTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QUFGRjFFNTA2MjQ0MTFFQjhFNURGQjQ4QjNCOUQ3RTEiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QUFGRjFFNEY2MjQ0MTFFQjhFNURGQjQ4QjNCOUQ3RTEiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MjBlNzBlYzctY2VmOS1hNDQxLWI3ZTAtMDNhNDI3MDY0OTZmIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6NTNiMTEzZGUtY2Y3ZS1jYjRmLTk5MjctYzliOTFhNGFmOGI0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+6THxhwAAAKJJREFUeNpi/P//PwM6sHSJMAPRx/esOMUwxAATFs/YAandIAxlD10PAT3gBqR2APFBKN4BFRt6HgI6PABIbQHi9UAcAsUg9hao3NDxENDB0UBqLRAvBOI4YN75BcIgNlRsLVTNoAeMFs7hoNBfB8QTgbgI6JH/aMmQEUj1AXE+EAcB5TcMZg+xAPEuIE4BOnQeNgVQDxYCPXYZqnZQA4AAAwCkvzZrs9r/5gAAAABJRU5ErkJggg==');
			}

		
			table.grid {
				border-spacing: 0;
				border-collapse: collapse;
				width: 100%;
				margin-bottom: 16px;
				padding: 0;
				background-color: #f7f7f7;
			}

			table.grid td {
				font-size: 13px;
				color: #7f7f7f;
				vertical-align: middle;
				min-height: 20px;
				word-break: break-all;
				padding: 12px 12px;
				background-color: #f7f7f7;
				position: relative;
				border-bottom: 1px solid #ededee;
			}

			table.grid td:first-child {
				color: #384357;
				width: 60%;
				padding-left: 40px;
			}

			table.grid td:last-child {
				width: 40%;
				color: #07152D;
				padding-right: 40px;
			}

			table.grid.three thead td {
				color: #07152D;
			}

			table.grid.three tbody td {
				color: #07152D;
			}

			table.grid td.col1 {
				width:60%;
				word-wrap: break-word;
			}

			table.grid td.col2 {
				width:20%;
				word-wrap: break-word;
			}


			table.grid td.col3 {
				width:20%;
				word-wrap: break-word;
			}

			.pad {
				padding-right: 3px;
			}

			.dark body {
				background-color: #1a1d20;
				color: #ededee;
			}

			.dark div.imp {
				color: #ededee;
			}

			.dark .path {
				color: #d9d9d9;	
			}

			.dark span.label  {
				color: #d9d9d9;
			}

			.dark .row {
				border-bottom: 1px solid #34373A;
			}

			.dark .log-title {
				color: #eff1f9;
			}

			.dark .h1 {
				color: #eff1f9;
			}

			.dark .issues {
				color: #eff1f9;
				border-color: #1a1d20;
				background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAAHCAYAAABHlm7oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDAyIDc5LjE2NDQ2MCwgMjAyMC8wNS8xMi0xNjowNDoxNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDplZWU1ZWQ0NC1iZTg4LWM5NDEtYjQwNi0wODk0OGMyNjllMTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QjMyM0ZCMTQ2MjQ0MTFFQjlBRUJCNDJDMUVGMUZDNzgiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QjMyM0ZCMTM2MjQ0MTFFQjlBRUJCNDJDMUVGMUZDNzgiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MjBlNzBlYzctY2VmOS1hNDQxLWI3ZTAtMDNhNDI3MDY0OTZmIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6NTNiMTEzZGUtY2Y3ZS1jYjRmLTk5MjctYzliOTFhNGFmOGI0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+jo5QwgAAAJ9JREFUeNpifPv2HRcDA0MEEM9jwA+SgHiFkJDgN4ZBDJiA2A2I5wBxPxAzYlHDCJWbA1U7qAELEG8A4lggXgTEPECcAcR/ofLMQDwDGjuxULWD3kMgsBSIvwLxKiAGJcFEqPh8IA4F4uCh4BlkDzFAHewDpXmhYi5QsV0MQwSwoPFBDvcA4s1QPoh9iGEIARYsYiAPuELZpxiGGAAIMADKrhpcXBFIzgAAAABJRU5ErkJggg==')
			}

			.dark .border-bottom {
				background-color: #34373A;
			}

			.dark .issues:hover {
				background-color: #34373a;
				border-color: #34373a;
			}

			.dark .issues.open {
				background-color: #34373a;
				border-color: #34373a;
				background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAAHCAYAAABHlm7oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDAyIDc5LjE2NDQ2MCwgMjAyMC8wNS8xMi0xNjowNDoxNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDplZWU1ZWQ0NC1iZTg4LWM5NDEtYjQwNi0wODk0OGMyNjllMTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QkY3OEMyQjU2MjQ0MTFFQjhFM0I5QkZBODI4NTE5ODAiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QkY3OEMyQjQ2MjQ0MTFFQjhFM0I5QkZBODI4NTE5ODAiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MjBlNzBlYzctY2VmOS1hNDQxLWI3ZTAtMDNhNDI3MDY0OTZmIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6NTNiMTEzZGUtY2Y3ZS1jYjRmLTk5MjctYzliOTFhNGFmOGI0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+5IL8fQAAAJRJREFUeNpi/P//PwM6ePfuvRmIFhISPMUwxAATFs/YAandIAxlD10PAT3gBqR2APFBKN4BFRt6HgI6PABIbQHi9UAcAsUg9hao3NDxENDB0UBqLRAvBOI4YN75BcIgNlRsLVTN4Adv374LAOJ/QNwPxIygQgIZg8SgciA1Aejygw2DHMwFxEmEFILUgNQOdg8BBBgAbQdmOJvKEhQAAAAASUVORK5CYII=')
			}

			.dark .issues.simple {
				font-weight: normal;
				background-image: none;
				cursor: default;
			}

			.dark .issues.simple:hover {
				background-color: #1a1d20;
				border-color: #1a1d20;
			} 


			.dark table.grid {
				background-color: #34373a;
			}

			.dark table.grid td {
				color: #9e9fa4;
				background-color: #34373a;
				border-bottom: none;
				border-bottom: #212426;
			}

			.dark table.grid td:last-child {
				color: #9e9fa4;
			}

			.dark table.grid.three thead td {
				color: #9e9fa4;
			}

			.dark table.grid.three tbody td {
				color: #9e9fa4;
			}


		</style>

		<script type="text/javascript">
		<![CDATA[

			function doMenu(item) {
				var obj=document.getElementById(item);
				var title=document.getElementById(item+"_title");

				if (obj.style.display=="none") {
					obj.style.display="table";
					title.className="issues open";
				} else {
					obj.style.display="none";
					title.className ="issues";
				}
			}

		]]>
		</script>

	  </head>
	<body>
		<xsl:variable name="scannedItems"
			select="number(/ScanSession/ScanSummary/@scannedArchives)+
			number(/ScanSession/ScanSummary/@scannedPacked) +
			sum(/ScanSession/ScanSummary/TypeSummary/@scanned)" />
	   
		<!-- The scan session -->
		<div class="imp">
			<xsl:for-each select="ScanSession">
				<div class="log-title"><!-- Heading with the general information about the scan log -->
					<span class="task-name"><xsl:value-of select="@name" /></span> 
					<xsl:value-of select="$IDS_XSL_BITDEF_LOG_FILE"/>
				</div>

				<div class="path"><xsl:value-of select="@originalPath"/></div>

				<div class="row">
					<span class="label"><xsl:value-of select="$IDS_XSL_LOG_DATE"/></span>
					<span class="val"><xsl:value-of select="@creationDate"/></span>
				</div>

			</xsl:for-each>
		</div>

		<xsl:if test="count(/ScanSession/ScanSettings/ScanPaths/path) &lt; 1">
			<div class="issues simple">
				<span class="label"><xsl:value-of select="$IDS_XSL_SCAN_SUMM_SCANNED"/></span>
				<span><xsl:value-of select="$scannedItems" /></span>
				<div class="border-bottom"></div>
			</div>
		</xsl:if>


		<xsl:if test="count(/ScanSession/ScanSettings/ScanPaths/path) &gt; 0">
			<div class="issues" id="scan_paths_title" onclick="doMenu('scan_paths')">
				<span class="label"><xsl:value-of select="$IDS_XSL_SCAN_SUMM_SCANNED"/></span>
				<span><xsl:value-of select="$scannedItems" /></span>
				<div class="border-bottom"></div>
			</div>

			<table id="scan_paths" class="grid" style="display: none;">
				<xsl:for-each select="ScanSession/ScanSettings/ScanPaths/path">
					<tr><td>
						<xsl:value-of select="@id"/> <xsl:value-of select="text()"/>
					</td></tr>
				</xsl:for-each>
			</table>
		</xsl:if>

		<xsl:if test="(count(/ScanSession/ScanDetails/UnresolvedDetails/Item) &gt; 0) or
					  (count(/ScanSession/ScanDetails/ResolvedDetails/Item) &gt; 0) or
					  (count(/ScanSession/ScanDetails/IgnoredDetails/Item) &gt; 0) or
					  (count(/ScanSession/ScanDetails/QuickScanDetails/Item) &gt; 0) or
					  (count(/ScanSession/ScanDetails/NotScannedDetails/Item) &gt; 0)"> <!-- todo remove -->

			<div  class="h1" ><xsl:value-of select="$IDS_XSL_SCAN_RESULTS"/></div>

				<xsl:if test="(count(/ScanSession/ScanDetails/UnresolvedDetails/Item[not(@failReason = 4)]) &gt; 0) or
								  (count(/ScanSession/ScanDetails/QuickScanDetails/Item) &gt; 0)"> <!-- Scan Details / Remaining problems-->
						
				<div  class="issues" onclick="doMenu('unresolved_details');" id="unresolved_details_title">
					<xsl:value-of select="$IDS_XSL_DETAIL_REMAINING"/>
					<div class="border-bottom"></div>
				</div>

				 <table id="unresolved_details" class="grid three" style="display:none;">
					<thead>
					  <tr>
						<td class="col1">
						  <xsl:value-of select="$IDS_XSL_DETAIL_NAME"/>
						</td>
						<td class="col2">
						  <xsl:value-of select="$IDS_XSL_DETAIL_THREAT"/>
						</td>
						<td class="col3">
						  <xsl:value-of select="$IDS_XSL_DETAIL_STATUS"/>
						</td>
					  </tr>
					</thead>

					<tbody>
						  <xsl:for-each select="/ScanSession/ScanDetails/UnresolvedDetails/Item">
							<xsl:if test="not(@failReason = 4)">
								<xsl:call-template name="MakeAffectedItemRow">
								  <xsl:with-param name="path">
									<xsl:value-of select="@path"/>
								  </xsl:with-param>
								  <xsl:with-param name="threat">
									<xsl:value-of select="@threatName"/>
								  </xsl:with-param>
								  <xsl:with-param name="threatType">
								   <xsl:value-of select="@threatType"/>
								  </xsl:with-param>
								  <xsl:with-param name="initialStatus">
									<xsl:value-of select="@initialStatus"/>
								  </xsl:with-param>
								  <xsl:with-param name="finalStatus">
									<xsl:value-of select="@finalStatus"/>
								  </xsl:with-param>
								  <xsl:with-param name="error">
									<xsl:value-of select="@failReason"/>
								  </xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						  </xsl:for-each>

						  <xsl:for-each select="/ScanSession/ScanDetails/QuickScanDetails/Item">
							<xsl:call-template name="MakeAffectedItemRow">
							  <xsl:with-param name="path">
								<xsl:value-of select="@path"/>
							  </xsl:with-param>
							  <xsl:with-param name="threat">
								<xsl:value-of select="@threatName"/>
							  </xsl:with-param>
							  <xsl:with-param name="threatType">
								<xsl:value-of select="@threatType"/>
							  </xsl:with-param>
							  <xsl:with-param name="initialStatus">
								<xsl:value-of select="@initialStatus"/>
							  </xsl:with-param>
							  <xsl:with-param name="finalStatus">
								<xsl:value-of select="@finalStatus"/>
							  </xsl:with-param>
							  <xsl:with-param name="error">
								<xsl:value-of select="@failReason"/>
							  </xsl:with-param>
							</xsl:call-template>
						  </xsl:for-each>
						</tbody>
					  </table>
				</xsl:if>

				<xsl:if test="count(/ScanSession/ScanDetails/ResolvedDetails/Item) &gt; 0"><!-- Scan Details / Ignored problems-->

					<div class="issues" onclick="doMenu('resolved_details');" id="resolved_details_title">
						<xsl:value-of select="$IDS_XSL_DETAIL_RESOLVED"/>
					</div>

					<table class="grid three" id="resolved_details" style="display:none;">
					  <thead>
						   <tr>
								<td class="col1" width="100%">
								  <xsl:value-of select="$IDS_XSL_DETAIL_NAME"/>
								</td>
								<td class="col2">
								  <xsl:value-of select="$IDS_XSL_DETAIL_THREAT"/>
								</td>
								<td class="col3">
								  <xsl:value-of select="$IDS_XSL_DETAIL_STATUS"/>
								</td>
						   </tr>
					   </thead>
						<tbody>
						  <xsl:for-each select="/ScanSession/ScanDetails/ResolvedDetails/Item">
							<xsl:call-template name="MakeAffectedItemRow">
							  <xsl:with-param name="path">
								<xsl:value-of select="@path"/>
							  </xsl:with-param>
							  <xsl:with-param name="threat">
								<xsl:value-of select="@threatName"/>
							  </xsl:with-param>
							  <xsl:with-param name="threatType">
								<xsl:value-of select="@threatType"/>
							  </xsl:with-param>
							  <xsl:with-param name="initialStatus">
								<xsl:value-of select="@initialStatus"/>
							  </xsl:with-param>
							  <xsl:with-param name="finalStatus">
								<xsl:value-of select="@finalStatus"/>
							  </xsl:with-param>
							  <xsl:with-param name="error">
								<xsl:value-of select="@failReason"/>
							  </xsl:with-param>
							</xsl:call-template>
						  </xsl:for-each>
						</tbody>
				  </table>
				</xsl:if>


				<xsl:if test="count(/ScanSession/ScanDetails/IgnoredDetails/Item) &gt; 0"><!-- Scan Details / Ignored problems-->
					<div class="issues" onclick="doMenu('ignored_details');" id="ignored_details_title">
						<xsl:value-of select="$IDS_XSL_DETAIL_IGNORED"/>
						<div class="border-bottom"></div>
					</div>

				  <table class="grid three" id="ignored_details" style="display:none;">
					<thead>
					  <tr>
						<td class="col1">
						  <xsl:value-of select="$IDS_XSL_DETAIL_NAME"/>
						</td>
						<td class="col2">
						  <xsl:value-of select="$IDS_XSL_DETAIL_THREAT"/>
						</td>
						<td class="col3">
						  <xsl:value-of select="$IDS_XSL_DETAIL_STATUS"/>
						</td>
					  </tr>
					</thead>

					<tbody>
					  <xsl:for-each select="ScanSession/ScanDetails/IgnoredDetails/Item">
						<xsl:call-template name="MakeAffectedItemRow">
						  <xsl:with-param name="path">
							<xsl:value-of select="@path"/>
						  </xsl:with-param>
						  <xsl:with-param name="threat">
							<xsl:value-of select="@threatName"/>
						  </xsl:with-param>
						  <xsl:with-param name="threatType">
							<xsl:value-of select="@threatType"/>
						  </xsl:with-param>
						  <xsl:with-param name="initialStatus">
							<xsl:value-of select="@initialStatus"/>
						  </xsl:with-param>
						  <xsl:with-param name="finalStatus">
							<xsl:value-of select="@finalStatus"/>
						  </xsl:with-param>
						  <xsl:with-param name="error">
							<xsl:value-of select="@failReason"/>
						  </xsl:with-param>
						</xsl:call-template>
					  </xsl:for-each>
					</tbody>
				  </table>
				</xsl:if>

				<xsl:if test="(count(/ScanSession/ScanDetails/NotScannedDetails/Item) &gt; 0) or
							  (count(/ScanSession/ScanDetails/UnresolvedDetails/Item[@failReason = 4]) &gt; 0)"><!-- Scan Details / Objects that were not scanned-->


					<div class="issues" onclick="doMenu('not_scanned_details');" id="not_scanned_details_title">
						<xsl:value-of select="$IDS_XSL_DETAIL_NOT_SCANNED"/>
						<div class="border-bottom"></div>
					</div>

				  <table class="grid three" id="not_scanned_details" style="display:none;">
					<thead>
					  <tr>
						<td class="col1">
						  <xsl:value-of select="$IDS_XSL_DETAIL_NAME"/>
						</td>
						<td class="col2">
						  <xsl:value-of select="$IDS_XSL_DETAIL_REASON"/>
						</td>
						<td class="col3">
						  <xsl:value-of select="$IDS_XSL_DETAIL_STATUS"/>
						</td>
					  </tr>
					</thead>

					<tbody>
					  <xsl:for-each select="/ScanSession/ScanDetails/UnresolvedDetails/Item">
						<xsl:if test="@failReason = 4">
							<xsl:call-template name="MakeAffectedItemRow">
							  <xsl:with-param name="path">
								<xsl:value-of select="@path"/>
							  </xsl:with-param>
							  <xsl:with-param name="threat">
								<xsl:value-of select="@threatName"/>
							  </xsl:with-param>
							  <xsl:with-param name="threatType">
							   <xsl:value-of select="@threatType"/>
							  </xsl:with-param>
							  <xsl:with-param name="initialStatus">
								<xsl:value-of select="@initialStatus"/>
							  </xsl:with-param>
							  <xsl:with-param name="finalStatus">
								<xsl:value-of select="@finalStatus"/>
							  </xsl:with-param>
							  <xsl:with-param name="error">
								<xsl:value-of select="@failReason"/>
							  </xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					  </xsl:for-each>
					  <xsl:for-each select="ScanSession/ScanDetails/NotScannedDetails/Item">
						<xsl:call-template name="MakeAffectedItemRow">
						  <xsl:with-param name="path">
							<xsl:value-of select="@path"/>
						  </xsl:with-param>
						  <xsl:with-param name="threat">
							<xsl:value-of select="@threatName"/>
						  </xsl:with-param>
						  <xsl:with-param name="threatType">
							<xsl:value-of select="@threatType"/>
						  </xsl:with-param>
						  <xsl:with-param name="initialStatus">
							<xsl:value-of select="@initialStatus"/>
						  </xsl:with-param>
						  <xsl:with-param name="finalStatus">
							<xsl:value-of select="@finalStatus"/>
						  </xsl:with-param>
						  <xsl:with-param name="error">
							<xsl:value-of select="@failReason"/>
						  </xsl:with-param>
						</xsl:call-template>
					  </xsl:for-each>
					</tbody>
				  </table>
			</xsl:if>
		</xsl:if>




		<div class="h1">
			<xsl:value-of select="$IDS_XSL_SCAN_SUMMARY_DETAILED"/>
		</div> 
		<!-- Detailed scan summary -->

		<xsl:variable name="resolvedItems"
					select="sum(/ScanSession/ScanSummary/TypeSummary/@disinfected) +
								sum(/ScanSession/ScanSummary/TypeSummary/@deleted) +
								sum(/ScanSession/ScanSummary/TypeSummary/@moved)" />

		<xsl:variable name="infectedItems" select="sum(/ScanSession/ScanSummary/TypeSummary/@infected)" />
		<xsl:variable name="suspiciousItems" select="sum(/ScanSession/ScanSummary/TypeSummary/@suspicious)" />
		<xsl:variable name="unresolvedItems" select="$infectedItems + $suspiciousItems - $resolvedItems" />

		
		<div class="issues" onclick="doMenu('summ_basic');" id="summ_basic_title"><!-- Basic -->
			<xsl:value-of select="$IDS_XSL_SCAN_SUMMARY_BASIC"/>
			<div class="border-bottom"></div>
		</div>
				
		<!-- table basic -->
		<table id="summ_basic" class="grid" style="display:none;">
			<tr>  
				<td>
					<xsl:value-of select="$IDS_XSL_SCAN_SUMM_SCANNED"/>
				</td>
				<td>
					<xsl:value-of select="$scannedItems"/><span class="pad"></span>
					<xsl:if test="$scannedItems=0">
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_SCANNED_NONE"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:value-of select="$IDS_XSL_SCAN_SUMM_INFECTED"/>
				</td>
				<td>
					<xsl:value-of select="$infectedItems"/><span class="pad"></span>
					<xsl:if test="$infectedItems=0">
					<xsl:value-of select="$IDS_XSL_SCAN_SUMM_INFECTED_NONE"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:value-of select="$IDS_XSL_SCAN_SUMM_SUSPECT"/>
				</td>
				<td>
					<xsl:value-of select="$suspiciousItems"/><span class="pad"></span>
					<xsl:if test="$suspiciousItems=0">
					<xsl:value-of select="$IDS_XSL_SCAN_SUMM_SUSPECT_NONE"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:value-of select="$IDS_XSL_SCAN_SUMM_RESOLVED"/>
				</td>
				<td>
					<xsl:value-of select="$resolvedItems"/><span class="pad"></span>
					<xsl:if test="$resolvedItems=0">
					<xsl:choose>
						<xsl:when test="$unresolvedItems &gt; 0">
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_RESOLVED_NONE_THREATS"/>
						</xsl:when>
						<xsl:otherwise>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_RESOLVED_NONE"/>
						</xsl:otherwise>
					</xsl:choose>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:value-of select="$IDS_XSL_SCAN_SUMM_UNRESOLVED"/>
				</td>
				<td>
					<xsl:if test="$unresolvedItems &lt; 0">
					0
					</xsl:if>
					<xsl:if test="$unresolvedItems &gt; 0">
					<xsl:value-of select="$unresolvedItems"/>
					</xsl:if>
					<xsl:if test="$unresolvedItems=0">
					0
					<xsl:value-of select="$IDS_XSL_SCAN_SUMM_UNRESOLVED_NONE"/>
					</xsl:if>
				</td>
			</tr>
		</table>



			<div class="issues" onclick="doMenu('summ_advanced');" id="summ_advanced_title"><!-- Advanced -->
				<xsl:value-of select="$IDS_XSL_SCAN_SUMMARY_ADVANCED"/>
				<div class="border-bottom"></div>
			</div>

			<table id="summ_advanced" style="display:none;" class="grid">
				<xsl:variable name="scanTime" select="floor(/ScanSession/ScanSummary/@duration div 1000)" />
				<xsl:variable name="hours" select="floor($scanTime div 3600)" />
				<xsl:variable name="minutes" select="floor(($scanTime mod 3600) div 60)" />
				<xsl:variable name="seconds" select="$scanTime mod 60" />
				<xsl:variable name="fps" select="floor($scannedItems div $scanTime)" />
				 <tr>
					<td>
						
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_TIME"/>
					</td>
					<td>
						<xsl:number format="01" value="$hours"/>:<xsl:number format="01" value="$minutes"/>:<xsl:choose>
						<xsl:when test="$scanTime = 0">01</xsl:when><xsl:otherwise><xsl:number format="01" value="$seconds"/></xsl:otherwise></xsl:choose>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_FPS"/>
					</td>
					<td>
						<xsl:choose>
						<xsl:when test="$scanTime = 0">
							<xsl:value-of select="$scannedItems"/>
						</xsl:when>
						<xsl:when test="($fps &lt; 1) and ($scannedItems = 0) ">
							0
						</xsl:when>
						<xsl:when test="($fps &lt; 1) and ($scannedItems &gt; 0) ">
							1
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$fps"/>
						</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_SMARTSCANNED"/>
					</td>
					<td>
						<xsl:value-of select="/ScanSession/ScanDetails/NotScannedDetails/@skipped"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_PASS_PROT"/>
					</td>
					<td>
						<xsl:value-of select="/ScanSession/ScanDetails/NotScannedDetails/@passwordProtected"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_ARCH_BOMBS"/>
					</td>
					<td>
						<xsl:value-of select="/ScanSession/ScanDetails/NotScannedDetails/@archiveBombs"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_ARCHIVES"/>
					</td>
					<td>
						<xsl:value-of select="/ScanSession/ScanSummary/@scannedArchives"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_ERRORS"/>
					</td>
					<td>
						<xsl:value-of select="/ScanSession/ScanDetails/NotScannedDetails/@ioerrors"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_BOOT"/>
					</td>
					<td>
					   <xsl:value-of select="/ScanSession/ScanSummary/TypeSummary[@type=1]/@scanned"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_PROC_SCANNED"/>
					</td>
					<td>
					   <xsl:value-of select="/ScanSession/ScanSummary/TypeSummary[@type=2]/@scanned"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_PROC_INFECTED"/>
					</td>
					<td>
					   <xsl:value-of select="/ScanSession/ScanSummary/TypeSummary[@type=2]/@infected"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_REG_SCANNED"/>
					</td>
					<td>
					   <xsl:value-of select="/ScanSession/ScanSummary/TypeSummary[@type=3]/@scanned"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_REG_INFECTED"/>
					</td>
					<td>
					   <xsl:value-of select="/ScanSession/ScanSummary/TypeSummary[@type=3]/@infected"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_COOK_SCANNED"/>
					</td>
					<td>
					   <xsl:value-of select="/ScanSession/ScanSummary/TypeSummary[@type=4]/@scanned"/>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SUMM_COOK_INFECTED"/>
					</td>
					<td>
					   <xsl:value-of select="/ScanSession/ScanSummary/TypeSummary[@type=4]/@infected"/>
					</td>
				</tr>
			</table>

			<!-- Scan options -->
			<div class="h1" ><xsl:value-of select="$IDS_XSL_SCAN_OPTIONS"/></div>
			
		  	<div class="issues" onclick="doMenu('summ_threat_options');" id="summ_threat_options_title"><!-- The selected threat options -->
				<xsl:value-of select="$IDS_XSL_SCAN_THREATS_OPTIONS"/>
				<div class="border-bottom"></div>
		  	</div>

			<table id="summ_threat_options" class="grid" style="display:none;">
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_VIRUSES"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
				  		<xsl:with-param name="condition">
							1
				  		</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_ADWARE"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
				  		<xsl:with-param name="condition">
						<xsl:value-of select="/ScanSession/ScanSettings/@scanAdware"/>
				  		</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_SPYWARE"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
				  		<xsl:with-param name="condition">
						<xsl:value-of select="/ScanSession/ScanSettings/@scanSpyware"/>
				  		</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_APPLICATIONS"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
				  		<xsl:with-param name="condition">
						<xsl:value-of select="/ScanSession/ScanSettings/@scanApplications"/>
				  		</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_DIALERS"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
				  		<xsl:with-param name="condition">
						<xsl:value-of select="/ScanSession/ScanSettings/@scanDialers"/>
				  		</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_ROOTKITS"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
				  		<xsl:with-param name="condition">
						<xsl:value-of select="/ScanSession/ScanSettings/@scanAllRootkits"/>
				  		</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_SCAN_KEYLOGGERS"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
				  		<xsl:with-param name="condition">
						<xsl:value-of select="/ScanSession/ScanSettings/@scanKeyloggers"/>
				  		</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</table>

			<div class="issues" onclick="doMenu('summ_target_sel');" id="summ_target_sel_title"><!-- Scan Options / Target Selection -->
				<xsl:value-of select="$IDS_XSL_TARGET_SEL"/>
				<div class="border-bottom"></div>
			</div>

			<table class="grid" id="summ_target_sel" style="display:none;">
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_REGISTRY"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
						<xsl:with-param name="condition">
						  <xsl:value-of select="/ScanSession/ScanSettings/@scanRegistry"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_COOKIES"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
						<xsl:with-param name="condition">
						  <xsl:value-of select="/ScanSession/ScanSettings/@scanCookies"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_BOOT"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
						<xsl:with-param name="condition">
						  <xsl:value-of select="/ScanSession/ScanSettings/@scanBoot"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_MEMORY"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
						<xsl:with-param name="condition">
						  <xsl:value-of select="/ScanSession/ScanSettings/@scanMemory"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_ARCHIVES"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
						<xsl:with-param name="condition">
						  <xsl:value-of select="/ScanSession/ScanSettings/@scanArchives"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_PACKERS"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
						<xsl:with-param name="condition">
						  <xsl:value-of select="/ScanSession/ScanSettings/@scanPacked"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_EMAILS"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
						<xsl:with-param name="condition">
						  <xsl:value-of select="/ScanSession/ScanSettings/@scanEmails"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_ALL_FILES"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
						<xsl:with-param name="condition">
						  <xsl:value-of select="/ScanSession/ScanSettings/@scanAllFiles"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_HEURISTIC"/>
					</td>
					<td>
						<xsl:call-template name="YesNo">
						<xsl:with-param name="condition">
						  1
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_INC_EXT"/>
					</td>
					<td>
						<xsl:value-of select="/ScanSession/ScanSettings/@userDefinedExtensions"/>
						<xsl:if test="string-length(/ScanSession/ScanSettings/@userDefinedExtensions)=0">
						<xsl:value-of select="$IDS_XSL_TARGET_INCL_EXT_NONE"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_TARGET_EXCL_EXT"/>
					</td>
					<td>
						<xsl:value-of select="/ScanSession/ScanSettings/@excludeExtensions"/>
						<xsl:if test="string-length(/ScanSession/ScanSettings/@excludeExtensions)=0">
						<xsl:value-of select="$IDS_XSL_TARGET_EXCL_EXT_NONE"/>
						</xsl:if>
					</td>
				</tr>
			</table>

			<div class="issues" onclick="doMenu('summ_target_proc');" id="summ_target_proc_title"><!-- Scan Options / Target Processing -->
				<xsl:value-of select="$IDS_XSL_TARGET_PROCESSING"/>
				<div class="border-bottom"></div>
			</div>

			<table id="summ_target_proc" class="grid" style="display:none;">
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_ACTION_INFECTED_FIRST"/>
					</td>
					<td>
						<xsl:call-template name="FormatScanAction">
						<xsl:with-param name="action">
						  <xsl:value-of select="/ScanSession/ScanSettings/@infectedAction1"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_ACTION_INFECTED_SECOND"/>
					</td>
					<td>
						<xsl:call-template name="FormatScanAction">
						<xsl:with-param name="action">
						  <xsl:value-of select="/ScanSession/ScanSettings/@infectedAction2"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_ACTION_SUSPECT_FIRST"/>
					</td>
					<td>
						<xsl:call-template name="FormatScanAction">
						<xsl:with-param name="action">
						  <xsl:value-of select="/ScanSession/ScanSettings/@suspectAction1"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_ACTION_SUSPECT_SECOND"/>
					</td>
					<td>
						<xsl:call-template name="FormatScanAction">
						<xsl:with-param name="action">
						  <xsl:value-of select="/ScanSession/ScanSettings/@suspectAction2"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_ACTION_HIDDEN"/>
					</td>
					<td>
						<xsl:call-template name="FormatScanAction">
						<xsl:with-param name="action">
						  <xsl:value-of select="/ScanSession/ScanSettings/@rootkitAction"/>
						</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$IDS_XSL_ACTION_PASS_PROT"/>
					</td>
					<td>
						<xsl:choose>
						<xsl:when test="/ScanSession/ScanSettings/@passwordPrompt = '0'">
						  <xsl:value-of select="$IDS_XSL_ACTION_LOG_NOT_SCAN"/>
						</xsl:when>
						<xsl:otherwise>
						  <xsl:value-of select="$IDS_XSL_ACTION_PROMPT_PASS"/>
						</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>

			<div class="issues" onclick="doMenu('summ_engines');" id="summ_engines_title"><!-- Scan Options / Engines Summary -->
				<xsl:value-of select="$IDS_XSL_SCAN_ENGINES"/>
				<div class="border-bottom"></div>
			</div>

			<table id="summ_engines" class="grid" style="display:none;">
				<tr>
					<td>
			  			<xsl:value-of select="$IDS_XSL_ENGINE_SIGN"/>
			  		</td>
			  		<td>
			  			<xsl:value-of select="/ScanSession/EngineSummary/@totalSignatures"/>
			  		</td>
			  	</tr>
			</table>
	  </body>
	</html>
  </xsl:template>


  <!-- Scan action formatting template -->
  <xsl:template name="FormatScanAction">
	<xsl:param name="action"/>

	<xsl:choose>

	  <xsl:when test="$action = '0'">
		<xsl:value-of select="$IDS_XSL_ACTION_NONE"/>
	  </xsl:when>

	  <xsl:when test="$action = '1'">
		<xsl:value-of select="$IDS_XSL_ACTION_NONE"/>
	  </xsl:when>

	  <xsl:when test="$action = '2'">
		<xsl:value-of select="$IDS_XSL_ACTION_ABORT"/>
	  </xsl:when>

	  <xsl:when test="$action = '3'">
		<xsl:value-of select="$IDS_XSL_ACTION_DISINFECT"/>
	  </xsl:when>

	  <xsl:when test="$action = '4'">
		<xsl:value-of select="$IDS_XSL_ACTION_RENAME"/>
	  </xsl:when>

	  <xsl:when test="$action = '5'">
		<xsl:value-of select="$IDS_XSL_ACTION_DELETE"/>
	  </xsl:when>

	  <xsl:when test="$action = '6'">
		<xsl:value-of select="$IDS_XSL_ACTION_QUAR_COPY"/>
	  </xsl:when>

	  <xsl:when test="$action = '7'">
		<xsl:value-of select="$IDS_XSL_ACTION_QUAR_MOVE"/>
	  </xsl:when>

	  <xsl:otherwise>
		<xsl:value-of select="$IDS_XSL_ACTION_NONE"/>
	  </xsl:otherwise>

	</xsl:choose>
  </xsl:template>


  <!-- Translation of finalStatus and error into human readable messages -->
  <xsl:template name="TranslateStatus">
	<xsl:param name="threatType" />
	<xsl:param name="initialStatus" />
	<xsl:param name="finalStatus" />
	<xsl:param name="error"/>

	<xsl:choose>

	  <xsl:when test="$threatType = 7">
		<xsl:value-of select="$IDS_XSL_STATUS_NOT_SCANNED"/>
		<xsl:value-of select="$IDS_XSL_STATUS_ERROR_ARCHIVE_BOMB"/>
	  </xsl:when>

	  <xsl:when test="$error = 4">
		<xsl:value-of select="$IDS_XSL_STATUS_NOT_SCANNED"/>
		<xsl:value-of select="$IDS_XSL_STATUS_ERROR_ARCHIVE_BOMB"/>
	  </xsl:when>

	  <xsl:when test="($error = 5) or ($finalStatus = 10)">
		<xsl:value-of select="$IDS_XSL_STATUS_NOT_SCANNED"/>
		<xsl:value-of select="$IDS_XSL_STATUS_ERROR_PASSWORD_PROTECTED"/>
	  </xsl:when>

	  <xsl:otherwise>
		<xsl:choose>

		  <xsl:when test="($finalStatus = 1) or ($finalStatus = 2) or ($finalStatus = 5) or
					  ($finalStatus = 6) or ($finalStatus = 9) or ($finalStatus = 11)">
			<xsl:choose>

			  <xsl:when test="($finalStatus = 1) and ($initialStatus = 7)">
				<xsl:value-of select="$IDS_XSL_STATUS_UNHIDDEN"/>
			  </xsl:when>

			  <xsl:when test="$finalStatus = 1">
				<xsl:value-of select="$IDS_XSL_STATUS_CLEAN"/>
			  </xsl:when>

			  <xsl:when test="$finalStatus = 2">
				<xsl:value-of select="$IDS_XSL_STATUS_DISINFECTED"/>
			  </xsl:when>

			  <xsl:when test="$finalStatus = 5">
				<xsl:value-of select="$IDS_XSL_STATUS_DELETED"/>
			  </xsl:when>

			  <xsl:when test="$finalStatus = 6">
				<xsl:value-of select="$IDS_XSL_STATUS_QUARANTINED"/>
			  </xsl:when>

			  <xsl:when test="$finalStatus = 9">
				<xsl:value-of select="$IDS_XSL_STATUS_DELETED_REBOOT"/>
			  </xsl:when>

			  <xsl:when test="$finalStatus = 11">
			  <xsl:value-of select="$IDS_XSL_STATUS_QUARANTINED_REBOOT"/>
			  </xsl:when>
			</xsl:choose>
		  </xsl:when>

		  <xsl:otherwise>
			<xsl:choose>

			  <xsl:when test="$finalStatus = 0">
				<xsl:choose>
				  <xsl:when test="$initialStatus = 3">
					<xsl:value-of select="$IDS_XSL_STATUS_INFECTED"/>
				  </xsl:when>
				  <xsl:when test="$initialStatus = 4">
					<xsl:value-of select="$IDS_XSL_STATUS_SUSPECTED"/>
				  </xsl:when>
				  <xsl:when test="$initialStatus = 7">
					<xsl:value-of select="$IDS_XSL_STATUS_HIDDEN"/>
				  </xsl:when>
				</xsl:choose>
				<xsl:value-of select="$IDS_XSL_STATUS_ERROR_FAIL_RESCAN"/>
			  </xsl:when>

			  <xsl:when test="$finalStatus = 3">
				<xsl:value-of select="$IDS_XSL_STATUS_INFECTED"/>
			  </xsl:when>

			  <xsl:when test="$finalStatus = 4">
				<xsl:value-of select="$IDS_XSL_STATUS_SUSPECTED"/>
			  </xsl:when>

			  <xsl:when test="$finalStatus = 7">
				<xsl:value-of select="$IDS_XSL_STATUS_HIDDEN"/>
			  </xsl:when>
			</xsl:choose>

			<xsl:choose>
			  <xsl:when test="$error = 3">
				<xsl:value-of select="$IDS_XSL_STATUS_ERROR_IGNORED_FIX_RIGHTS"/>
			  </xsl:when>
			  <xsl:when test="$error = 6">
				<xsl:value-of select="$IDS_XSL_STATUS_ERROR_FAIL_REPACK"/>
			  </xsl:when>
			</xsl:choose>
		  </xsl:otherwise>

		</xsl:choose>
	  </xsl:otherwise>

	</xsl:choose>
  </xsl:template>

  <!-- Make a row using all the information -->
  <xsl:template name="MakeAffectedItemRow" >
	<xsl:param name="path" />
	<xsl:param name="threat" />
	<xsl:param name="threatType" />
	<xsl:param name="initialStatus" />
	<xsl:param name="finalStatus" />
	<xsl:param name="error" />

	<tr>

	  <!-- object name -->
	  <td>
		<xsl:value-of select="$path"/>
	  </td>

	  <!-- threat name -->
	  <td>
		  <xsl:choose>
			  <xsl:when test="string-length($threat)=0">
				<xsl:choose>
					<xsl:when test="$initialStatus = 7">
						<xsl:value-of select="$IDS_XSL_THREAT_NAME_ROOTKITS"/>
					</xsl:when>
					<xsl:when test="$error = 4">
						<xsl:value-of select="$IDS_XSL_THREAT_NAME_ARCHIVE_BOMB"/>
					</xsl:when>
					<xsl:when test="$threatType = 7">
						<xsl:value-of select="$IDS_XSL_THREAT_NAME_ARCHIVE_BOMB"/>
					</xsl:when>
					<xsl:when test="($error = 5) or ($finalStatus = 10)">
						<xsl:value-of select="$IDS_XSL_THREAT_NAME_PASSWORD_PROT"/>
					</xsl:when>
				</xsl:choose>
			  </xsl:when>
			  <xsl:otherwise>
				<xsl:value-of select="$threat"/>
			  </xsl:otherwise>
		  </xsl:choose>
	  </td>

	  <!-- final status -->
	  <td>

		<xsl:call-template name="TranslateStatus">
		  <xsl:with-param name="threatType">
			<xsl:value-of select="$threatType"/>
		  </xsl:with-param>
		  <xsl:with-param name="initialStatus">
			<xsl:value-of select="$initialStatus"/>
		  </xsl:with-param>
		  <xsl:with-param name="finalStatus">
			<xsl:value-of select="$finalStatus"/>
		  </xsl:with-param>
		  <xsl:with-param name="error">
			<xsl:value-of select="$error"/>
		  </xsl:with-param>
		</xsl:call-template>

	  </td>

	</tr>

  </xsl:template>

  <!-- Return Yes or No -->
  <xsl:template name="YesNo" >
	<xsl:param name="condition" />

	<xsl:choose>

	  <xsl:when test="$condition &gt; 0">
		<xsl:value-of select="$IDS_XSL_YES"/>
	  </xsl:when>

	  <xsl:when test="$condition &lt; 1">
		<xsl:value-of select="$IDS_XSL_NO"/>
	  </xsl:when>

	  <xsl:otherwise>
		<xsl:text></xsl:text>
	  </xsl:otherwise>

	</xsl:choose>

  </xsl:template>

</xsl:stylesheet>

<!-- vim: set ft=xslt syn=xslt nowrap nu: -->
