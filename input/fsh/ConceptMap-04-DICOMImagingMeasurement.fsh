Instance:       DICOM-Imaging-Measurement-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Imaging Measurement to FHIR Mapping"
Usage: #definition

* id = "dicom-imaging-measurement-to-fhir"
* name = "DICOMImagingMeasurementToFHIRMapping"
* description = "Mapping between DICOM® Imaging Measurement and FHIR Resources"
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
  * code = #$Measurement
  * display = "Measurement"
  * target[0]
    * relationship = #equivalent
    * code = #valueQuantity
    * display = "ImagingMeasurement.valueQuantity"
    * dependsOn[0]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#num

* group[1].element[0]
  * code = http://snomed.info/sct#370129005
  * display = "Measurement Method"
  * target
    * relationship = #equivalent
    * code = #method
    * display = "ImagingMeasurement.method"

* group[2].element[0]
  * code = http://snomed.info/sct#363698007
  * display = "Finding Site"
  * target[0]
    * relationship = #equivalent
    * code = #BodyStructureFindingSite
    * display = "BodyStructureFindingSite"
  * target[1]
    * relationship = #equivalent
    * code = #bodyStructure
    * display = "ImagingMeasurement.bodyStructure"

* group[3].element[0]
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
    * display = "ImagingMeasurement.device"