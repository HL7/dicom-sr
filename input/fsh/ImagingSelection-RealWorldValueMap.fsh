Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionRealWorldValueMapProfile
Parent:         ImagingSelection
Id:             real-world-value-map
Title:          "Imaging Selection - DICOM SR Real World Value Map"
Description:    "DICOM SRReal World Value Map Mapping to ImagingSelection"

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

* derivedFrom contains imagingStudyRef 1..1 MS
* derivedFrom[imagingStudyRef] only Reference(ImagingStudy)
* derivedFrom[imagingStudyRef] ^short = "Related ImagingStudy"
* derivedFrom[imagingStudyRef].identifier.type 1..1
* derivedFrom[imagingStudyRef].identifier.type = DCMIdType#study-instance-uid "Study Instance UID"
* derivedFrom[imagingStudyRef].identifier.system = "urn:dicom:uid"
* derivedFrom[imagingStudyRef].identifier.value 1..1
* derivedFrom[imagingStudyRef].identifier ^short = "Identifier related to Study Instance UID"

* code MS
* code.coding = DCM#126100 "Real World Value Map used for measurement"

* subject only Reference(Patient)
* subject 1..1 MS

* instance ^slicing.discriminator.type = #pattern
* instance ^slicing.discriminator.path = "type"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Selected Image Instance"

* instance contains valueMapInstance 0..*
* instance[valueMapInstance].subset 0..* MS
* instance[valueMapInstance].sopClass = urn:ietf:rfc:3986#urn:oid:1.2.840.10008.5.1.4.1.1.67 "Real World Value Mapping Storage"

Mapping: dicom-tid-1410-for-realWorldValueMapProfile
Id: dicom-tid-1410-real-world-value-map
Title: "DICOM TID 1410 Real World Value Map"
Source: ImagingSelectionRealWorldValueMapProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelectionRealWorldValueMap can be extracted from TID 1410.EV(126100, DCM, Real World Value Map used for measurement)."
* -> "TID1410(RealWorldValueMap)"
* instance[valueMapInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"

Mapping: dicom-tid-1411-for-realWorldValueMapProfile
Id: dicom-tid-1411-real-world-value-map
Title: "DICOM TID 1411 Real World Value Map"
Source: ImagingSelectionRealWorldValueMapProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionRealWorldValueMap can be extracted from TID 1411.EV(126100, DCM, Real World Value Map used for measurement)."
* -> "TID1411(RealWorldValueMap)"
* instance[valueMapInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
