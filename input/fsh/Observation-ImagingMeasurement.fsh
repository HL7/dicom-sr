Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingMeasurement
Parent:         ImagingObservationProfile
Id:             imaging-measurement
Title:          "Observation - DICOM® SR Imaging Measurement Mapping to Observation"
Description:    "DICOM® SR Imaging Measurement Mapping to Observation"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* category 1..* MS
* category = DCM#125007 "Measurement Group"

* referenceRange MS

* bodyStructure MS
* bodyStructure only Reference(BodyStructureFindingSite)

* valueQuantity 1..1 MS

Mapping: dicom-sr-for-TID300MeasurementProfile
Id: dicom-sr-tid-300
Title: "DICOM® SR TID 300 Measurement"
Source: ImagingMeasurement
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_300"
Description: "The TID300Measurement can be extracted from TID 300 - Measurement."
* -> "TID300(Measurement)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID300.$Measurement.tag(0040,A043) [Concept Name Code Sequence]"
* issued -> "tag(0040,A032) [Observation DateTime]"
* method -> "TID1501.EV(370129005, SCT, Measurement Method)"
* device -> "TID1501.EV(121071, DCM, Finding)"
* valueQuantity -> "TID300.$Measurement.tag(0040,A300) [Measured Value Sequence]"

Mapping: dicom-sr-for-TID1419MeasurementProfile
Id: dicom-sr-tid-1419
Title: "DICOM® SR TID 1419 Measurement"
Source: ImagingMeasurement
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1419"
Description: "The TID1419Measurement can be extracted from TID 1419 - ROI Measurements."
* -> "TID1419(ROIMeasurement)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID1419.$Measurement.tag(0040,A043) [Concept Name Code Sequence]"
* issued -> "tag(0040,A032) [Observation DateTime]"
* method -> "TID1501.EV(370129005, SCT, Measurement Method)"
* device -> "TID1501.EV(121071, DCM, Finding)"
* valueQuantity -> "TID1419.$Measurement.tag(0040,A300) [Measured Value Sequence]"

Instance: Example-Observation-ImagingMeasurement-001
InstanceOf: ImagingMeasurement
Usage: #example
Description: "Example of Observation representing a DICOM® SR Imaging Measurement."

* id = "imaging-measurement-001"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* effectiveDateTime = "2024-07-24T08:23:42+00:00"
* status = #final
* performer = Reference(Example-Practitioner)
* code
  * coding
    * system = "http://snomed.info/sct"
    * code = #118565006 "Volume"
    * display = "Volume"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-AlgorithmIdentification)
* valueQuantity
  * value = 6705.54990898997
  * unit = "cubic millimeter"
  * system = "http://unitsofmeasure.org"
  * code = #mm3

Instance: Example-Observation-ImagingMeasurement-002
InstanceOf: ImagingMeasurement
Usage: #example
Description: "Example of Observation representing a DICOM® SR Imaging Measurement."

* id = "imaging-measurement-002"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* effectiveDateTime = "2024-07-24T08:23:42+00:00"
* status = #final
* performer = Reference(Example-Practitioner)
* code
  * coding
    * system = "http://snomed.info/sct"
    * code = #81827009 "Diameter"
    * display = "Diameter"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-AlgorithmIdentification)
* valueQuantity
  * value = 6705.54990898997
  * unit = "millimeter"
  * system = "http://unitsofmeasure.org"
  * code = #mm

Instance: Example-Observation-ImagingMeasurement-003
InstanceOf: ImagingMeasurement
Usage: #example
Description: "Example of Observation representing a DICOM® SR Imaging Measurement."

* id = "imaging-measurement-003"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* effectiveDateTime = "2024-07-24T08:23:42+00:00"
* status = #final
* performer = Reference(Example-Practitioner)
* code
  * coding
    * system = "http://snomed.info/sct"
    * code = #301898006 "Body surface area"
    * display = "Body surface area"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-GeneralEquipment)
* valueQuantity
  * value = 9.026567E+03
  * unit = "square millimeter"
  * system = "http://unitsofmeasure.org"
  * code = #mm2
