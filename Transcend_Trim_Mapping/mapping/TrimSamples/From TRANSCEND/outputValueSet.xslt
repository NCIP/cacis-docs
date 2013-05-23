<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="urn:tolven-org:trim:4.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head/>
			<body>
				<table border="1">
					<tbody>
					<xsl:for-each select="t:trim">
					<xsl:call-template name="make-vs">
						<xsl:with-param name="rt" select="current()"/>
					</xsl:call-template>
				</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="make-vs">
		<xsl:param name="rt"/>
		<th>ValueSet Name</th>
		<th>TRIM Code DisplayName</th>
		<xsl:for-each select="$rt/t:valueSet">
			<xsl:variable name="vsNm" select="@name"/>
			<tr>
				<td><b><xsl:value-of select="$vsNm"/></b></td>
				<td/>
			</tr>
			<xsl:for-each select="t:CE">
			<tr>
				<td/>
				<td><xsl:value-of select="t:displayName"/></td>		
			</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
