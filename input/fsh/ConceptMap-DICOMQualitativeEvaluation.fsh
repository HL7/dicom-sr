Instance:       DICOM-Qualitative-Evaluation-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Qualitative Evaluation to FHIR Mapping"
Usage: #definition

* id =  "concept-map-dicom-umls-c0034375"
* name = "ConceptMap - DICOM Qualitative Evaluation to FHIR Mapping"
* description = "Mapping between DICOM Document IE and FHIR Resources"
* url = "http://hl7.org/fhir/uv/dicom-sr/concept-map-dicom-umls-c0034375"
* status = #draft
* experimental = true
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii
* sourceScopeUri = "DICOM-Content-Sequence"
* targetScopeUri = "Observation"

* additionalAttribute[0]
  * code = #DICOMConceptNameCodeSequence
  * description = "DICOM Concept Name Code Sequence (0040,A043)"
  * uri = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.17.3.3.html#table_C.17-5"
  * type = #Coding

* property[0]
  * code = #content-map
  * type = #string

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
