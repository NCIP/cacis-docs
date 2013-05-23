<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:axsl="file://namespace.alias" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mif="urn:hl7-org:v3/mif2" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:v3="urn:hl7-org:v3" exclude-result-prefixes="axsl xs mif">
  <xsl:include href="../../global/transforms/TransformPackageIds.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:namespace-alias stylesheet-prefix="axsl" result-prefix="xsl"/>
  <xsl:variable name="xmlNamespace" select="'http://www.w3.org/XML/1998/namespace#'"/>
  <xsl:variable name="dtURL" select="'urn:hl7-org:v3/owl/DEFN/UV/DT/1.0#'"/>
  <xsl:template match="/">
    <xsl:if test="not(mif:package)">
      <xsl:message terminate="yes" select="'Transform only works on MIF 2.x packages'"/>
    </xsl:if>
    <xsl:if test="not(mif:package/@schemaVersion='2.1.6')">
      <xsl:message select="concat('Transform is designed for use with MIF 2.1.6 and may not work with the current version ', mif:serializedStaticModel/@schemaVersion)"/>
    </xsl:if>
    <xsl:for-each select="mif:package">
      <xsl:variable name="rimNamespace">
        <xsl:for-each select="mif:content/mif:serializedStaticModel[1]/mif:derivedFrom/mif:targetStaticModel[@artifact='RIM'][1]">
          <xsl:value-of select="concat('urn:hl7-org:v3/owl/DEFN/UV/RIM/', @version, '#')"/>
        </xsl:for-each>
      </xsl:variable>
      <axsl:stylesheet version="1.0">
        <xsl:variable name="dataTypeVersion" as="xs:string">
          <xsl:choose>
            <xsl:when test="mif:content/mif:serializedStaticModel[1]/mif:importedDatatypeModelPackage">
              <xsl:value-of select="mif:content/mif:serializedStaticModel[1]/mif:importedDatatypeModelPackage/@version"/>
            </xsl:when>
            <xsl:otherwise>1.0</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <axsl:include href="HL7Datatypes{$dataTypeVersion}ToRDF.xsl"/>
        <axsl:template match="/">
          <rdf:RDF>
            <xsl:for-each select="//mif:serializedStaticModel">
              <xsl:namespace name="M{count(preceding-sibling::mif:serializedStaticModel)}">
                <xsl:apply-templates mode="findURL" select="."/>
              </xsl:namespace>
            </xsl:for-each>
            <xsl:namespace name="XML" select="$xmlNamespace"/>
            <xsl:namespace name="RIM" select="$rimNamespace"/>
            <xsl:namespace name="DT" select="$dtURL"/>
<!--            <axsl:call-template name="datatypeNamespace"/>-->
            <owl:Ontology rdf:about="urn:hl7-org:v3/owl"/>
            <owl:ObjectProperty rdf:about="{concat($xmlNamespace, 'id')}"/>
            <rdfs:Class rdf:about="urn:hl7-org:v3/owl#ANY"/>
            <xsl:for-each select="//mif:serializedStaticModel">
              <xsl:variable name="mtURL" as="xs:string">
                <xsl:apply-templates mode="findURL" select="."/>
              </xsl:variable>
              <xsl:for-each select="descendant::mif:class">
                <rdfs:Class rdf:about="{$mtURL}{@name}">
                  <rdfs:subClassOf rdf:resource="urn:hl7-org:v3/owl#ANY"/>
                </rdfs:Class>
              </xsl:for-each>
            </xsl:for-each>
            <axsl:call-template name="datatypePropertyDefinitions"/>
            <owl:ObjectProperty rdf:about="{concat($rimNamespace, 'InfrastructureRoot.nullFlavor')}">
              <rdfs:domain rdf:resource="urn:hl7-org:v3/owl#ANY"/>
              <rdfs:range rdf:resource="{$dtURL}CS"/>
            </owl:ObjectProperty>
            <owl:ObjectProperty rdf:about="{concat($rimNamespace, 'InfrastructureRoot.typeId')}">
              <rdfs:domain rdf:resource="urn:hl7-org:v3/owl#ANY"/>
              <rdfs:range rdf:resource="{$dtURL}II"/>
            </owl:ObjectProperty>
            <owl:ObjectProperty rdf:about="{concat($rimNamespace, 'InfrastructureRoot.realmCode')}">
              <rdfs:domain rdf:resource="urn:hl7-org:v3/owl#ANY"/>
              <rdfs:range rdf:resource="{$dtURL}CS"/>
            </owl:ObjectProperty>
            <owl:ObjectProperty rdf:about="{concat($rimNamespace, 'InfrastructureRoot.templateId')}">
              <rdfs:domain rdf:resource="urn:hl7-org:v3/owl#ANY"/>
              <rdfs:range rdf:resource="{$dtURL}II"/>
            </owl:ObjectProperty>
            <xsl:apply-templates mode="propertyDefinitions" select="//mif:serializedStaticModel"/>
            <xsl:apply-templates select="mif:content/mif:interaction|mif:content/mif:structuredDocument"/>
          </rdf:RDF>
        </axsl:template>
        <axsl:template name="infrastructureRootStuff">
          <axsl:for-each select="@ID">
            <axsl:element name="XML:id" namespace="{$xmlNamespace}">
              <axsl:value-of select="."/>
            </axsl:element>
          </axsl:for-each>
          <axsl:for-each select="@nullFlavor">
            <axsl:element name="RIM:InfrastructureRoot.nullFlavor" namespace="{$rimNamespace}">
              <axsl:apply-templates mode="CS" select="."/>
            </axsl:element>
          </axsl:for-each>
          <axsl:for-each select="v3:typeId">
            <axsl:element name="RIM:InfrastructureRoot.typeId" namespace="{$rimNamespace}">
              <axsl:apply-templates mode="II" select="."/>
            </axsl:element>
          </axsl:for-each>
          <axsl:if test="v3:realmCode">
            <axsl:element name="RIM:InfrastructureRoot.realmCode" namespace="{$rimNamespace}">
              <rdf:Bag>
                <xsl:for-each select="v3:realmCode">
                  <axsl:apply-templates mode="CS" select="."/>
                </xsl:for-each>
              </rdf:Bag>
            </axsl:element>
          </axsl:if>
          <axsl:if test="v3:templateId">
            <axsl:element name="RIM:InfrastructureRoot.templateId" namespace="{$rimNamespace}">
              <rdf:Bag>
                <axsl:for-each select="v3:templateId">
                  <rdf:li>
                    <axsl:apply-templates mode="II" select="."/>
                  </rdf:li>
                </axsl:for-each>
              </rdf:Bag>
            </axsl:element>
          </axsl:if>
        </axsl:template>
        <xsl:apply-templates select="mif:content/mif:serializedStaticModel"/>
      </axsl:stylesheet>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="mif:interaction">
    <xsl:variable name="id" as="xs:string">
      <xsl:call-template name="mif2PackageOrRefToOldId"/>
    </xsl:variable>
    <axsl:for-each select="v3:{$id}">
      <xsl:for-each select="mif:argumentMessage">
        <xsl:for-each select="//mif:serializedStaticModel/mif:packageLocation[@root=current()/@root and @realmNamespace=current()/@realmNamespace and @domain=current()/@domain and @artifact=current()/@artifact and @id=current()/@id and (not(@version or current()/@version) or @version=current()/@version)]/parent::mif:serializedStaticModel">
          <xsl:variable name="mtId" as="xs:string">
            <xsl:apply-templates mode="findPrefix" select="."/>
          </xsl:variable>
          <axsl:apply-templates mode="{$mtId}_{mif:entryPoint/mif:entryClass/*/@name}" select="."/>
        </xsl:for-each>
      </xsl:for-each>
    </axsl:for-each>
  </xsl:template>
  <xsl:template match="mif:structuredDocument">
    <axsl:for-each select="v3:{@name}">
      <xsl:for-each select="mif:DocumentDefinition">
        <xsl:for-each select="//mif:serializedStaticModel/mif:packageLocation[@root=current()/@root and @realmNamespace=current()/@realmNamespace and @domain=current()/@domain and @artifact=current()/@artifact and @id=current()/@id and (not(@version or current()/@version) or @version=current()/@version)]/parent::mif:serializedStaticModel">
          <xsl:variable name="mtId" as="xs:string">
            <xsl:apply-templates mode="findPrefix" select="."/>
          </xsl:variable>
          <axsl:apply-templates mode="{$mtId}_{mif:entryPoint/mif:entryClass/*/@name}" select="."/>
        </xsl:for-each>
      </xsl:for-each>
    </axsl:for-each>
  </xsl:template>
  <xsl:template mode="findURL" match="mif:serializedStaticModel|mif:resolvedClass" as="xs:string">
    <xsl:for-each select="mif:packageLocation">
      <xsl:value-of select="concat('urn:hl7-org:v3/owl/DEFN/', @realmNamespace, '/', @domain, '/', @artifact, '/', @id, if (@version) then concat('/', @version) else '', '#')"/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template mode="findPrefix" match="mif:resolvedClass" as="xs:string">
    <xsl:for-each select="mif:packageLocation">
      <xsl:apply-templates mode="findPrefix" select="//mif:serializedStaticModel/mif:packageLocation[@root=current()/@root and @realmNamespace=current()/@realmNamespace and @domain=current()/@domain and @artifact=current()/@artifact and @id=current()/@id and (not(@version or current()/@version) or @version=current()/@version)]/parent::mif:serializedStaticModel"/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template mode="findPrefix" match="mif:serializedStaticModel" as="xs:string">
    <xsl:value-of select="concat('M', count(preceding-sibling::mif:serializedStaticModel))"/>
  </xsl:template>
  <xsl:template mode="propertyDefinitions" match="mif:serializedStaticModel" as="element()*">
    <xsl:variable name="mtURL" as="xs:string">
      <xsl:apply-templates mode="findURL" select="."/>
    </xsl:variable>
    <xsl:apply-templates mode="propertyDefinitions" select="mif:entryPoint//mif:class">
      <xsl:with-param name="mtURL" select="$mtURL"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template mode="propertyDefinitions" match="mif:class">
    <xsl:param name="mtURL" as="xs:string" required="yes"/>
    <xsl:variable name="className" select="@name"/>
    <xsl:for-each select="mif:attribute">
      <xsl:variable name="dtName" as="xs:string">
        <xsl:apply-templates mode="dtName" select="mif:type"/>
      </xsl:variable>
      <owl:ObjectProperty rdf:about="{concat($mtURL, $className, '.', @name)}">
        <rdfs:domain rdf:resource="{$mtURL}{$className}"/>
        <rdfs:range rdf:resource="{$dtURL}{$dtName}"/>
      </owl:ObjectProperty>
    </xsl:for-each>
    <xsl:for-each select="mif:association/mif:targetConnection/mif:resolvedClass/descendant-or-self::mif:resolvedClass[not(child::mif:resolvedClass)]">
      <xsl:variable name="targetURL" as="xs:string">
        <xsl:apply-templates mode="findURL" select="."/>
      </xsl:variable>
      <owl:ObjectProperty rdf:about="{concat($mtURL, $className, '.', @traversalName)}">
        <rdfs:domain rdf:resource="{$mtURL}{$className}"/>
        <rdfs:range rdf:resource="{$targetURL}{@className}"/>
      </owl:ObjectProperty>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="mif:serializedStaticModel">
    <xsl:variable name="mtURL" as="xs:string">
      <xsl:apply-templates mode="findURL" select="."/>
    </xsl:variable>
    <xsl:variable name="mtId" as="xs:string">
      <xsl:apply-templates mode="findPrefix" select="."/>
    </xsl:variable>
    <xsl:apply-templates select="mif:entryPoint//mif:class[not(@isAbstract='true')]">
      <xsl:with-param name="mtURL" select="$mtURL"/>
      <xsl:with-param name="mtId" select="$mtId"/>
      <xsl:with-param name="mtPrefix" select="concat('M', count(preceding-sibling::mif:serializedStaticModel))"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template match="mif:class">
    <xsl:param name="mtURL" as="xs:string" required="yes"/>
    <xsl:param name="mtId" as="xs:string" required="yes"/>
    <xsl:param name="mtPrefix" as="xs:string" required="yes"/>
    <axsl:template mode="{$mtId}_{@name}" match="*">
      <xsl:variable name="className" select="concat($mtPrefix, ':', @name)"/>
      <xsl:element name="{$className}" namespace="{$mtURL}">
        <axsl:call-template name="infrastructureRootStuff"/>
        <xsl:apply-templates select="mif:attribute">
          <xsl:with-param name="mtURL" select="$mtURL"/>
          <xsl:with-param name="className" select="$className"/>
        </xsl:apply-templates>
        <xsl:apply-templates mode="doAssociations" select=".">
          <xsl:with-param name="mtURL" select="$mtURL"/>
          <xsl:with-param name="mtId" select="$mtId"/>
          <xsl:with-param name="className" select="$className"/>
        </xsl:apply-templates>
      </xsl:element>
    </axsl:template>
  </xsl:template>
  <xsl:template match="mif:attribute">
    <xsl:param name="mtURL" as="xs:string" required="yes"/>
    <xsl:param name="className" as="xs:string" required="yes"/>
    <xsl:variable name="elementString" select="concat(if (@isImmutable='true') then '@' else 'v3:', @name)"/>
    <xsl:choose>
      <xsl:when test="mif:type[@name='SET' or @name='BAG' or @name='LIST']">
        <axsl:if test="{$elementString}">
          <xsl:element name="{$className}.{@name}" namespace="{$mtURL}">
            <xsl:variable name="collectionType" select="if (mif:type/@name='LIST') then 'Seq' else 'Bag'"/>
            <xsl:element name="rdf:{$collectionType}" namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
              <axsl:for-each select="{$elementString}">
                <rdf:li>
                  <xsl:apply-templates select="mif:type"/>
                </rdf:li>
              </axsl:for-each>
            </xsl:element>
          </xsl:element>
        </axsl:if>
      </xsl:when>
      <xsl:otherwise>
        <axsl:for-each select="{$elementString}">
          <xsl:element name="{$className}.{@name}" namespace="{$mtURL}">
            <xsl:apply-templates select="mif:type"/>
          </xsl:element>
        </axsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="mif:type">
    <xsl:variable name="typeName">
      <xsl:apply-templates mode="typeName" select="."/>
    </xsl:variable>
    <axsl:apply-templates mode="{$typeName}" select="."/>
  </xsl:template>
  <xsl:template mode="typeName" match="mif:type|mif:argumentDatatype">
    <xsl:variable name="typeNameParts" as="xs:string+">
      <xsl:if test="preceding-sibling::mif:argumentDatatype">_</xsl:if>
      <xsl:if test="not(@name='SET' or @name='LIST' or @name='BAG')">
        <xsl:choose>
          <xsl:when test="contains(@name, '.')">
            <xsl:value-of select="substring-before(@name, '.')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@name"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="mif:argumentDatatype">_</xsl:if>
      </xsl:if>
      <xsl:apply-templates mode="typeName" select="mif:argumentDatatype"/>
    </xsl:variable>
    <xsl:value-of select="string-join($typeNameParts, '')"/>
  </xsl:template>
  <xsl:template mode="doAssociations" match="mif:class">
    <xsl:param name="mtURL" as="xs:string" required="yes"/>
    <xsl:param name="mtId" as="xs:string" required="yes"/>
    <xsl:param name="className" as="xs:string" required="yes"/>
    <xsl:apply-templates mode="doAssociations" select="ancestor::mif:serializedStaticModel//mif:class[mif:childClass/mif:specializedClass/mif:class[@name=current()/@name]]">
      <xsl:with-param name="mtURL" select="$mtURL"/>
      <xsl:with-param name="mtId" select="$mtId"/>
      <xsl:with-param name="className" select="$className"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="mif:association/mif:targetConnection">
      <xsl:with-param name="mtURL" select="$mtURL"/>
      <xsl:with-param name="mtId" select="$mtId"/>
      <xsl:with-param name="className" select="$className"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template match="mif:targetConnection">
    <xsl:param name="mtURL" as="xs:string" required="yes"/>
    <xsl:param name="mtId" as="xs:string" required="yes"/>
    <xsl:param name="className" as="xs:string" required="yes"/>
    <xsl:variable name="isRepeating" as="xs:boolean" select="@maximumMultiplicity!='1'"/>
    <xsl:for-each select="mif:resolvedClass/descendant-or-self::mif:resolvedClass[not(child::mif:resolvedClass)]">
      <axsl:if test="v3:{@traversalName}">
        <xsl:element name="{$mtId}:{ancestor::mif:class[1]/@name}.{@traversalName}" namespace="{$mtURL}">
          <xsl:variable name="targetMtId">
            <xsl:apply-templates mode="findPrefix" select="."/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$isRepeating">
              <rdf:Bag>
                <axsl:for-each select="v3:{@traversalName}">
                  <rdf:li>
                    <axsl:apply-templates mode="{$targetMtId}_{@className}" select="."/>
                  </rdf:li>
                </axsl:for-each>
              </rdf:Bag>
            </xsl:when>
            <xsl:otherwise>
              <axsl:for-each select="v3:{@traversalName}">
                <axsl:apply-templates mode="{$targetMtId}_{@className}" select="."/>
              </axsl:for-each>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </axsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template mode="dtName" match="mif:type|mif:argumentDatatype" as="xs:string">
    <xsl:variable name="name" as="xs:string+">
      <xsl:choose>
        <xsl:when test="@name='SET' or @name='DSET' or @name='LIST' or @name='BAG' or @name='COLL'">
          <xsl:apply-templates mode="dtName" select="mif:argumentDatatype"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@name"/>
          <xsl:for-each select="mif:argumentDatatype">
            <xsl:text>_</xsl:text>
            <xsl:apply-templates mode="dtName" select="."/>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="string-join($name, '')"/>
  </xsl:template>
  <!-- Todo: Handle id/idref -->
</xsl:stylesheet>
