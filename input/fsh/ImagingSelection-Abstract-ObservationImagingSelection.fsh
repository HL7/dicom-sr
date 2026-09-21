Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ObservationImagingSelection
Parent:         ImagingSelection
Id:             observation-imaging-selection
Title:          "Imaging Selection - DICOM SR Observation Imaging Selection"
Description:    "DICOM® SR base ImagingSelection profile for observation-linked image references. Provides shared study, subject, body site, and source-item constraints for derived imaging selection profiles and is not used directly."

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

// Associated ServiceRequest
* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = "reference"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Description of the related ServiceRequest"

* basedOn contains serviceRequestRef 0..1 MS
* basedOn[serviceRequestRef] only Reference(ServiceRequest)
* basedOn[serviceRequestRef] ^short = "Description of the related ServiceRequest"
* basedOn[serviceRequestRef].identifier.type 1..1
* basedOn[serviceRequestRef].identifier.type = HL7IdType#ACSN "Accession ID"
* basedOn[serviceRequestRef].identifier.value 1..1
* basedOn[serviceRequestRef].identifier ^short = "The accession number related to the performed study"

// Associated Imaging Study
* derivedFrom ^slicing.discriminator.type = #type
* derivedFrom ^slicing.discriminator.path = "reference"
* derivedFrom ^slicing.rules = #open
* derivedFrom ^slicing.description = "Description of the related ImagingStudy" 

* derivedFrom contains imagingStudyRef 0..1 MS
* derivedFrom[imagingStudyRef] only Reference(ImagingStudy)
* derivedFrom[imagingStudyRef] ^short = "Related ImagingStudy"
* derivedFrom[imagingStudyRef].identifier.type 1..1
* derivedFrom[imagingStudyRef].identifier.type = DCM#110180 "Study Instance UID"
* derivedFrom[imagingStudyRef].identifier.system = "urn:dicom:uid"
* derivedFrom[imagingStudyRef].identifier.value 1..1
* derivedFrom[imagingStudyRef].identifier ^short = "Identifier related to Study Instance UID"

* studyUid 1..1 MS

* subject only Reference(Patient)
* subject 1..1 MS

* bodySite MS
* bodySite only CodeableReference(FindingSite)

* focus ^slicing.discriminator.type = #profile
* focus ^slicing.discriminator.path = "resolve()"
* focus ^slicing.rules = #open
* focus ^slicing.ordered = false
* focus ^slicing.description = "Imaging Selection foci"

* focus contains sourceSRContentItem 0..1 MS
* focus[sourceSRContentItem] only Reference(ImagingSelectionSourceSRContentItem)
* focus[sourceSRContentItem] ^short = "Source SR Content Item"

Mapping: dicom-sr-image-reference-source-study
Id: dicom-sr-image-reference-source-study
Title: "DICOM SR Image Reference Source Study"
Source: ObservationImagingSelection
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.7.2.html"
Description: "The ObservationImagingSelection study context can be extracted from the DICOM Study IE."
* -> "Study"
* studyUid -> "tag(0020,000D) [Study Instance UID]"