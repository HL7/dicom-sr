Instance:       DICOM-Derived-Imaging-Measurement-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Derived Imaging Measurement to FHIR Mapping"
Usage: #definition

* id = "dicom-derived-imaging-measurement-to-fhir"
* name = "DICOMDerivedImagingMeasurementToFHIRMapping"
* description = "Mapping between DICOM Derived Imaging Measurement and FHIR Resources"
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
  * code = #CID7465
  * display = "Measurement Derived From Multiple ROI Measurements"
  * target[0]
    * relationship = #equivalent
    * code = #valueQuantity
    * display = "DerivedImagingMeasurement.valueQuantity"
    * dependsOn[0]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#num

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
    * display = "DerivedImagingMeasurement.device"

* group[2].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#125007
  * display = "Measurement Group"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingMeasurementGroup
    * display = "ImagingMeasurementGroup"
    * comment = "Measurement Group children of a derived imaging measurement content item are mapped to new ImagingMeasurementGroup observations."
  * target[1]
    * relationship = #equivalent
    * code = #derivedFrom
    * display = "DerivedImagingMeasurement.derivedFrom"