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
  * system = "http://testhospital.org/mr"
  * assigner
    * display = "Test Hospital"
  * value = "PID-12345"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"00100010\": { \"vr\": \"PN\", \"Value\": [ { \"Alphabetic\": \"EXAMPLE^MEASUREMENT^PATIENT}\" } ]},
  \"00100020\": { \"vr\": \"LO\", \"Value\": [ \"PID-11235\" ] },
  \"00100024\": { \"vr\": \"SQ\",  \"Value\": [ {
        \"00400031\": { \"vr\": \"SH\", \"Value\": [ \"Test Hospital\" ] },
        \"00400032\": { \"vr\": \"SH\", \"Value\": [ \"http://testhospital.org/mr\" ] },
        \"00400033\": { \"vr\": \"LO\", \"Value\": [ \"URI\" ] }
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
  * system = "http://testhospital.org/acsn"
  * value = "ACSN-235813"
* subject = Reference(Example-Patient)
* status = #active
* intent = #order
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"00080050\": { \"vr\": \"SH\" , \"Value\": \"ACSN-235813\" },
  \"00080051\": { \"vr\": \"SQ\",  \"Value\": [ {
        \"00400031\": { \"vr\": \"SH\", \"Value\": [ \"Test Hospital\" ] },
        \"00400032\": { \"vr\": \"SH\", \"Value\": [ \"http://testhospital.org/acsn\" ] },
        \"00400033\": { \"vr\": \"LO\", \"Value\": [ \"URI\" ] }
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
  * value = "urn:oid:2.16.124.113543.1154777499.30246.19789.350343004"

* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* status = #available
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"0020000E\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.8331141314456631405221767081790268995\" ] }
}
  </pre></div>"