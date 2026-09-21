Instance: Example-Patient
InstanceOf: Patient
Usage: #example
Description: "An example of a Patient referenced from a measurement report."

* id = "measurement-report-patient"

* identifier
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #MR "Medical record number"
      * display = "Medical Record Number"
  * system = "http://test-hospital.org/mr"
  * assigner
    * display = "Test Hospital"
  * value = "PID-12345"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
  <pre>
{
  \"00100010\": { \"vr\": \"PN\", \"Value\": [ { \"Alphabetic\": \"EXAMPLE^MEASUREMENT^PATIENT}\" } ]},
  \"00100020\": { \"vr\": \"LO\", \"Value\": [ \"PID-11235\" ] },
  \"00100024\": { \"vr\": \"SQ\",  \"Value\": [ {
        \"00400031\": { \"vr\": \"UT\", \"Value\": [ \"Test Hospital\" ] },
        \"00400032\": { \"vr\": \"UT\", \"Value\": [ \"http://test-hospital.org/mr\" ] },
        \"00400033\": { \"vr\": \"CS\", \"Value\": [ \"URI\" ] }
      } ] }
}
  </pre></div>"

Instance: Example-ServiceRequest
InstanceOf: ServiceRequest
Usage: #example
Description: "An example of a ServiceRequest referenced from a measurement report."

* id = "measurement-report-service-request"

* identifier
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #ACSN "Accession ID"
      * display = "Accession ID"
  * system = "http://test-hospital.org/acsn"
  * value = "ACSN-235813"
* subject = Reference(Example-Patient)
* status = #active
* intent = #order
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
  <pre>
{
  \"00080050\": { \"vr\": \"SH\" , \"Value\": \"ACSN-235813\" },
  \"00080051\": { \"vr\": \"SQ\",  \"Value\": [ {
        \"00400031\": { \"vr\": \"UT\", \"Value\": [ \"Test Hospital\" ] },
        \"00400032\": { \"vr\": \"UT\", \"Value\": [ \"http://test-hospital.org/acsn\" ] },
        \"00400033\": { \"vr\": \"CS\", \"Value\": [ \"URI\" ] }
      } ] }
}
  </pre></div>"

Instance: Example-ImagingStudy
InstanceOf: ImagingStudy
Usage: #example
Description: "An example of an ImagingStudy referenced from a measurement report."

* id = "measurement-report-imaging-study"

* identifier
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.2.840.113747.20080222.83311413144566317081790268995"

* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* status = #available
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
  <pre>
{
  \"0020000D\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995\" ] }
}
  </pre></div>"

Instance: Example-CurrentRequestedProcedureEvidenceSequence-ImagingStudy
InstanceOf: ImagingStudy
Usage: #example
Description: "An example of an ImagingStudy referenced from a measurement report as part of the Current Requested Procedure Evidence Sequence."

* id = "measurement-report-evidence-sequence-imaging-study"
* identifier
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.2.840.113747.20080222.83311413144566317081790268995"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* status = #available
* modality = #CT
* numberOfSeries = 2
* numberOfInstances = 2
* series[+]
  * uid = "1.2.840.113747.20080222.83311413144566317081790268995.1"
  * modality = #CT
  * number = 1
  * numberOfInstances = 1
  * instance[+]
    * uid = "1.2.840.113747.20080222.83311413144566317081790268995.1.1"
    * sopClass = #CTImageStorage
    * number = 1
* series[+]
  * uid = "1.2.840.113747.20080222.83311413144566317081790268995.2"
  * modality = #CT
  * number = 2
  * numberOfInstances = 1
  * instance[+]
    * uid = "1.2.840.113747.20080222.83311413144566317081790268995.2.1"
    * sopClass = #CTImageStorage
    * number = 1
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
  <pre>
{
  \"0020000D\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995\" ] },
  \"0040A375\": { \"vr\": \"SQ\", \"Value\": [ {
        \"0020000D\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995\" ] },
        \"00081115\": { \"vr\": \"SQ\", \"Value\": [ {
          \"0020000E\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995.1\" ] },
          \"00081199\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00081150\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.5.1.4.1.1.2\" ] },
            \"00081155\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995.1.1\" ] }
          } ] }
      },
      {
        \"0020000D\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995\" ] },
        \"00081115\": { \"vr\": \"SQ\", \"Value\": [ {
          \"0020000E\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995.2\" ] },
          \"00081199\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00081150\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.5.1.4.1.1.2\" ] },
            \"00081155\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83311413144566317081790268995.2.1\" ] }
      } ]
}
  </pre></div>"