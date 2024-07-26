Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        AlgorithmIdentificationProfile
Parent:         Device
Id:             algorithm-identification
Title:          "Device - DICOM SR TID 4019 Algorithm Identification Mapping"
Description:    "DICOM SR Algorithm Identification to Device"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* displayName 0..1 MS
* type 0..* MS
* version 0..* MS
* property 0..* MS
* parent 0..1 MS

Mapping: dicom-sr-for-AlgorithmIdentificationProfile
Id: dicom-sr
Title: "DICOM SR TID 4019 Algorithm Identification"
Source: AlgorithmIdentificationProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_4019"
Description: "The TID4019AlgorithmIdentification can be extracted from TID 4019 - Algorithm Identification."
* -> "TID4019(Algorithm Identification)"
* displayName -> "TID4109.EV(111001, DCM, Algorithm Name)"
* version -> "TID4109.EV(111003, DCM, Algorithm Version)"
* property -> "TID4109.EV(111002, DCM, Algorithm Parameters)"
* type -> "TID4109.EV(111000, DCM, Algorithm Family)"

Instance: Example-Device-AlgorithmIdentification
InstanceOf: AlgorithmIdentificationProfile
Usage: #example
Description: "An example of the Device resource corresponding to an Algorithm Identification content item."

* id = "measurement-report-algorithm"

* displayName = "pylidc"
* version
  * value = "0.2.0"
* parent = Reference(Example-Device-GeneralEquipment)
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"0040A730\": { \"vr\": \"SQ\", \"Value\": [ {
  \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
  \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
  \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
    \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"111001\" ] },
    \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
    \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Algorithm Name\" ] }
  } ] },
  \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"pylidc\" ] }
  },
  {
    \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
    \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
    \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"111003\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Algorithm Version\" ] }
    } ] },
    \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"0.2.0\" ] }
  } ] }
}
  </pre></div>"