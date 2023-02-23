<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="IDS_XSL_BITDEF_LOG_FILE">
		<xsl:text>Log File</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_PRODUCT">
		<xsl:text>Product:</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_VERSION">
		<xsl:text>Version : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_LOG_DATE">
		<xsl:text>Log date:</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_RESULTS">
		<xsl:text>Scan Results</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_OPTIONS">
		<xsl:text>Scan Options</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_THREATS_OPTIONS">
		<xsl:text>Target Threat Types:</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_VIRUSES">
		<xsl:text>Scan for viruses : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_ADWARE">
		<xsl:text>Scan for adware : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SPYWARE">
		<xsl:text>Scan for spyware : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_APPLICATIONS">
		<xsl:text>Scan for applications : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_DIALERS">
		<xsl:text>Scan for dialers : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_ROOTKITS">
		<xsl:text>Scan for rootkits : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_KEYLOGGERS">
		<xsl:text>Scan for keyloggers : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_SEL">
		<xsl:text>Target Selection Options:</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_REGISTRY">
		<xsl:text>Scan registry keys : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_COOKIES">
		<xsl:text>Scan cookies : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_BOOT">
		<xsl:text>Scan boot sectors : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_MEMORY">
		<xsl:text>Scan memory processes : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_ARCHIVES">
		<xsl:text>Scan archives : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_PACKERS">
		<xsl:text>Scan runtime packers : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_EMAILS">
		<xsl:text>Scan emails : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_ALL_FILES">
		<xsl:text>Scan all files : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_HEURISTIC">
		<xsl:text>Heuristic Scan : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_INC_EXT">
		<xsl:text>Scanned extensions : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_INCL_EXT_NONE">
		<xsl:text>none configured</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_EXCL_EXT">
		<xsl:text>Excluded extensions : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_EXCL_EXT_NONE">
		<xsl:text>none configured</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_TARGET_PROCESSING">
		<xsl:text>Target Processing:</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_INFECTED_FIRST">
		<xsl:text>Default primary action for infected objects : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_INFECTED_SECOND">
		<xsl:text>Default secondary action for infected objects : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_SUSPECT_FIRST">
		<xsl:text>Default primary action for suspicious objects : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_SUSPECT_SECOND">
		<xsl:text>Default secondary action for suspicious objects : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_HIDDEN">
		<xsl:text>Default action for hidden objects : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_PASS_PROT">
		<xsl:text>Default action for password-protected objects : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_ENGINES">
		<xsl:text>Scan engines summary</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ENGINE_SIGN">
		<xsl:text>Number of virus signatures : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ENGINE_ARCHIVE">
		<xsl:text>Archive plugins : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ENGINE_EMAIL">
		<xsl:text>Email plugins : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ENGINE_SCAN">
		<xsl:text>Scan plugins : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ENGINE_SYSTEM">
		<xsl:text>System plugins : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ENGINE_UNPACK">
		<xsl:text>Unpack plugins : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMMARY_DETAILED">
		<xsl:text>Detailed Scan Summary</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMMARY_BASIC">
		<xsl:text>Basic</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_SCANNED">
		<xsl:text>Scanned items : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_SCANNED_NONE">
		<xsl:text> (the scan target does not include any items)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_INFECTED">
		<xsl:text>Infected items : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_INFECTED_NONE">
		<xsl:text>(no infected items have been detected)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_SUSPECT">
		<xsl:text>Suspicious items : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_SUSPECT_NONE">
		<xsl:text>(no suspected items have been detected)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_HIDDEN">
		<xsl:text>Hidden items : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_HIDDEN_NONE">
		<xsl:text>(no hidden items have been detected during this scan)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_HIDDEN_NOT_SCANNED">
		<xsl:text>(the scan options do not include scanning for rootkits)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_RESOLVED">
		<xsl:text>Resolved items : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_RESOLVED_NONE">
		<xsl:text>(no threats have been detected during this scan)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_RESOLVED_NONE_THREATS">
		<xsl:text>(infected or suspect items have been found and were ignored or could not be fixed)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_UNRESOLVED">
		<xsl:text>Unresolved items : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_UNRESOLVED_NONE">
		<xsl:text>(no issues remained unresolved)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMMARY_ADVANCED">
		<xsl:text>Advanced</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_TIME">
		<xsl:text>Scan time : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_FPS">
		<xsl:text>Files per second : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_SMARTSCANNED">
		<xsl:text>Skipped items : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_PASS_PROT">
		<xsl:text>Password-protected items : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_ARCH_BOMBS">
		<xsl:text>Overcompressed items : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_VIRUSES">
		<xsl:text>Individual viruses found : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_DIRECTORIES">
		<xsl:text>Scanned directories : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_BOOT">
		<xsl:text>Scanned boot sectors : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_ARCHIVES">
		<xsl:text>Scanned archives : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_ERRORS">
		<xsl:text>Input-output errors : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_PROC_SCANNED">
		<xsl:text>Scanned processes : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_PROC_INFECTED">
		<xsl:text>Infected processes : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_REG_SCANNED">
		<xsl:text>Scanned registry keys : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_REG_INFECTED">
		<xsl:text>Infected registry keys : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_COOK_SCANNED">
		<xsl:text>Scanned cookies : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_SCAN_SUMM_COOK_INFECTED">
		<xsl:text>Infected cookies : </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_DETAIL_REMAINING">
		<xsl:text>Remaining issues:</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_DETAIL_NAME">
		<xsl:text>Object Path</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_DETAIL_THREAT">
		<xsl:text>Threat Name</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_DETAIL_STATUS">
		<xsl:text>Final Status</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_DETAIL_IGNORED">
		<xsl:text>Objects that were ignored:</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_DETAIL_RESOLVED">
		<xsl:text>Resolved issues:</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_DETAIL_NOT_SCANNED">
		<xsl:text>Objects that were not scanned:</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_DETAIL_REASON">
		<xsl:text>Reason</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_THREAT_NAME_ROOTKITS">
		<xsl:text>Rootkit-Hidden Items</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_THREAT_NAME_ARCHIVE_BOMB">
		<xsl:text>Overcompressed</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_THREAT_NAME_PASSWORD_PROT">
		<xsl:text>Password-protected</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_NONE">
		<xsl:text>None</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_ABORT">
		<xsl:text>Abort</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_DISINFECT">
		<xsl:text>Disinfect</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_RENAME">
		<xsl:text>Rename</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_DELETE">
		<xsl:text>Delete</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_QUAR_COPY">
		<xsl:text>Copy to Quarantine</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_QUAR_MOVE">
		<xsl:text>Move to Quarantine</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_LOG_NOT_SCAN">
		<xsl:text>Log as not scanned</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_ACTION_PROMPT_PASS">
		<xsl:text>Prompt for password</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_NOT_SCANNED">
		<xsl:text>Not scanned</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_CLEAN">
		<xsl:text>Clean</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_INFECTED">
		<xsl:text>Infected</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_SUSPECTED">
		<xsl:text>Suspect</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_HIDDEN">
		<xsl:text>Hidden</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_HIDDEN_INFECTED">
		<xsl:text>Hidden, infected</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_HIDDEN_SUSPECTED">
		<xsl:text>Hidden, suspect</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_DISINFECTED">
		<xsl:text>Disinfected</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_DELETED">
		<xsl:text>Deleted</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_QUARANTINED">
		<xsl:text>Moved to Quarantine</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_UNHIDDEN">
		<xsl:text>Renamed</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_DELETED_REBOOT">
		<xsl:text>Deleted after reboot</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_QUARANTINED_REBOOT">
		<xsl:text>Moved to Quarantine after reboot</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_FAIL_DISINFECT">
		<xsl:text>Disinfect failed</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_FAIL_DELETE">
		<xsl:text>Delete failed</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_FAIL_DELETE_CONTAINER">
		<xsl:text>Delete archive failed</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_FAIL_QUARANTINE">
		<xsl:text>Move to Quarantine failed</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_FAIL_QUARANTINE_CONTAINER">
		<xsl:text>Move archive to Quarantine failed</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_FAIL_UNHIDE">
		<xsl:text>Rename failed</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_ERROR_PASSWORD_PROTECTED">
		<xsl:text> (file was password-protected)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_ERROR_ARCHIVE_BOMB">
		<xsl:text> (file was overcompressed) </xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_ERROR_NO_ACTION">
		<xsl:text> (no action was taken)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_ERROR_FAIL_REPACK">
		<xsl:text> (archive could not be repacked)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_ERROR_FAIL_RESCAN">
		<xsl:text> (object was not found)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_ERROR_IGNORED_READONLY">
		<xsl:text> (ignored, file was located on a readonly media device)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_STATUS_ERROR_IGNORED_FIX_RIGHTS">
		<xsl:text> (ignored, user did not have the proper access rights)</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_YES">
		<xsl:text>Yes</xsl:text>
	</xsl:variable>
	<xsl:variable name="IDS_XSL_NO">
		<xsl:text>No</xsl:text>
	</xsl:variable>
</xsl:stylesheet>