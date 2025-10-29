Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        GeneralEquipmentDevice
Parent:         Device
Id:             dicom-general-equipment
Title:          "Device - DICOM General Equipment Mapping"
Description:    "DICOM® General Equipment to Device Mapping"

* ^abstract = false
* insert DICOMSRStructureDefinitionContent

* identifier 0..1 MS
* displayName 0..1 MS

Mapping: dicom-sr-for-GeneralEquipmentDevice
Id: dicom-sr
Title: "DICOM SR General Equipment"
Source: GeneralEquipmentDevice
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.7.5.html#sect_C.7.5.1"
Description: "The GeneralEquipmentDevice can be extracted from DICOM® PS 3.3 Sect C.7.5  General Equipment Module."
* -> "DICOM PS 3.3 C.7.5.1 (General Equipment)"
* manufacturer -> "tag(0008,0070) [Manufacturer]"
* identifier -> "tag(0018,1002) [Device UID]"
* displayName -> "tag(0008,1090) [Manufacturer's Model Name]"
* udiCarrier -> "tag(0018,100A) [UDI Sequence]"

Instance: Example-Device-GeneralEquipment
InstanceOf: GeneralEquipmentDevice
Usage: #example
Description: "An example of the Device resource corresponding to the DICOM® General Equipment IE."

* id = "measurement-report-general-equipment"

* identifier
  * type
  * system = "urn:dicom:uid"
  * value = "1.2.840.113747.20080222.83311413144566317081790268995.8888"
* manufacturer = "Example Device Manufacturer"
* displayName = "Example Imaging Measurement Device"
* udiCarrier
  * issuer = "http://hl7.org/fhir/NamingSystem/gs1"
  * carrierHRF = "{01}00844588003288{17}141120{10}7654321D{21}10987654d329"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"00080070\": { \"vr\": \"LO\", \"Value\": [ \"Example Device Manufacturer\" ] },
  \"00081090\": { \"vr\": \"LO\", \"Value\": [ \"Example Imaging Measurement Device\" ] },
  \"00181002\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995.8888\" ] }
  \"0018100A\": { \"vr\": \"SQ\",  \"Value\": [ {
        \"00181009\": { \"vr\": \"UT\", \"Value\": [ \"{01}00844588003288{17}141120{10}7654321D{21}10987654d329\" ] }
     } ]
  }
}
  </pre></div>"