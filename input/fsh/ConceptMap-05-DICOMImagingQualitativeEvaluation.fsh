Instance:       DICOM-Imaging-qualitative-Evaluation-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Imaging Qualitative Evaluation to FHIR Mapping"
Usage: #definition

* id = "dicom-imaging-qualitative-evaluation-to-fhir"
* name = "DICOMImagingQualitativeEvaluationToFHIRMapping"
* description = "Mapping between DICOM Imaging Qualitative Evaluation and FHIR Resources"
* status = #active
* experimental = false
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCoding = #ii
* sourceScopeUri = "DICOM-Imaging-Measurement"
* targetScopeUri = "Observation"

* additionalAttribute[0]
  * code = #IdentifierType
  * description = "DICOM Controlled Terminology"
  * uri = "http://dicom.nema.org/resources/ontology/DCM"
  * type = #Coding

* additionalAttribute[1]
  * code = #ValueType
  * description = "DICOM Value Type"
  * uri = "http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type"
  * type = #Coding

* group[0].element[0]
  * code = #$QualType
  * display = "QualType"
  * target[0]
    * relationship = #equivalent
    * code = #valueCodeableConcept
    * display = "ImagingQualitativeEvaluation.valueCodeableConcept"

* group[1].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#TID4019
  * display = "Algorithm Identification"
  * target[0]
    * relationship = #equivalent
    * code = #AlgrithmIdentification
    * display = "AlgorithmIdentification"
    * comment = "Content from the Algorithm Identification template will be used to create a FHIR AlgorithmIdentification Device."
  * target[0]
    * relationship = #equivalent
    * code = #device
    * display = "ImagingQualitativeEvaluation.device"