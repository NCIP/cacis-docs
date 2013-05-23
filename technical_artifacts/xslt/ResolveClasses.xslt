<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mif="urn:hl7-org:v3/mif2" exclude-result-prefixes="xs">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="node()|@*" as="item()">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="mif:targetConnection" as="element(mif:targetConnection)">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()[not(self::mif:choiceItem or self::mif:participantClass)]"/>
      <xsl:apply-templates mode="resolve" select="mif:participantClass/*">
        <xsl:with-param name="traversalName" select="@name"/>
        <xsl:with-param name="choiceItems" select="mif:choiceItem"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="mif:choiceItem|mif:participantClass"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template mode="resolve" match="mif:reference" as="element(mif:resolvedClass)?">
    <xsl:param name="traversalName" as="xs:string" required="yes"/>
    <xsl:param name="choiceItems" as="element(mif:choiceItem)*" required="yes"/>
    <xsl:apply-templates mode="resolve" select="ancestor::mif:serializedStaticModel/mif:entryPoint//*[self::mif:class or self::mif:commonModelElementRef or self::templateParameter][@name=current()/@name]">
      <xsl:with-param name="traversalName" select="$traversalName"/>
      <xsl:with-param name="choiceItems" select="$choiceItems"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template mode="resolve" match="mif:class" as="element(mif:resolvedClass)">
    <xsl:param name="traversalName" as="xs:string" required="yes"/>
    <xsl:param name="choiceItems" as="element(mif:choiceItem)*" required="yes"/>
    <mif:resolvedClass traversalName="{$traversalName}" className="{@name}">
      <xsl:copy-of select="ancestor::mif:serializedStaticModel/mif:packageLocation"/>
      <xsl:for-each select="mif:childClass/mif:specializedClass/*">
        <xsl:variable name="choiceItem" select="$choiceItems[@className=current()/@name]" as="element(mif:choiceItem)"/>
        <xsl:apply-templates mode="resolve" select=".">
          <xsl:with-param name="traversalName" select="$choiceItem/@traversalName"/>
          <xsl:with-param name="choiceItems" select="$choiceItem/mif:choiceItem"/>
        </xsl:apply-templates>
      </xsl:for-each>
    </mif:resolvedClass>
  </xsl:template>
  <xsl:template mode="resolve" match="mif:commonModelElementRef" as="element(mif:resolvedClass)?">
    <xsl:param name="traversalName" as="xs:string" required="yes"/>
    <xsl:param name="choiceItems" as="element(mif:choiceItem)*" required="yes"/>
    <xsl:variable name="resolvedClass" as="element(mif:resolvedClass)?">
      <xsl:for-each select="//mif:staticModelInterfacePackage/mif:commonModelElementDefinition[@name=current()/@name]/mif:boundStaticModel">
        <xsl:for-each select="//mif:serializedStaticModel/mif:packageLocation[@root=current()/@root and @realmNamespace=current()/@realmNamespace and @domain=current()/@domain and @artifact=current()/@artifact and @id=current()/@id and (not(@version or current()/@version) or @version=current()/@version)]/parent::mif:serializedStaticModel">
          <xsl:apply-templates mode="resolve" select="mif:entryPoint/mif:entryClass/*">
            <xsl:with-param name="traversalName" select="$traversalName"/>
            <xsl:with-param name="choiceItems" select="$choiceItems"/>
          </xsl:apply-templates>      
        </xsl:for-each>
      </xsl:for-each>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$resolvedClass">
        <xsl:copy-of select="$resolvedClass"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message select="concat('Error: Unable to resolve reference to CMET ', @name)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template mode="resolve" match="mif:templateParameter" as="element(mif:resolvedClass)?">
    <xsl:param name="traversalName" as="xs:string" required="yes"/>
    <xsl:param name="choiceItems" as="element(mif:choiceItem)*" required="yes"/>
    <xsl:variable name="resolvedClass" as="element(mif:resolvedClass)?">
      <xsl:for-each select="//mif:interaction/mif:argumentMessage//*[@parameterName=current()/@name]">
        <xsl:for-each select="//mif:serializedStaticModel/mif:packageLocation[@root=current()/@root and @realmNamespace=current()/@realmNamespace and @domain=current()/@domain and @artifact=current()/@artifact and @id=current()/@id and (not(@version or current()/@version) or @version=current()/@version)]/parent::mif:serializedStaticModel">
          <xsl:apply-templates mode="resolve" select="mif:entryPoint/mif:entryClass/*">
            <xsl:with-param name="traversalName" select="$traversalName"/>
            <xsl:with-param name="choiceItems" select="$choiceItems"/>
          </xsl:apply-templates>      
        </xsl:for-each>
      </xsl:for-each>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$resolvedClass">
        <xsl:copy-of select="$resolvedClass"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message select="concat('Error: Unable to resolve reference to stub ', @name)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
