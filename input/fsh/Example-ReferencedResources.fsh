Instance: MeasurementReportPatient-Example
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

Instance: MeasurementReportServiceRequest-Example
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
* subject = Reference(MeasurementReportPatient-Example)
* status = #active
* intent = #order

Instance: MeasurementReportPatientImagingStudy-Example
InstanceOf: ImagingStudy
Usage: #example
Description: "An example of an ImagingStudy referenced from a measurement report."

* id = "measurement-report-imaging-study"

* identifier
  * system = "urn:dicom:uid"
  * value = "urn:oid:2.16.124.113543.1154777499.30246.19789.350343004"

* subject = Reference(MeasurementReportPatient-Example)
* basedOn = Reference(MeasurementReportServiceRequest-Example)
* status = #available