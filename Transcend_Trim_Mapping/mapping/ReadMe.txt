The package contains artifacts supporting TRANSCEND Trim clinical noted to CDA transformation.
The transformation covers Baseline Evaluation note, Clinical Staging Note, Surgical Study Visit note, 
Medical Study Visit note, and all other TRIM notes containing data of PCO interest. The Trim notes contains
no PCO data will not be transformed to CDA. 

The package contains following folders and files:
  
- CDA_XSD folder: HL7 CDA R2 XSD files.

- CDASamples folder: CDA sample documents to demonstrate HITSP C83 templates re-usability, and TRIM data representation.

- Schematron folder: Customized HITSP C83 Schematron templates to particularly meet NCI Transcend clinical note validation needs.
  - TrimCDAValidation.xsl is the Schematron based XSLT. Developers should use this file to perform CDA document validation check.    

- Testing folder: contains Transcend provided Trim sample clinical notes, and transformed CDA documents. 
    All CDA documents passed NCI TRIM Schematron validation check. 
  	  
- XSLT folder: contains XML, XSLT files necessary to support TRIM to CDA transformation.
  - BaselineNote.xslt: the main XSLT file for TRIM Baseline Evaluation Note to CDA transformation
  - ClinicalStagingNote.xslt: the main XSLT file for TRIM Clinical Staging Note to CDA transformation
  - SurgicalStudyVisitNote.xslt: the main XSLT file for TRIM Surgical Study Visit Note to CDA transformation
  - MedicalStudyVisitNote.xslt: the main XSLT file for TRIM Medical Study Visit Note to CDA transformation
  - PCO.xslt: the main XSLT file transforming TRIM notes, which contain PCO data, to CDA document. 
  - BalelineNote_xxx.xslt: the list of modular XSLT files to support TRIM to CDA transformation.
  - shared_xxx.xslt: the list of modular XSLT files commonly used multiple Transcend TRIM clinical notes. 
  - TRIM-codes.xml: TRIM and standard vocabulary mapping XML file.
  - NCIVocabMap.xsd: TRIM and standard vocabulary mapping XSD file.
  - generate-narrative.xslt: apply it to CDA documents to generate new CDA documents with human readable narrative blocks.
  - CDA.xsl: the CDA XML to HTML rendering style sheet.
  
- TRIM_CDA.xls file: NCI Transcend TRIM data element and vocabulary mapping spreadsheet.

- ReadMe.txt file: this file   
 