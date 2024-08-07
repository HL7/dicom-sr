Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionRealWorldValueMap
Parent:         ImagingSelectionObservationImagingSelection
Id:             real-world-value-map
Title:          "Imaging Selection - DICOM SR Real World Value Map"
Description:    "DICOM SR Real World Value Map Mapping to ImagingSelection"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* code MS
* code.coding = DCM#126100 "Real World Value Map used for measurement"

* instance ^slicing.discriminator.type = #value
* instance ^slicing.discriminator.path = "sopClass"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Selected Real World Value Map"

* instance contains valueMapInstance 1..*
* instance[valueMapInstance].sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.67 "Real World Value Mapping Storage"

Mapping: dicom-tid-1410-for-realWorldValueMapProfile
Id: dicom-tid-1410-real-world-value-map
Title: "DICOM TID 1410 Real World Value Map"
Source: ImagingSelectionRealWorldValueMap
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelectionRealWorldValueMap can be extracted from TID 1410.EV(126100, DCM, Real World Value Map used for measurement)."
* -> "TID1410(RealWorldValueMap)"
* instance[valueMapInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"

Mapping: dicom-tid-1411-for-realWorldValueMapProfile
Id: dicom-tid-1411-real-world-value-map
Title: "DICOM TID 1411 Real World Value Map"
Source: ImagingSelectionRealWorldValueMap
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionRealWorldValueMap can be extracted from TID 1411.EV(126100, DCM, Real World Value Map used for measurement)."
* -> "TID1411(RealWorldValueMap)"
* instance[valueMapInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"

Instance: Example-ImagingSelection-RealWorldValueMap
InstanceOf: ImagingSelectionRealWorldValueMap
Usage: #example
Description: "An example of an Real World Value Map SOP Instance referenced from a measurement report."

* id = "measurement-report-referenced-real-world-value-map"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #126100 "Real World Value Map used for measurement"
    * display = "Real World Value Map used for measurement"
* seriesUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.8"
* instance[valueMapInstance]
  * uid = "1.2.840.113747.20080222.83341314456631405221767081790268995.8.1"
  * sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.67 "Real World Value Mapping Storage"