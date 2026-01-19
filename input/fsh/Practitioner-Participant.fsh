Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ParticipantPractitioner
Parent:         Practitioner
Id:             dicom-participant-person
Title:          "Device - DICOM Participant Practitioner Mapping"
Description:    "DICOM® Participant to Practitioner Mapping"

* ^abstract = false
* insert DICOMSRStructureDefinitionContent

* name 0..1 MS

Mapping: dicom-sr-for-ParticipantPractitioner
Id: dicom-sr
Title: "DICOM SR Participant Practitioner"
Source: ParticipantPractitioner
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.17.2.html"
Description: "The Practitioner can be extracted from the DICOM® Participant Sequence (0040,A07A) attribute."
* -> "DICOM Participant Sequence (0040,A07A)"
* name -> "EV(121008, DCM, Person Observer Name).tag(0040,A123) [Person Name]"

Instance: Example-Practitioner
InstanceOf: Practitioner
Usage: #example
Description: "An example of an Practitioner referenced from a measurement report."

* id = "measurement-report-practitioner"

* name
  * family = "RADIOLOGIST"
  * given = "EXAMPLE"

* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
  <pre>
{
  {
    \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
    \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"PNAME\" ] },
    \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
          \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121008\" ] },
          \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
          \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Person Observer Name\" ] }
        } ] },
    \"0040A123\": { \"vr\": \"PN\", \"Value\": [ { \"Alphabetic\": \"RADIOLOGIST^EXAMPLE\" } ] }
  }
}
  </pre></div>"