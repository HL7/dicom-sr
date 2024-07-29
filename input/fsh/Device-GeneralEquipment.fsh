Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        GeneralEquipmentDevice
Parent:         Device
Id:             dicom-general-equipment
Title:          "Device - DICOM General Equipment"
Description:    "DICOM General Equipment to Device"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* identifier 0..1 MS
* displayName 0..1 MS

Mapping: dicom-sr-for-GeneralEquipmentDevice
Id: dicom-sr
Title: "DICOM SR General Equipment"
Source: GeneralEquipmentDevice
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.7.5.html#sect_C.7.5.1"
Description: "The GeneralEquipmentDevice can be extracted from DICOM PS 3.3 Sect C.7.5  General Equipment Module."
* -> "DICOM PS 3.3 C.7.5.1 (General Equipment)"
* identifier -> "tag(0018,1002) [Device UID]"
* displayName -> "tag(0008,1090) [Manufacturer's Model Name]"

Instance: Example-Device-GeneralEquipment
InstanceOf: GeneralEquipmentDevice
Usage: #example
Description: "An example of the Device resource corresponding to the DICOM General Equipment IE."

* id = "measurement-report-general-equipment"

* identifier
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #UDI
  * system = "urn:dicom:uid"
  * value = "1.2.840.113747.20080222.8331141314456631405221767081790268995.999"
* displayName = "Example Imaging Measurement Device"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"001081090\": { \"vr\": \"LO\", \"Value\": [ \"Example Imaging Measurement Device\" ] },
  \"00181002\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.8331141314456631405221767081790268995.8888\" ] }
}
  </pre></div>"