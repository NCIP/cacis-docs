#Baseline Evaluation
java -jar saxon9he.jar Testing\BaselineEvaluationNote.xml XSLT\BaselineNote.xslt > Testing\CDA_BaselineEvaluationNote.xml
java -jar saxon9he.jar Testing\CDA_BaselineEvaluationNote.xml XSLT\generate-narrative.xslt > Testing\CDA_BaselineEvaluationNote_Narrative.xml
#Clinical Staging
java -jar saxon9he.jar Testing\ClinicalStagingNote.xml XSLT\ClinicalStagingNote.xslt > Testing\CDA_ClinicalStagingNote.xml
java -jar saxon9he.jar Testing\CDA_ClinicalStagingNote.xml XSLT\generate-narrative.xslt > Testing\CDA_ClinicalStagingNote_Narrative.xml
#Surgical Study Visit
java -jar saxon9he.jar Testing\SurgicalStudyVisitNote.xml XSLT\SurgicalStudyVisitNote.xslt > Testing\CDA_SurgicalStudyVisitNote.xml
java -jar saxon9he.jar Testing\CDA_SurgicalStudyVisitNote.xml XSLT\generate-narrative.xslt > Testing\CDA_SurgicalStudyVisitNote_Narrative.xml
#Medical Study Visit
java -jar saxon9he.jar Testing\MedicalStudyVisitNote.xml XSLT\MedicalStudyVisitNote.xslt > Testing\CDA_MedicalStudyVisitNote.xml
java -jar saxon9he.jar Testing\CDA_MedicalStudyVisitNote.xml XSLT\generate-narrative.xslt > Testing\CDA_MedicalStudyVisitNote_Narrative.xml
