<?xml version="1.0" encoding="UTF-8"?>
<!--
  - This transform takes in a MIF definition file for a CDA serialized static model and produces a transform that
  - will convert from a standard XML ITS 1.0 instance to an RIM-based XML ITS instance.
  -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mif="urn:hl7-org:v3/mif2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:axsl="file://namespace.alias" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="mif xs">
  <xsl:namespace-alias stylesheet-prefix="axsl" result-prefix="xsl"/>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:param name="rimFile" as="xs:string" select="'DEFN=UV=RIM=0219.mif'">
    <!-- The name and location of the RIM file to use for determining association sort order -->
  </xsl:param>
  <xsl:variable name="rimNamespace" as="xs:string" select="'urn:hl7-org:v3-rim'">
    <!-- The namespace to use for RIM ITS elements -->
  </xsl:variable>
  <xsl:variable name="simpleRimAssociations" as="element(associationTraversal)*">
    <xsl:apply-templates mode="simplifyRimAssociations" select="document($rimFile)/mif:staticModel/mif:association"/>
    <!-- The set of class associations from the RIM with their sort keys -->
  </xsl:variable>
  <xsl:template match="/">
    <xsl:if test="not($simpleRimAssociations)">
      <xsl:message terminate="yes" select="concat('Unable to extract association information from specified RIM file: ', $rimFile)"/>
    </xsl:if>
    <xsl:apply-templates select="*"/>
  </xsl:template>
  <xsl:template match="mif:serializedStaticModel">
    <!--
      - Create the stylesheet and the root template
      -->
    <xsl:variable name="version" as="xs:string" select="mif:derivedFrom/mif:targetStaticModel[@artifact='RIM']/@version">
      <!-- The RIM version -->
    </xsl:variable>
    <axsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:canon="urn:nci-gov:caCIS/rimExtension" xpath-default-namespace="urn:hl7-org:v3" exclude-result-prefixes="canon">
      <axsl:template match="ClinicalDocument" priority="10" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <!-- Template for the root node -->
        <axsl:element name="rim-graph" namespace="{$rimNamespace}">
          <axsl:attribute name="version" select="'{$version}'"/>
          <content xmlns="urn:hl7-org:v3-rim" xmlns:cda="ii:2.16.840.1.113883.1.3:POCD_HD000040" templates="cda:ClinicalDocument">
            <axsl:call-template name="{mif:entryPoint/mif:entryClass/*/@name}"/>
          </content>
        </axsl:element>
      </axsl:template>
      <axsl:template match="node()|@*">
        <!--
          - Default is to copy everything
          -->
        <axsl:copy>
          <axsl:apply-templates select="@*|node()"/>
        </axsl:copy>
      </axsl:template>
      <axsl:template match="*" priority="5">
        <!--
          - For elements (v3 attributes), convert to the new namespace
          -->
        <axsl:element namespace="{$rimNamespace}">
          <xsl:attribute name="name" select="concat('{', 'local-name(.)', '}')"/>
          <axsl:apply-templates select="@*|node()"/>
        </axsl:element>
      </axsl:template>
      <axsl:template match="@xsi:schemaLocation">
        <!--
          - Strip off schema location because it won't be valid in the new ITS
          -->
      </axsl:template>
      <xsl:apply-templates select="//mif:class">
        <!-- Create templates for each of the classes in the model -->
      </xsl:apply-templates>
    </axsl:stylesheet>
  </xsl:template>
  <xsl:template match="mif:class">
    <!--
      - Creates a template for each class
      -->
    <axsl:template name="{@name}">
      <axsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'{@name}'"/>
      <axsl:apply-templates select="@*">
        <!-- Copy structural attributes -->
      </axsl:apply-templates>
      <xsl:variable name="associationClassName" as="xs:string?" select="mif:association[1]/mif:targetConnection[1]/mif:derivedFrom[@staticModelDerivationId='1']/@className">
        <!-- The name of the RIM class associated with the first association -->
      </xsl:variable>
      <xsl:variable name="baseClassAttributeNames" as="xs:string+">
        <!-- The set of attributes that will precede the associations -->
        <!-- We cheat a bit based on the knowledge that outbound associations only exist for "root" classes (excluding InfrastructureRoot).  Thus if there are any associations, the class for those associations will always be the 'root' class -->
        <xsl:text>realmCode</xsl:text>
        <xsl:text>typeId</xsl:text>
        <xsl:text>templateId</xsl:text>
        <xsl:for-each select="mif:attribute[not($associationClassName) or mif:derivedFrom[@staticModelDerivationId='1']/@className=$associationClassName]">
          <xsl:value-of select="concat(if (@extensionOID) then 'canon:' else '', @name)"/>
        </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="remainingClassAttributeNames" as="xs:string*">
        <!-- The set of attributes that will follow the associations -->
        <xsl:for-each select="mif:attribute[$associationClassName and not(mif:derivedFrom[@staticModelDerivationId='1']/@className=$associationClassName)]">
          <xsl:value-of select="concat(if (@extensionOID) then 'canon:' else '', @name)"/>
        </xsl:for-each>
      </xsl:variable>
      <axsl:apply-templates select="{string-join($baseClassAttributeNames, '|')}"/>
      <xsl:variable name="associations" as="element(association)*">
        <xsl:apply-templates mode="associations" select="."/>
      </xsl:variable>
      <xsl:for-each select="$associations">
        <xsl:sort select="@rimSort"/>
        <xsl:copy-of select="xsl:for-each"/>
      </xsl:for-each>
      <xsl:if test="$remainingClassAttributeNames!=''">
        <axsl:apply-templates select="{string-join($remainingClassAttributeNames, '|')}"/>
      </xsl:if>
    </axsl:template>
  </xsl:template>
  <xsl:template mode="simplifyRimAssociations" match="mif:association" as="element(associationTraversal)+">
    <!--
      - Provides a simple list of class association traversals and their sortkeys
      -->
    <xsl:for-each select="mif:traversableConnection">
      <associationTraversal traversalName="{@name}" sortKey="{@sortKey}">
        <xsl:for-each select="preceding-sibling::mif:traversableConnection|following-sibling::mif:traversableConnection">
          <xsl:attribute name="className" select="@participantClassName"/>
        </xsl:for-each>
      </associationTraversal>
    </xsl:for-each>
  </xsl:template>
  <xsl:template mode="associations" match="mif:class" as="element(association)*">
    <!--
      - Provides a simple list of association elements with sort keys containing the for-each declaration needed to process that association
      -->
    <xsl:for-each select="ancestor::mif:serializedStaticModel//mif:class[mif:childClass/mif:specializedClass/*/@name=current()/@name]">
      <xsl:apply-templates mode="associations" select="."/>
    </xsl:for-each>
    <xsl:for-each select="mif:association/mif:targetConnection">
      <xsl:variable name="extensionOID" as="xs:string?" select="@extensionOID"/>
      <xsl:variable name="rimClassName" as="xs:string?" select="mif:derivedFrom[@staticModelDerivationId='1']/@className"/>
      <xsl:variable name="rimAssocName" as="xs:string?" select="mif:derivedFrom[@staticModelDerivationId='1']/@associationEndName"/>
      <xsl:variable name="rimSort" as="xs:string" select="$simpleRimAssociations[@className=$rimClassName and @traversalName=$rimAssocName]/@sortKey"/>
      <association rimSort="{$rimSort}">
        <xsl:for-each select="mif:resolvedClass/descendant-or-self::mif:resolvedClass[not(mif:resolvedClass)]">
          <axsl:for-each select="{if ($extensionOID!='') then 'canon:' else ''}{@traversalName}">
            <axsl:element name="{$rimAssocName}" namespace="{$rimNamespace}">
              <axsl:attribute name="templates" select="concat('cda:', '{@className}')"/>
              <axsl:call-template name="{@className}"/>
            </axsl:element>
          </axsl:for-each>
        </xsl:for-each>
      </association>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
