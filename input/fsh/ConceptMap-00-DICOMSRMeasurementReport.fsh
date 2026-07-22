Instance:       DICOM-SR-Measurement-Report-to-FHIR
InstanceOf:     ConceptMap
Usage:          #definition
Title:          "ConceptMap - DICOM SR Measurement Report to FHIR Mapping"


* id =  "dicom-sr-measurement-report-to-fhir"
* name = "DICOMSRMeasurementReportToFHIRMapping"
* description = "Mapping between DICOM® SR Measurement Report and FHIR Resources"
* status = #active
* experimental = false
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii
* sourceScopeUri = "http://dicom.nema.org/resources/ontology/DCM#126000"
* targetScopeUri = "http://hl7.org/fhir/ValueSet/resource-types#Bundle"

* property[+]
  * code = #references
  * type = #string
* property[+]
  * code = #imaging-measurement-group-map
  * type = #string
* property[+]
  * code = #subject
  * type = #string
* property[+]
  * code = #partOf
  * type = #string
* property[+]
  * code = #basedOn
  * type = #string
* property[+]
  * code = #device
  * type = #string
* property[+]
  * code = #identifier
  * type = #string

// Patient IE Mapping
* group[0].target = "http://hl7.org/fhir/resource-types"
* group[0].element[0]
  * code = #DICOM.Patient
  * display = "Patient IE"
  * target
    * relationship = #equivalent
    * code = #Patient
    * display = "Patient"
    * comment = "The DICOM® SR Patient IE is mapped to a FHIR Patient resource"
    * property[0]
      * code = #identifier
      * valueString = "PatientID (0010,0020) and IssuerOfPatientID (0010,0021) are mapped to Patient.identifier[0].value and Patient.identifier[0].assigner respectively"

// Study IE Mapping
* group[1].target = "http://hl7.org/fhir/resource-types"
* group[1].element[0]
  * code = #DICOM.Study
  * display = "Study IE"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingStudy
    * display = "ImagingStudy"
    * comment = "The DICOM® SR Study IE is mapped to a FHIR ImagingStudy resource"
    * property[0]
      * code = #identifier
      * valueString = "StudyInstanceUID (0020,000D) is mapped to ImagingStudy.identifier[0].value"
* group[1].element[1]
  * code = #DICOM.Study
  * display = "Study IE"
  * target
    * relationship = #related-to
    * code = #ServiceRequest
    * display = "ServiceRequest"
    * comment = "The DICOM® SR Study IE is mapped to a FHIR ServiceRequest resource"

// Equipment IE Mapping
* group[2].target = "http://hl7.org/fhir/resource-types"
* group[2].element[0]
  * code = #DICOM.Equipment
  * display = "Equipment IE"
  * target
    * relationship = #equivalent
    * code = #Device
    * display = "Device"
    * comment = "The DICOM® SR Equipment IE may result in the creation of a new Device resource"

// Document IE Mapping
* group[3].target = "http://hl7.org/fhir/resource-types"
* group[3].element[0]
  * code = #DICOM.Document
  * display = "Document IE"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation
    * display = "Observation"
    * comment = "Processing of the Document IE will result in the creation one or more new Observation resources"
    * property[0]
      * code = #imaging-measurement-group-map
      * valueString = "dicom-imaging-measurement-group-to-fhir"
    * property[1]
      * code = #subject
      * valueString = "Observation.subject.reference=Patient[1].id"
    * property[2]
      * code = #partOf
      * valueString = "Observation.partOf.reference=ImagingStudy[1].id"
    * property[3]
      * code = #basedOn
      * valueString = "Observation.basedOn.reference=ServiceRequest[1].id"
    * property[4]
      * code = #device
      * valueString = "Observation.device.reference=Device[1]"
