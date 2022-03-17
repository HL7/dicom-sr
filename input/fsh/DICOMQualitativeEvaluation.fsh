Instance:       DICOM-Qualitative-Evaluation-to-FHIR
InstanceOf:     ConceptMap
Usage: #definition

* id =  "dicom-umls-c0034375"
* description = "Mapping between DICOM Document IE and FHIR Resources"
// * url = http://hl7.org/fhir/uv/dicom-sr/dicom-document-ie-to-fhir
* status = #draft
* sourceUri = "DICOM-Content-Sequence"
* targetUri = "Observation"

// Document General Module
* group.element[0]
  * code = #DICOM.ContentSequence.C0034375
  * display = "Content Sequence (0040,A730) -- Qualitative Evaluations"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #issued
    * display = "issued"
    * comment = "Each child item of this Content Sequence item will be mapped to its own FHIR Observation"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "UMLS"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "C0034375"
    * dependsOn[2]
      * property = "content-map"
      * value = "umls-c0034375"

// DTID 4019 “Algorithm Identification”
* group.element[1]
  * code = #DICOM.ContentSequence.TID4109
  * display = "Content Sequence (0040,A730) -- Algorithm Identification"
  * target
    * relationship = #equivalent
    * comment = "TO BE DETERMINED."
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 4019"

// Qualitative Evaluation Code
* group.element[2]
  * code = #DICOM.ContentSequence.QualitativeEvaluation.Code
  * display = "Content Sequence (0040,A730) -- Algorithm Identification"
  * target
    * relationship = #equivalent
    * code = #valueCodeableConcept.coding
    * display = "valueCodeableConcept.coding"
    * comment = "Each child item of this Content Sequence item will be mapped to its own FHIR Observation"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 4019"

// Qualitative Evaluation Code
* group.element[3]
  * code = #DICOM.ContentSequence.QualitativeEvaluation.Code
  * display = "Content Sequence (0040,A730) -- Algorithm Identification"
  * target
    * relationship = #equivalent
    * code = #valueCodeableConcept.coding
    * display = "valueCodeableConcept.coding"
    * comment = "Each child item of this Content Sequence item will be mapped to its own FHIR Observation"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 4019"

// Qualitative Evaluation Text
* group.element[4]
  * code = #DICOM.ContentSequence.QualitativeEvaluation.Text
  * display = "Content Sequence (0040,A730) -- Algorithm Identification"
  * target
    * relationship = #equivalent
    * code = #valueCodeableConcept.text
    * display = "valueCodeableConcept.text"
    * comment = "Each child item of this Content Sequence item will be mapped to its own FHIR Observation"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 4019"
