Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ParticipantDevice
Parent:         Device
Id:             dicom-participant-device
Title:          "Device - DICOM Participant Device Mapping"
Description:    "DICOM® Participant to Device Mapping. Used to represent the device that participated in the acquisition or processing of images or other data."

* ^abstract = false
* insert DICOMSRStructureDefinitionContent

* identifier 0..1 MS
* displayName 0..1 MS

Mapping: dicom-sr-for-ParticipantDevice
Id: dicom-sr
Title: "DICOM SR Participant Device"
Source: ParticipantDevice
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.17.2.html"
Description: "The ParticipantDevice can be extracted from the DICOM® Participant Sequence (0040,A07A) attribute."
* -> "DICOM Participant Sequence (0040,A07A)"
* manufacturer -> "tag(0008,0070) [Manufacturer]"
* identifier -> "tag(0018,1002) [Device UID]"
* displayName -> "tag(0008,1090) [Manufacturer's Model Name]"

Instance: Example-Device-Participant
InstanceOf: ParticipantDevice
Usage: #example
Description: "An example of the Device resource corresponding to the DICOM® Participant Sequence (0040,A07A)."

* id = "measurement-report-participant-device"

* identifier
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #UDI
  * system = "urn:dicom:uid"
  * value = "1.2.840.113747.20080222.83311413144566317081790268995.8888"
* manufacturer = "Example Device Manufacturer"
* displayName = "Example Imaging Measurement Device"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
  <pre>
{
  \"00080070\": { \"vr\": \"LO\", \"Value\": [ \"Example Device Manufacturer\" ] },
  \"00081090\": { \"vr\": \"LO\", \"Value\": [ \"Example Imaging Measurement Device\" ] },
  \"00181002\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995.8888\" ] }
}
  </pre></div>"