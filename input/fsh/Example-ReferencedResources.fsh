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