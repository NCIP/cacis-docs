It contains following folders and files:
  
- Schematron folder: Customized HITSP C83 Schematron templates to particularly meet NCI Transcend clinical note validation needs.
  - TrimCDAValidation.xsl is the Schematron based XSLT. Developers should use this file to perform CDA document validation check.    

- XSLT/semanticAdapter folder: contains XML, XSLT files necessary to support TRIM to CDA transformation.
  - BaselineNote.xslt: the main XSLT file for TRIM Baseline Evaluation Note to CDA transformation
  - ClinicalStagingNote.xslt: the main XSLT file for TRIM Clinical Staging Note to CDA transformation
  - SurgicalStudyVisitNote.xslt: the main XSLT file for TRIM Surgical Study Visit Note to CDA transformation
  - MedicalStudyVisitNote.xslt: the main XSLT file for TRIM Medical Study Visit Note to CDA transformation
  - BaselineNote_xxx.xslt: the list of modular XSLT files to support TRIM to CDA transformation.
  - shared_xxx.xslt: the list of modular XSLT files commonly used multiple Transcend TRIM clinical notes. 
  - TRIM-codes.xml: TRIM and standard vocabulary mapping XML file.
  - NCIVocabMap.xsd: TRIM and standard vocabulary mapping XSD file.
  - generate-narrative.xslt: apply it to CDA documents to generate new CDA documents with human readable narrative blocks.

- XSLT/semanticAdapter folder: contains the following new XSLT files to support CDA to HTML transformation for human reading.
  - CDA.xsl: the CDA XML to HTML rendering style sheet.
  
- ig folder: contains the following excel based IG for the Canonical Model(CDA).
  - TRIM_CDA.xls file: Excel based Implementation Guide comprising of NCI Transcend TRIM data element and vocabulary mapping.

- ReadMe.txt file: this file   
 