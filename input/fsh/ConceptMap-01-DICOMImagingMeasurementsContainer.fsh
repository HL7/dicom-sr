Instance:       DICOM-Imaging-Measurements-Container-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Imaging Measurements Container to FHIR Mapping"
Usage: #definition

* id = "dicom-imaging-measurements-container-to-fhir"
* name = "DICOMImagingMeasurementsContainerToFHIRMapping"
* description = "Mapping between DICOM® Document IE and FHIR Resources"
* status = #active
* experimental = false
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii
* sourceScopeUri = "DICOM-Imaging-Measurements-Container"
* targetScopeUri = "Bundle"

* group[0].element[0]
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
    * display = "observation.device"

* group[1].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#125007
  * display = "Measurement Group"
  * target
    * relationship = #equivalent
    * code = #ImagingMeasurementGroup
    * display = "ImagingMeasurementGroup"
    * comment = "Each Measurement Group container will be used to create a FHIR ImagingMeasurementGroup Observation."

* group[1].element[1]
  * code = http://dicom.nema.org/resources/ontology/DCM#126001
  * display = "Derived Imaging Measurements"
  * target
    * relationship = #equivalent
    * code = #DerivedImagingMeasurements
    * display = "DerivedImagingMeasurements"
    * comment = "Each child of the the Derived Imaging Measurements container will be used to create a FHIR DerivedImagingMeasurement Observation."

* group[1].element[2]
  * code = http://terminology.hl7.org/CodeSystem/umls#C0034375
  * display = "Qualitative Evaluations"
  * target
    * relationship = #equivalent
    * code = #ImagingQualitativeEvaluation
    * display = "ImagingQualitativeEvaluation"
    * comment = "Select children of the Imaging Qualitative Evaluations container will be used to create a FHIR ImagingQualitativeEvaluation Observation."
