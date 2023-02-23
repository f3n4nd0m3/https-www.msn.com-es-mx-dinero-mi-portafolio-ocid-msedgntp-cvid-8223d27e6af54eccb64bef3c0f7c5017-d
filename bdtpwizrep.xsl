<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="bdtpwizrep_ids.xsl"/>

  <xsl:template match="/">
    <xsl:call-template name="OnDemandScanLogFormat" />
  </xsl:template>

  <xsl:template name="OnDemandScanLogFormat">
    <xsl:comment>Log format version "14.0.23.1"</xsl:comment>
    <html>
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
          body
          {
            margin:0;
            padding:10px;
            font:11px Tahoma, Arial, sans-serif;
            min-width:800px;
            overflow:auto;
          }

          div#border
          {
            border:1px #6a8a9b solid;
			padding:1px;
          }

          #container
          {
            border:0px white solid;
            margin:0;
            width:100%;
            font:11px Tahoma, Arial, sans-serif;;
            line-height:14px;
            background:#f3f3f3;
          }

          div.imp
          {
            font:bold 12px Tahoma, Arial, sans-serif;
            margin-bottom:20px;
          }
          
           td
          {
            border:0;
            padding:10px 10px 20px 10px;
            vertical-align:top;
          }
          
           .h1
          {
            background:url('file:///<xsl:value-of select="/bdtpwizrep/@installPath"/>/Skin/Default/images/uiscan_log/uiscan_log_title_bg.jpg') repeat-x top left;
            height:35px;
            font:bold 18px Tahoma, Arial, sans-serif;
            padding:0 10px;
            width:100%;
            vertical-align:middle;
			color:white;
          }
          
          .h2
          {
            height:26px;
           
            font:13px  Tahoma, Arial, sans-serif;
			font-weight:bold;
            vertical-align:middle;
            padding:0 10px;
          }
		  .h3 {
			height:22px;
            font:13px  Tahoma, Arial, sans-serif;
			font-weight:bold;
            vertical-align:middle;
            padding:0 10px;
			  }
          
          .issues
          {
            background:url('file:///<xsl:value-of select="/bdtpwizrep/@installPath"/>/Skin/Default/images/uiscan_log/uiscan_log_head_bg.jpg') repeat-x;
            font:13px  Tahoma, Arial, sans-serif;
			font-weight:bold;
            padding:4px 10px 0px 10px;
          }
          
          .issues table
          {
            margin:5px 0 10px 0;
            width:100%;
          }
		  
		  td {
			  font-size:11px;
			  }
           .issues table thead td
          {
            height:26px;
            vertical-align:middle;
            border-bottom:1px #6a8a9b solid;
            font:11px Tahoma, Arial, sans-serif;
			font-weight:bold;
            padding:5px 7px;
          }
          
          .issues table tbody td
          {
            border-bottom:1px #96b9cc solid;
            font:11px Tahoma, Arial, sans-serif;
            height:22px;
            padding:0 7px;
            vertical-align:middle;
          }
          
          *html tbody td
          {
            white-space:nowrap;
          }
          
          *+html tbody td
          {
           white-space:nowrap;
          }
          
          td.col1
          {
            width:60%;
            word-wrap: break-word;
          }
          
          td.col2
          {
            width:20%;
            word-wrap: break-word;
          }
          
          td.col3
          {
            width:20%;
            word-wrap: break-word;
          }

        </style>

	  </head>
      <body>
        <div id="border">
          <table cellpadding="0" cellspacing="0" id="container">
            
            <tr>
              <td class="h1"><!-- Heading with the general information about the scan log -->
                <xsl:value-of select="$IDS_XSL_BITDEF_LOG_FILE"/>
              </td>
            </tr>
            
           <tr>
           <td id="main">
                <br /><!-- The scan session -->
                <xsl:for-each select="bdtpwizrep">
                  <div class="imp">

                    <xsl:value-of select="$IDS_XSL_PRODUCT"/>
                    <xsl:value-of select="@creator"/>
                    <br />

                    <xsl:value-of select="$IDS_XSL_TASK_NAME"/>
                    <xsl:value-of select="@name"/>
                    <br />

                    <xsl:value-of select="$IDS_XSL_LOG_DATE"/>
                    <xsl:value-of select="@creationDate"/>
                    <br />

                  </div>
                </xsl:for-each>
            </td>
            </tr>
			
			
		<table style="width:100%;" cellpadding="0" cellspacing="0">
		
			<tr>
				<td class="h1" style="cursor:pointer;">
					<span id="xscan_summ_detailed" style="padding-right:10px;"></span>
					<xsl:value-of select="$IDS_XSL_NOT_DELETED_TASKS"/>
				</td>
			</tr>
            
			<table cellpadding="0" cellspacing="0" width="100%" style="width:100%; padding:0px;" id="scan_summ_detailed" >

				<xsl:variable name="scannedItems"
							select="number(/bdtpwizrep/DupFinderStatistics/@fn)" />
					
				<tr id="summ_basic">
					<td>
					  <xsl:value-of select="$IDS_XSL_NOT_DELETED_NUMBER"/>
					  <xsl:value-of select="$scannedItems"/>
					  <br />
				  </td>
				</tr>

				<tr>
				  <td class="issues"  style="padding-top:5px; vertical-align:top;cursor: pointer; height:26px;"><!-- Advanced -->
					<span id="xsumm_advanced" class="h2" style="padding:0px; vertical-align:top;height:26px;"></span>
					<span style="vertical-align:top; padding-left:5px; height:26px;">
						<xsl:value-of select="$IDS_XSL_DETAILS"/>
					</span>
				  </td>
				</tr>
				
             </table>
			 <!--aici incepe-->
			 <table cellpadding="0" cellspacing="0">
			  <xsl:for-each select="bdtpwizrep/task">
				<tr > 
				<td style="border-left:1px solid grey; border-top:1px solid grey; border-bottom:1px solid grey;">
					<xsl:value-of select="$IDS_XSL_FILE_NAME"/>
					<xsl:value-of select="@name"/>
				</td >
				<td style="border-top:1px solid grey; border-bottom:1px solid grey;">
					<xsl:value-of select="$IDS_XSL_ERROR_CODE"/>
					<xsl:value-of select="@err_code"/>
				</td>
				<td style="border-top:1px solid grey; border-right:1px solid grey; border-bottom:1px solid grey;">
					<xsl:value-of select="$IDS_XSL_ERROR_DESCRIPTION"/>
					<xsl:value-of select="@desc"/>
				</td>
				</tr>
                </xsl:for-each>
			 </table>
			 <!--aici se termina-->
             
         </table>
            
	</table>
        </div>
        <!-- border-->
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
