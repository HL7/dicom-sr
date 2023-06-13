Instance:       DICOM-SR-IOD-to-FHIR
InstanceOf:     ConceptMap
Usage: #definition
Title:          "ConceptMap - DICOM SR IOD to FHIR Mapping"


* id =  "ConceptMap-dicom-sr-iod-to-fhir"
* description = "Mapping between DICOM SR IOD and FHIR Resources"
// * url = http://hl7.org/fhir/uv/dicom-sr/dicom-sr-iod-to-fhir
* status = #draft
* sourceScopeUri = "DICOM-SR-IOD"
* targetScopeUri = "Bundle"

// Patient IE Mapping
* group.element[0]
  * code = #DICOM.Patient
  * display = "Patient IE"
  * target
    * relationship = #equivalent
    * code = #Patient[1]
    * display = "Patient[1]"
    * comment = "The DICOM SR Patient IE is mapped to a FHIR Patient resource"

// Study IE Mapping
* group.element[1]
  * code = #DICOM.Study
  * display = "Study IE"
  * target
    * relationship = #equivalent
    * code = #ImagingStudy[1]
    * display = "ImagingStudy[1]"
    * comment = "The DICOM SR Study IE is mapped to a FHIR ImagingStudy resource"

// Series IE Mapping
* group.element[2]
  * code = #DICOM.Series
  * display = "Series IE"
  * target
    * relationship = #not-related-to
    * comment = "The DICOM SR Series IE is not mapped"

// Frame of Reference IE Mapping
* group.element[3]
  * code = #DICOM.FrameOfReference
  * display = "Frame of Reference IE"
  * target
    * relationship = #not-related-to
    * comment = "The DICOM SR Frame of Reference IE is not mapped"

// Equipment IE Mapping
* group.element[4]
  * code = #DICOM.Equipment
  * display = "Equipment IE"
  * target
    * relationship = #equivalent
    * code = #Device[1]
    * display = "Device[1]"
    * comment = "The DICOM SR Equipment IE may result in the creation of a new Device resource"

// Document IE Mapping
* group.element[5]
  * code = #DICOM.Document
  * display = "Document IE"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * comment = "Processing of the Document IE will result in the creation one or more new Observation resources"
    * property[0]
      * code = #ie-map
      * valueString = "dicom-document-ie-to-fhir"
    * property[1]
      * code = #references
      * valueString = "Observation.subject.reference=Patient[1].id"
    * property[2]
      * code = #references
      * valueString = "Observation.partOf.reference=ImagingStudy[1].id"
    * property[3]
      * code = #references
      * valueString = "Observation.device.reference=Device[1]"
