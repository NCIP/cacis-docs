﻿<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content="text/html; charset=utf-8" http-equiv=Content-Type></HEAD>
<BODY><PRE>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!--
This file was generated by Altova MapForce 2011r3

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
--&gt;
&lt;xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ns0="urn:tolven-org:trim:4.0" exclude-result-prefixes="xs fn ns0"&gt;
	&lt;xsl:output method="xml" encoding="UTF-8" indent="yes"/&gt;
	&lt;xsl:template match="/"&gt;
		&lt;ClinicalDocument xmlns="urn:hl7-org:v3"&gt;
			&lt;xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'urn:hl7-org:v3 D:/workspace/Transcend_Trim_Mapping/mapping/CDA_XSD/cda/CDA.xsd'"/&gt;
			&lt;xsl:for-each select="ns0:trim"&gt;
				&lt;xsl:variable name="var1_act" as="node()?" select="ns0:act"/&gt;
				&lt;xsl:variable name="var2_resultof_create_attribute" as="node()"&gt;
					&lt;xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/&gt;
				&lt;/xsl:variable&gt;
				&lt;xsl:variable name="var3_resultof_create_attribute" as="node()"&gt;
					&lt;xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/&gt;
				&lt;/xsl:variable&gt;
				&lt;realmCode&gt;
					&lt;xsl:attribute name="code" namespace="" select="'US'"/&gt;
				&lt;/realmCode&gt;
				&lt;typeId&gt;
					&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.1.3'"/&gt;
					&lt;xsl:attribute name="extension" namespace="" select="'POCD_HD000040'"/&gt;
				&lt;/typeId&gt;
				&lt;templateId&gt;
					&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.10.20.1'"/&gt;
				&lt;/templateId&gt;
				&lt;templateId&gt;
					&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.3.88.11.32.1'"/&gt;
				&lt;/templateId&gt;
				&lt;templateId&gt;
					&lt;xsl:attribute name="root" namespace="" select="'1.3.6.1.4.1.19376.1.5.3.1.1.1'"/&gt;
				&lt;/templateId&gt;
				&lt;templateId&gt;
					&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.10.20.3'"/&gt;
				&lt;/templateId&gt;
				&lt;xsl:for-each select="$var1_act/ns0:id"&gt;
					&lt;xsl:variable name="var4_II" as="node()*" select="ns0:II"/&gt;
					&lt;id&gt;
						&lt;xsl:for-each select="$var4_II/ns0:root"&gt;
							&lt;xsl:attribute name="root" namespace="" select="fn:string(.)"/&gt;
						&lt;/xsl:for-each&gt;
						&lt;xsl:for-each select="$var4_II/ns0:extension"&gt;
							&lt;xsl:attribute name="extension" namespace="" select="fn:string(.)"/&gt;
						&lt;/xsl:for-each&gt;
						&lt;xsl:for-each select="$var4_II/ns0:assigningAuthorityName"&gt;
							&lt;xsl:attribute name="assigningAuthorityName" namespace="" select="fn:string(.)"/&gt;
						&lt;/xsl:for-each&gt;
						&lt;xsl:for-each select="$var4_II/ns0:displayable"&gt;
							&lt;xsl:attribute name="displayable" namespace="" select="xs:string(xs:boolean(fn:string(.)))"/&gt;
						&lt;/xsl:for-each&gt;
					&lt;/id&gt;
				&lt;/xsl:for-each&gt;
				&lt;xsl:for-each select="$var1_act/ns0:code"&gt;
					&lt;xsl:variable name="var7_cur" as="node()" select="."/&gt;
					&lt;xsl:for-each select="ns0:CD"&gt;
						&lt;code&gt;
							&lt;xsl:for-each select="ns0:code"&gt;
								&lt;xsl:attribute name="code" namespace="" select="fn:string(.)"/&gt;
							&lt;/xsl:for-each&gt;
							&lt;xsl:for-each select="ns0:codeSystem"&gt;
								&lt;xsl:attribute name="codeSystem" namespace="" select="fn:string(.)"/&gt;
							&lt;/xsl:for-each&gt;
							&lt;xsl:for-each select="ns0:codeSystemName"&gt;
								&lt;xsl:attribute name="codeSystemName" namespace="" select="fn:string(.)"/&gt;
							&lt;/xsl:for-each&gt;
							&lt;xsl:for-each select="ns0:codeSystemVersion"&gt;
								&lt;xsl:attribute name="codeSystemVersion" namespace="" select="fn:string(.)"/&gt;
							&lt;/xsl:for-each&gt;
							&lt;xsl:for-each select="ns0:displayName"&gt;
								&lt;xsl:attribute name="displayName" namespace="" select="fn:string(.)"/&gt;
							&lt;/xsl:for-each&gt;
							&lt;xsl:for-each select="$var7_cur/ns0:originalText"&gt;
								&lt;originalText&gt;
									&lt;xsl:sequence select="fn:string(.)"/&gt;
								&lt;/originalText&gt;
							&lt;/xsl:for-each&gt;
							&lt;xsl:for-each select="ns0:qualifier"&gt;
								&lt;xsl:variable name="var5_inverted" as="node()?" select="@inverted"/&gt;
								&lt;qualifier&gt;
									&lt;xsl:if test="fn:exists($var5_inverted)"&gt;
										&lt;xsl:attribute name="inverted" namespace="" select="xs:string(xs:boolean(fn:string($var5_inverted)))"/&gt;
									&lt;/xsl:if&gt;
									&lt;xsl:for-each select="ns0:name"&gt;
										&lt;name&gt;
											&lt;xsl:for-each select="ns0:code"&gt;
												&lt;xsl:attribute name="code" namespace="" select="fn:string(.)"/&gt;
											&lt;/xsl:for-each&gt;
											&lt;xsl:for-each select="ns0:codeSystem"&gt;
												&lt;xsl:attribute name="codeSystem" namespace="" select="fn:string(.)"/&gt;
											&lt;/xsl:for-each&gt;
											&lt;xsl:for-each select="ns0:codeSystemName"&gt;
												&lt;xsl:attribute name="codeSystemName" namespace="" select="fn:string(.)"/&gt;
											&lt;/xsl:for-each&gt;
											&lt;xsl:for-each select="ns0:codeSystemVersion"&gt;
												&lt;xsl:attribute name="codeSystemVersion" namespace="" select="fn:string(.)"/&gt;
											&lt;/xsl:for-each&gt;
											&lt;xsl:for-each select="ns0:displayName"&gt;
												&lt;xsl:attribute name="displayName" namespace="" select="fn:string(.)"/&gt;
											&lt;/xsl:for-each&gt;
											&lt;xsl:for-each select="ns0:originalText"&gt;
												&lt;originalText&gt;
													&lt;xsl:sequence select="fn:string(.)"/&gt;
												&lt;/originalText&gt;
											&lt;/xsl:for-each&gt;
										&lt;/name&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:value"&gt;
										&lt;value&gt;
											&lt;xsl:for-each select="ns0:originalText"&gt;
												&lt;originalText&gt;
													&lt;xsl:sequence select="fn:string(.)"/&gt;
												&lt;/originalText&gt;
											&lt;/xsl:for-each&gt;
										&lt;/value&gt;
									&lt;/xsl:for-each&gt;
								&lt;/qualifier&gt;
							&lt;/xsl:for-each&gt;
							&lt;xsl:for-each select="ns0:translation"&gt;
								&lt;translation&gt;
									&lt;xsl:for-each select="ns0:code"&gt;
										&lt;xsl:attribute name="code" namespace="" select="fn:string(.)"/&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:codeSystem"&gt;
										&lt;xsl:attribute name="codeSystem" namespace="" select="fn:string(.)"/&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:codeSystemName"&gt;
										&lt;xsl:attribute name="codeSystemName" namespace="" select="fn:string(.)"/&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:codeSystemVersion"&gt;
										&lt;xsl:attribute name="codeSystemVersion" namespace="" select="fn:string(.)"/&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:displayName"&gt;
										&lt;xsl:attribute name="displayName" namespace="" select="fn:string(.)"/&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:originalText"&gt;
										&lt;originalText&gt;
											&lt;xsl:sequence select="fn:string(.)"/&gt;
										&lt;/originalText&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:qualifier"&gt;
										&lt;xsl:variable name="var6_inverted" as="node()?" select="@inverted"/&gt;
										&lt;qualifier&gt;
											&lt;xsl:if test="fn:exists($var6_inverted)"&gt;
												&lt;xsl:attribute name="inverted" namespace="" select="xs:string(xs:boolean(fn:string($var6_inverted)))"/&gt;
											&lt;/xsl:if&gt;
											&lt;xsl:for-each select="ns0:name"&gt;
												&lt;name&gt;
													&lt;xsl:for-each select="ns0:code"&gt;
														&lt;xsl:attribute name="code" namespace="" select="fn:string(.)"/&gt;
													&lt;/xsl:for-each&gt;
													&lt;xsl:for-each select="ns0:codeSystem"&gt;
														&lt;xsl:attribute name="codeSystem" namespace="" select="fn:string(.)"/&gt;
													&lt;/xsl:for-each&gt;
													&lt;xsl:for-each select="ns0:codeSystemName"&gt;
														&lt;xsl:attribute name="codeSystemName" namespace="" select="fn:string(.)"/&gt;
													&lt;/xsl:for-each&gt;
													&lt;xsl:for-each select="ns0:codeSystemVersion"&gt;
														&lt;xsl:attribute name="codeSystemVersion" namespace="" select="fn:string(.)"/&gt;
													&lt;/xsl:for-each&gt;
													&lt;xsl:for-each select="ns0:displayName"&gt;
														&lt;xsl:attribute name="displayName" namespace="" select="fn:string(.)"/&gt;
													&lt;/xsl:for-each&gt;
													&lt;xsl:for-each select="ns0:originalText"&gt;
														&lt;originalText&gt;
															&lt;xsl:sequence select="fn:string(.)"/&gt;
														&lt;/originalText&gt;
													&lt;/xsl:for-each&gt;
												&lt;/name&gt;
											&lt;/xsl:for-each&gt;
											&lt;xsl:for-each select="ns0:value"&gt;
												&lt;value&gt;
													&lt;xsl:for-each select="ns0:originalText"&gt;
														&lt;originalText&gt;
															&lt;xsl:sequence select="fn:string(.)"/&gt;
														&lt;/originalText&gt;
													&lt;/xsl:for-each&gt;
												&lt;/value&gt;
											&lt;/xsl:for-each&gt;
										&lt;/qualifier&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:translation"&gt;
										&lt;translation&gt;
											&lt;xsl:sequence select="()"/&gt;
										&lt;/translation&gt;
									&lt;/xsl:for-each&gt;
								&lt;/translation&gt;
							&lt;/xsl:for-each&gt;
						&lt;/code&gt;
					&lt;/xsl:for-each&gt;
				&lt;/xsl:for-each&gt;
				&lt;xsl:for-each select="$var1_act/ns0:title/ns0:ST"&gt;
					&lt;xsl:variable name="var8_language" as="node()?" select="@language"/&gt;
					&lt;title&gt;
						&lt;xsl:if test="fn:exists($var8_language)"&gt;
							&lt;xsl:attribute name="language" namespace="" select="fn:string($var8_language)"/&gt;
						&lt;/xsl:if&gt;
						&lt;xsl:sequence select="fn:string(.)"/&gt;
					&lt;/title&gt;
				&lt;/xsl:for-each&gt;
				&lt;xsl:for-each select="$var1_act/ns0:effectiveTime/ns0:TS"&gt;
					&lt;effectiveTime&gt;
						&lt;xsl:for-each select="ns0:value"&gt;
							&lt;xsl:attribute name="value" namespace="" select="fn:string(.)"/&gt;
						&lt;/xsl:for-each&gt;
					&lt;/effectiveTime&gt;
				&lt;/xsl:for-each&gt;
				&lt;confidentialityCode&gt;
					&lt;xsl:attribute name="code" namespace="" select="'N'"/&gt;
				&lt;/confidentialityCode&gt;
				&lt;xsl:for-each select="$var1_act/ns0:participation[(fn:string(@typeCode) = 'SBJ')]"&gt;
					&lt;xsl:variable name="var9_role" as="node()?" select="ns0:role"/&gt;
					&lt;recordTarget&gt;
						&lt;patientRole&gt;
							&lt;xsl:for-each select="$var9_role/ns0:id/ns0:II"&gt;
								&lt;id&gt;
									&lt;xsl:for-each select="ns0:root"&gt;
										&lt;xsl:attribute name="root" namespace="" select="fn:string(.)"/&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:extension"&gt;
										&lt;xsl:attribute name="extension" namespace="" select="fn:string(.)"/&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:assigningAuthorityName"&gt;
										&lt;xsl:attribute name="assigningAuthorityName" namespace="" select="fn:string(.)"/&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="ns0:displayable"&gt;
										&lt;xsl:attribute name="displayable" namespace="" select="xs:string(xs:boolean(fn:string(.)))"/&gt;
									&lt;/xsl:for-each&gt;
								&lt;/id&gt;
							&lt;/xsl:for-each&gt;
							&lt;patient&gt;
								&lt;name&gt;
									&lt;xsl:for-each select="$var9_role/ns0:player/ns0:name/ns0:EN/ns0:use"&gt;
										&lt;xsl:attribute name="use" namespace="" select="fn:string(.)"/&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="$var9_role/ns0:player/ns0:name/ns0:EN/ns0:part"&gt;
										&lt;xsl:variable name="var10_result" as="xs:boolean?"&gt;
											&lt;xsl:for-each select="ns0:type"&gt;
												&lt;xsl:sequence select="(fn:string(.) = 'FAM')"/&gt;
											&lt;/xsl:for-each&gt;
										&lt;/xsl:variable&gt;
										&lt;xsl:if test="fn:exists($var10_result[.])"&gt;
											&lt;family&gt;
												&lt;xsl:for-each select="ns0:ST"&gt;
													&lt;xsl:sequence select="fn:string(.)"/&gt;
												&lt;/xsl:for-each&gt;
											&lt;/family&gt;
										&lt;/xsl:if&gt;
									&lt;/xsl:for-each&gt;
									&lt;xsl:for-each select="$var9_role/ns0:player/ns0:name/ns0:EN/ns0:part"&gt;
										&lt;xsl:variable name="var11_result" as="xs:boolean?"&gt;
											&lt;xsl:for-each select="ns0:type"&gt;
												&lt;xsl:sequence select="(fn:string(.) = 'GIV')"/&gt;
											&lt;/xsl:for-each&gt;
										&lt;/xsl:variable&gt;
										&lt;xsl:if test="fn:exists($var11_result[.])"&gt;
											&lt;given&gt;
												&lt;xsl:for-each select="ns0:ST"&gt;
													&lt;xsl:sequence select="fn:string(.)"/&gt;
												&lt;/xsl:for-each&gt;
											&lt;/given&gt;
										&lt;/xsl:if&gt;
									&lt;/xsl:for-each&gt;
								&lt;/name&gt;
							&lt;/patient&gt;
						&lt;/patientRole&gt;
					&lt;/recordTarget&gt;
				&lt;/xsl:for-each&gt;
				&lt;xsl:for-each select="$var1_act/ns0:participation[(fn:string(@typeCode) = 'ENT')]"&gt;
					&lt;xsl:variable name="var12_role" as="node()?" select="ns0:role"/&gt;
					&lt;author&gt;
						&lt;time&gt;
							&lt;xsl:attribute name="nullFlavor" namespace="" select="'NI'"/&gt;
						&lt;/time&gt;
						&lt;assignedAuthor&gt;
							&lt;id&gt;
								&lt;xsl:for-each select="$var12_role/ns0:id/ns0:II/ns0:root"&gt;
									&lt;xsl:attribute name="root" namespace="" select="fn:string(.)"/&gt;
								&lt;/xsl:for-each&gt;
								&lt;xsl:for-each select="$var12_role/ns0:id/ns0:II/ns0:extension"&gt;
									&lt;xsl:attribute name="extension" namespace="" select="fn:string(.)"/&gt;
								&lt;/xsl:for-each&gt;
							&lt;/id&gt;
						&lt;/assignedAuthor&gt;
					&lt;/author&gt;
				&lt;/xsl:for-each&gt;
				&lt;custodian&gt;
					&lt;assignedCustodian&gt;
						&lt;representedCustodianOrganization&gt;
							&lt;id&gt;
								&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.3.26.1.6'"/&gt;
							&lt;/id&gt;
						&lt;/representedCustodianOrganization&gt;
					&lt;/assignedCustodian&gt;
				&lt;/custodian&gt;
				&lt;component&gt;
					&lt;structuredBody&gt;
						&lt;component&gt;
							&lt;section&gt;
								&lt;templateId&gt;
									&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.10.20.1.16'"/&gt;
								&lt;/templateId&gt;
								&lt;templateId&gt;
									&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.3.88.11.83.119'"/&gt;
								&lt;/templateId&gt;
								&lt;templateId&gt;
									&lt;xsl:attribute name="root" namespace="" select="'1.3.6.1.4.1.19376.1.5.3.1.3.25'"/&gt;
								&lt;/templateId&gt;
								&lt;templateId&gt;
									&lt;xsl:attribute name="root" namespace="" select="'1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2'"/&gt;
								&lt;/templateId&gt;
								&lt;code&gt;
									&lt;xsl:attribute name="code" namespace="" select="'8716-3'"/&gt;
									&lt;xsl:sequence select="$var2_resultof_create_attribute"/&gt;
									&lt;xsl:sequence select="$var3_resultof_create_attribute"/&gt;
									&lt;xsl:attribute name="displayName" namespace="" select="'vital signs'"/&gt;
								&lt;/code&gt;
								&lt;title&gt;Physical Findings - Vital signs&lt;/title&gt;
								&lt;entry&gt;
									&lt;xsl:for-each select="$var1_act/ns0:relationship"&gt;
										&lt;xsl:variable name="var25_cur" as="node()" select="."/&gt;
										&lt;xsl:for-each select="ns0:act[(fn:string($var25_cur/@name) = 'vitalSigns')]"&gt;
											&lt;xsl:variable name="var13_resultof_create_element" as="node()"&gt;
												&lt;effectiveTime&gt;
													&lt;xsl:attribute name="nullFlavor" namespace="" select="'NI'"/&gt;
												&lt;/effectiveTime&gt;
											&lt;/xsl:variable&gt;
											&lt;organizer&gt;
												&lt;xsl:attribute name="classCode" namespace="" select="'CLUSTER'"/&gt;
												&lt;xsl:attribute name="moodCode" namespace="" select="'EVN'"/&gt;
												&lt;templateId&gt;
													&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.10.20.1.32'"/&gt;
												&lt;/templateId&gt;
												&lt;templateId&gt;
													&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.10.20.1.35'"/&gt;
												&lt;/templateId&gt;
												&lt;templateId&gt;
													&lt;xsl:attribute name="root" namespace="" select="'1.3.6.1.4.1.19376.1.5.3.1.4.13.1'"/&gt;
												&lt;/templateId&gt;
												&lt;xsl:for-each select="ns0:id/ns0:II"&gt;
													&lt;id&gt;
														&lt;xsl:for-each select="ns0:root"&gt;
															&lt;xsl:attribute name="root" namespace="" select="fn:string(.)"/&gt;
														&lt;/xsl:for-each&gt;
														&lt;xsl:for-each select="ns0:extension"&gt;
															&lt;xsl:attribute name="extension" namespace="" select="fn:string(.)"/&gt;
														&lt;/xsl:for-each&gt;
														&lt;xsl:for-each select="ns0:assigningAuthorityName"&gt;
															&lt;xsl:attribute name="assigningAuthorityName" namespace="" select="fn:string(.)"/&gt;
														&lt;/xsl:for-each&gt;
														&lt;xsl:for-each select="ns0:displayable"&gt;
															&lt;xsl:attribute name="displayable" namespace="" select="xs:string(xs:boolean(fn:string(.)))"/&gt;
														&lt;/xsl:for-each&gt;
													&lt;/id&gt;
												&lt;/xsl:for-each&gt;
												&lt;code&gt;
													&lt;xsl:attribute name="code" namespace="" select="'46680005'"/&gt;
													&lt;xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.96'"/&gt;
													&lt;xsl:attribute name="codeSystemName" namespace="" select="'SNOMED CT'"/&gt;
													&lt;xsl:attribute name="displayName" namespace="" select="'Vital signs'"/&gt;
												&lt;/code&gt;
												&lt;statusCode&gt;
													&lt;xsl:attribute name="code" namespace="" select="'completed'"/&gt;
												&lt;/statusCode&gt;
												&lt;xsl:sequence select="$var13_resultof_create_element"/&gt;
												&lt;xsl:for-each select="ns0:observation/ns0:value"&gt;
													&lt;xsl:variable name="var24_cur" as="node()" select="."/&gt;
													&lt;xsl:variable name="var14_ST" as="node()?" select="ns0:ST"/&gt;
													&lt;xsl:variable name="var15_result" as="xs:boolean?"&gt;
														&lt;xsl:for-each select="$var14_ST"&gt;
															&lt;xsl:sequence select="(fn:exists($var24_cur/ns0:valueSet) or (fn:exists($var14_ST) and (fn:string-length(fn:string(.)) &amp;gt; xs:decimal('0'))))"/&gt;
														&lt;/xsl:for-each&gt;
													&lt;/xsl:variable&gt;
													&lt;xsl:if test="fn:exists($var15_result[.])"&gt;
														&lt;xsl:variable name="var16_label" as="node()?" select="ns0:label"/&gt;
														&lt;component&gt;
															&lt;observation&gt;
																&lt;xsl:attribute name="classCode" namespace="" select="'OBS'"/&gt;
																&lt;xsl:attribute name="moodCode" namespace="" select="'EVN'"/&gt;
																&lt;templateId&gt;
																	&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.10.20.1.31'"/&gt;
																&lt;/templateId&gt;
																&lt;templateId&gt;
																	&lt;xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.3.88.11.83.14'"/&gt;
																&lt;/templateId&gt;
																&lt;templateId&gt;
																	&lt;xsl:attribute name="root" namespace="" select="'1.3.6.1.4.1.19376.1.5.3.1.4.13'"/&gt;
																&lt;/templateId&gt;
																&lt;templateId&gt;
																	&lt;xsl:attribute name="root" namespace="" select="'1.3.6.1.4.1.19376.1.5.3.1.4.13.2'"/&gt;
																&lt;/templateId&gt;
																&lt;code&gt;
																	&lt;xsl:for-each select="$var16_label"&gt;
																		&lt;xsl:variable name="var17_resultof_cast" as="xs:string" select="fn:string(.)"/&gt;
																		&lt;xsl:variable name="var18_resultof_equal" as="xs:boolean" select="($var17_resultof_cast = 'T: ')"/&gt;
																		&lt;xsl:if test="($var18_resultof_equal or (($var17_resultof_cast = 'P: ') or (($var17_resultof_cast = 'Wt: ') or (($var17_resultof_cast = 'R: ') or (($var17_resultof_cast = 'BP: ') or ($var17_resultof_cast = 'Ht: '))))))"&gt;
																			&lt;xsl:attribute name="code" namespace=""&gt;
																				&lt;xsl:choose&gt;
																					&lt;xsl:when test="$var18_resultof_equal"&gt;
																						&lt;xsl:sequence select="'8310-5'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var17_resultof_cast = 'P: ')"&gt;
																						&lt;xsl:sequence select="'8867-4'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var17_resultof_cast = 'Wt: ')"&gt;
																						&lt;xsl:sequence select="'3141-9'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var17_resultof_cast = 'R: ')"&gt;
																						&lt;xsl:sequence select="'9279-1'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var17_resultof_cast = 'BP: ')"&gt;
																						&lt;xsl:sequence select="'8462-4'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:otherwise&gt;
																						&lt;xsl:if test="($var17_resultof_cast = 'Ht: ')"&gt;
																							&lt;xsl:sequence select="'8302-2'"/&gt;
																						&lt;/xsl:if&gt;
																					&lt;/xsl:otherwise&gt;
																				&lt;/xsl:choose&gt;
																			&lt;/xsl:attribute&gt;
																		&lt;/xsl:if&gt;
																	&lt;/xsl:for-each&gt;
																	&lt;xsl:sequence select="$var2_resultof_create_attribute"/&gt;
																	&lt;xsl:sequence select="$var3_resultof_create_attribute"/&gt;
																	&lt;xsl:if test="not($var16_label)"&gt;
																		&lt;xsl:attribute name="code" namespace=""&gt;
																			&lt;xsl:sequence select="8480-6"/&gt;
																		&lt;/xsl:attribute&gt;
																		&lt;xsl:attribute name="displayName" namespace=""&gt;
																			&lt;xsl:sequence select='"Systolic BP"'/&gt;
																		&lt;/xsl:attribute&gt;
																	&lt;/xsl:if&gt;
																	&lt;xsl:for-each select="$var16_label"&gt;
																		&lt;xsl:variable name="var19_resultof_cast" as="xs:string" select="fn:string(.)"/&gt;
																		&lt;xsl:variable name="var20_resultof_equal" as="xs:boolean" select="($var19_resultof_cast = 'T: ')"/&gt;
																		&lt;xsl:if test="($var20_resultof_equal or (($var19_resultof_cast = 'P: ') or (($var19_resultof_cast = 'R: ') or (($var19_resultof_cast = 'Wt: ') or (($var19_resultof_cast = 'BP: ') or ($var19_resultof_cast = 'Ht: '))))))"&gt;
																			&lt;xsl:attribute name="displayName" namespace=""&gt;
																				&lt;xsl:choose&gt;
																					&lt;xsl:when test="$var20_resultof_equal"&gt;
																						&lt;xsl:sequence select="'Body temperature'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var19_resultof_cast = 'P: ')"&gt;
																						&lt;xsl:sequence select="'Heart rate'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var19_resultof_cast = 'R: ')"&gt;
																						&lt;xsl:sequence select="'Respiration rate'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var19_resultof_cast = 'Wt: ')"&gt;
																						&lt;xsl:sequence select="'Body weight'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var19_resultof_cast = 'BP: ')"&gt;
																						&lt;xsl:sequence select="'Diastolic BP'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:otherwise&gt;
																						&lt;xsl:if test="($var19_resultof_cast = 'Ht: ')"&gt;
																							&lt;xsl:sequence select="'Body height'"/&gt;
																						&lt;/xsl:if&gt;
																					&lt;/xsl:otherwise&gt;
																				&lt;/xsl:choose&gt;
																			&lt;/xsl:attribute&gt;
																		&lt;/xsl:if&gt;
																	&lt;/xsl:for-each&gt;
																&lt;/code&gt;
																&lt;statusCode&gt;
																	&lt;xsl:attribute name="code" namespace="" select="'completed'"/&gt;
																&lt;/statusCode&gt;
																&lt;xsl:sequence select="$var13_resultof_create_element"/&gt;
																&lt;value&gt;
																	&lt;xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="xs:QName('PQ')"/&gt;
																	&lt;xsl:for-each select="$var14_ST"&gt;
																		&lt;xsl:variable name="var21_resultof_cast" as="xs:string" select="fn:string(.)"/&gt;
																		&lt;xsl:if test="(fn:string-length($var21_resultof_cast) &amp;gt; xs:decimal('0'))"&gt;
																			&lt;xsl:attribute name="value" namespace="" select="$var21_resultof_cast"/&gt;
																		&lt;/xsl:if&gt;
																	&lt;/xsl:for-each&gt;
																	&lt;xsl:for-each select="$var16_label"&gt;
																		&lt;xsl:variable name="var22_resultof_cast" as="xs:string" select="fn:string(.)"/&gt;
																		&lt;xsl:variable name="var23_resultof_equal" as="xs:boolean" select="($var22_resultof_cast = 'T: ')"/&gt;
																		&lt;xsl:if test="($var23_resultof_equal or (($var22_resultof_cast = 'P: ') or (($var22_resultof_cast = 'R: ') or (($var22_resultof_cast = 'Wt: ') or (($var22_resultof_cast = 'Ht: ') or ($var22_resultof_cast = 'BP: '))))))"&gt;
																			&lt;xsl:attribute name="unit" namespace=""&gt;
																				&lt;xsl:choose&gt;
																					&lt;xsl:when test="$var23_resultof_equal"&gt;
																						&lt;xsl:sequence select="'Cel'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var22_resultof_cast = 'P: ')"&gt;
																						&lt;xsl:sequence select="'min'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var22_resultof_cast = 'R: ')"&gt;
																						&lt;xsl:sequence select="'min'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var22_resultof_cast = 'Wt: ')"&gt;
																						&lt;xsl:sequence select="'kg'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:when test="($var22_resultof_cast = 'Ht: ')"&gt;
																						&lt;xsl:sequence select="'cm'"/&gt;
																					&lt;/xsl:when&gt;
																					&lt;xsl:otherwise&gt;
																						&lt;xsl:if test="($var22_resultof_cast = 'BP: ')"&gt;
																							&lt;xsl:sequence select="'mm[Hg]'"/&gt;
																						&lt;/xsl:if&gt;
																					&lt;/xsl:otherwise&gt;
																				&lt;/xsl:choose&gt;
																			&lt;/xsl:attribute&gt;
																		&lt;/xsl:if&gt;
																	&lt;/xsl:for-each&gt;
																	&lt;xsl:if test="not($var16_label)"&gt;
																		&lt;xsl:attribute name="unit" namespace=""&gt;
																			&lt;xsl:sequence select="'mm[Hg]'"/&gt;
																		&lt;/xsl:attribute&gt;
																	&lt;/xsl:if&gt;
																&lt;/value&gt;
															&lt;/observation&gt;
														&lt;/component&gt;
													&lt;/xsl:if&gt;
												&lt;/xsl:for-each&gt;
											&lt;/organizer&gt;
										&lt;/xsl:for-each&gt;
									&lt;/xsl:for-each&gt;
								&lt;/entry&gt;
							&lt;/section&gt;
						&lt;/component&gt;
					&lt;/structuredBody&gt;
				&lt;/component&gt;
			&lt;/xsl:for-each&gt;
		&lt;/ClinicalDocument&gt;
	&lt;/xsl:template&gt;
&lt;/xsl:stylesheet&gt;
</PRE></BODY></HTML>
