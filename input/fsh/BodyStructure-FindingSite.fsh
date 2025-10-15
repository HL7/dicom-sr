Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        BodyStructureFindingSite
Parent:         BodyStructure
Id:             dicom-sr-finding-site
Title:          "Body Structure - DICOM SR Finding Site Mapping"
Description:    "DICOM® SR Finding Site Mapping to BodyStructure"

* ^abstract = false
* insert DICOMSRStructureDefinitionContent
* includedStructure.laterality MS
* includedStructure.qualifier MS

Mapping: dicom-sr-for-TID300FindingSiteProfile
Id: dicom-sr-tid-300-finding-site
Title: "DICOM SR TID 300 Finding Site"
Source: BodyStructureFindingSite
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_300"
Description: "The FindingSiteBodyStructure can be extracted from TID 300 EV(363698007, SCT, Finding Site), EV (272741003, SCT, Laterality) and DT (106233006, SCT, Topographical modifier)."
* -> "TID300(FindingSite)"
* includedStructure.structure.coding -> "TID300.EV(363698007, SCT, Finding Site)"
* includedStructure.laterality -> "TID300.EV(272741003, SCT, Laterality)"
* includedStructure.qualifier -> "TID300.DT(106233006, SCT, Topographical modifier)"

Mapping: dicom-sr-for-TID1419FindingSiteProfile
Id: dicom-sr-tid-1419-finding-site
Title: "DICOM SR TID 1419 Finding Site"
Source: BodyStructureFindingSite
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1419"
Description: "The FindingSiteBodyStructure can be extracted from TID 1419 EV(363698007, SCT, Finding Site), EV (272741003, SCT, Laterality) and DT (106233006, SCT, Topographical modifier)."
* -> "TID1419(FindingSite)"
* includedStructure.structure.coding -> "TID1419.EV(363698007, SCT, Finding Site)"
* includedStructure.laterality -> "TID1419.EV(272741003, SCT, Laterality)"
* includedStructure.qualifier -> "TID1419.DT(106233006, SCT, Topographical modifier)"

Mapping: dicom-sr-for-TID1501FindingSiteProfile
Id: dicom-sr-tid-1501-finding-site
Title: "DICOM SR TID 1501 Finding Site"
Source: BodyStructureFindingSite
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1501"
Description: "The FindingSiteBodyStructure can be extracted from TID 1501 EV(363698007, SCT, Finding Site), EV (272741003, SCT, Laterality) and DT (106233006, SCT, Topographical modifier)."
* -> "TID1501(FindingSite)"
* includedStructure.structure.coding -> "TID1501.EV(363698007, SCT, Finding Site)"
* includedStructure.laterality -> "TID1501.EV(272741003, SCT, Laterality)"
* includedStructure.qualifier -> "TID1501.DT(106233006, SCT, Topographical modifier)"

Instance: Example-BodyStructure-FindingSite
InstanceOf: BodyStructureFindingSite
Usage: #example
Description: "Example of BodySite representing a DICOM SR Finding Site"

* id = "measurement-report-finding-site"

* patient = Reference(Example-Patient)
* includedStructure
  * structure
    * coding
      * system = "http://snomed.info/sct"
      * code = #44029006 "Left lung structure"
      * display = "Left lung structure"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
  \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
  \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
        \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"363698007\" ] },
        \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SCT\" ] },
        \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Finding Site\" ] }
      } ] },
  \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
        \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"39607008\" ] },
        \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SCT\" ] },
        \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Lung\" ] }
      } ] }
}
  </pre></div>"