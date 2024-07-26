Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        BodyStructureTrackingIdentifiers
Parent:         BodyStructure
Id:             dicom-sr-tracking-identifiers
Title:          "Body Structure - DICOM SR Observation Tracking Identifier Mapping"
Description:    "DICOM SR Observation Tracking Identifier Mapping to BodyStructure"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Tracking Identifiers"

* identifier contains trackingIdentifier 0..1
* identifier[trackingIdentifier].type.coding = DCM#112039 "Tracking Identifier"
* identifier[trackingIdentifier].value 1..1
* identifier[trackingIdentifier] ^short = "Tracking ID"
* identifier[trackingIdentifier] ^definition = "An identifier used for tracking a finding or feature, potentially across multiple reporting objects, over time."

* identifier contains trackingUid 0..1
* identifier[trackingUid].type = http://dicom.nema.org/resources/ontology/DCM#112040 "Tracking Unique Identifier"
* identifier[trackingUid].value 1..1
* identifier[trackingUid] ^short = "Tracking UID"
* identifier[trackingUid].system = "urn:dicom:uid"
* identifier[trackingUid] ^definition = "A unique identifier used for tracking a finding or feature, potentially across multiple reporting objects, over time."

Mapping: dicom-sr-tracking-identifiers-for-measurement-groups
Id: dicom-sr-measurement-group-tracking-identifiers
Title: "DICOM SR Observation Tracking Identifiers for EV(125007, DCM, Measurement Group)"
Source: BodyStructureTrackingIdentifiers
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1500"
* -> "EV(125007, DCM, Measurement Group)"
* identifier[trackingIdentifier] -> "DT (112039, DCM, Tracking Identifier)"
* identifier[trackingUid] -> "EV (112040, DCM, Tracking Unique Identifier)"
* patient -> "tag(0010,0020) [Patient ID]"
* includedStructure.structure.text -> "DT (112039, DCM, Tracking Identifier) > EV (112040, DCM, Tracking Unique Identifier)"

Instance: Example-BodyStructure-TrackingIdentifiers
InstanceOf: BodyStructureTrackingIdentifiers
Usage: #example
Description: "Example of BodySite representing a DICOM SR Tracking Identifier"

* id = "measurement-report-tracking-identifier"

* identifier[trackingIdentifier]
  * type.coding = DCM#112039 "Tracking Identifier"
  * value = "Nodule 1"
* identifier[trackingUid]
  * type.coding = DCM#112040 "Tracking Unique Identifier"
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.2.840.113747.20080222.8331141314456631405221767081790268995.100"

* patient = Reference(Example-Patient)
* includedStructure
  * structure
    * text = "Nodule 1"

* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
  \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
  \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
    \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"112039\" ] },
    \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
    \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Tracking Identifier\" ] }
  } ] },
  \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"Nodule 1\" ] }
},
{
  \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
  \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"UIDREF\" ] },
  \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
    \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"112040\" ] },
    \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
    \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Tracking Unique Identifier\" ] }
  } ] },
  \"0040A124\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.8331141314456631405221767081790268995.100\" ] }
}
  </pre></div>"