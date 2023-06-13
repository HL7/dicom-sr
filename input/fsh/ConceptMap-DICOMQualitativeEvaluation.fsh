Instance:       DICOM-Qualitative-Evaluation-to-FHIR
InstanceOf:     ConceptMap
Usage: #definition

* id =  "ConceptMap-dicom-umls-c0034375"
* description = "Mapping between DICOM Document IE and FHIR Resources"
// * url = http://hl7.org/fhir/uv/dicom-sr/dicom-document-ie-to-fhir
* status = #draft
* sourceScopeUri = "DICOM-Content-Sequence"
* targetScopeUri = "Observation"

* additionalAttribute[0]
  * code = #DICOMConceptNameCodeSequence
  * description = "DICOM Concept Name Code Sequence (0040,A043)"
  * uri = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.17.3.3.html#table_C.17-5"
  * type = #coding

// Document General Module
* group.element[0]
  * code = #DICOM.ContentSequence.QualitativeEvaluations
  * display = "Content Sequence (0040,A730) -- Qualitative Evaluations"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #issued
    * display = "issued"
    * comment = "Each child item of this Content Sequence item will be mapped to its own FHIR Observation"
    * dependsOn[0]
      * attribute = #DICOMConceptNameCodeSequence
      * valueCoding = http://terminology.hl7.org/NamingSystem/umls#C0034375 "Qualitative Evaluations"
    * property[0]
      * code = #content-map
      * valueString = "dicom-qualitative-evaluations"      
