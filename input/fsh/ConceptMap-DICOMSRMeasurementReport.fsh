Instance:       DICOM-SR-Measurement-Report-to-FHIR
InstanceOf:     ConceptMap
Usage:          #definition
Title:          "ConceptMap - DICOM SR Measurement Report to FHIR Mapping"


* id =  "dicom-sr-measurement-report-to-fhir"
* name = "ConceptMap - DICOM SR Measurement Report to FHIR Mapping"
* description = "Mapping between DICOM SR Measurement Report and FHIR Resources"
* status = #draft
* experimental = true
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii
* sourceScopeUri = "DICOM-SR-Measurement-Report"
* targetScopeUri = "Bundle"

* property[0]
  * code = #references
  * type = #string
* property[1]
  * code = #imaging-measurement-group-map
  * type = #string

// Patient IE Mapping
* group[0].element[0]
  * code = #DICOM.Patient
  * display = "Patient IE"
  * target
    * relationship = #equivalent
    * code = #Patient[1]
    * display = "Patient[1]"
    * comment = "The DICOM SR Patient IE is mapped to a FHIR Patient resource"

// Study IE Mapping
* group[1].element[0]
  * code = #DICOM.Study
  * display = "Study IE"
  * target
    * relationship = #equivalent
    * code = #ImagingStudy[1]
    * display = "ImagingStudy[1]"
    * comment = "The DICOM SR Study IE is mapped to a FHIR ImagingStudy resource"
* group[1].element[1]
  * code = #DICOM.Study
  * display = "Study IE"
  * target
    * relationship = #related-to
    * code = #ServiceRequest[1]
    * display = "ServiceRequest[1]"
    * comment = "The DICOM SR Study IE is mapped to a FHIR ServiceRequest resource"

// Equipment IE Mapping
* group[2].element[0]
  * code = #DICOM.Equipment
  * display = "Equipment IE"
  * target
    * relationship = #equivalent
    * code = #Device[1]
    * display = "Device[1]"
    * comment = "The DICOM SR Equipment IE may result in the creation of a new Device resource"

// Document IE Mapping
* group[3].element[0]
  * code = #DICOM.Document
  * display = "Document IE"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * comment = "Processing of the Document IE will result in the creation one or more new Observation resources"
    * property[0]
      * code = #imaging-measurement-group-map
      * valueString = "dicom-imaging-measurement-group-to-fhir"
    * property[1]
      * code = #references
      * valueString = "Observation.subject.reference=Patient[1].id"
    * property[2]
      * code = #references
      * valueString = "Observation.partOf.reference=ImagingStudy[1].id"
    * property[3]
      * code = #references
      * valueString = "Observation.basedOn.reference=ServiceRequest[1].id"
    * property[4]
      * code = #references
      * valueString = "Observation.device.reference=Device[1]"
