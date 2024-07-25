Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        DICOMSRFindingSiteBodyStructureProfile
Parent:         BodyStructure
Id:             dicom-sr-finding-site
Title:          "Body Structure - DICOM SR Finding Site Mapping"
Description:    "DICOM SR Finding Site Mapping to BodyStructure"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent
* includedStructure.laterality MS

Mapping: dicom-sr-for-findingSiteProfile
Id: dicom-sr
Title: "DICOM SR Finding Site"
Source: DICOMSRFindingSiteBodyStructureProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_300"
Description: "The FindingSiteBodyStructure can be extracted from TID 300 EV(363698007, SCT, Finding Site) and EV (272741003, SCT, Laterality)."
* -> "TID300(FindingSite)"
* includedStructure.structure.coding -> "TID300.EV(363698007, SCT, Finding Site)"
* includedStructure.laterality -> "TID300.EV(272741003, SCT, Laterality)"

Instance: Example-BodyStructure-DICOMSRFindingSiteBodyStructureProfile
InstanceOf: DICOMSRFindingSiteBodyStructureProfile
Usage: #example
Description: "Example of BodySite representing a DICOM SR Finding Site"

* id = "measurement-report-finding-site"

* patient = Reference(MeasurementReportPatient-Example)
* includedStructure
  * structure
    * coding
      * system = "http://snomed.info/sct"
      * code = #363698007 "Structure of left lung"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
  \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
  \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
        \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"G-C0E3\" ] },
        \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
        \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Finding Site\" ] }
      } ] },
  \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
        \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"T-28000\" ] },
        \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
        \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Lung\" ] }
      } ] }
}
  </pre></div>"