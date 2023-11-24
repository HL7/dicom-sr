This chapter describes the mapping between a DICOM SR Measurement Report and FHIR resources.

### DICOM SR Measurement Report Instance Mapping
<a name="sr_instance"></a>

The DICOM SR Measurement Report instance contains the following information relevant to creating FHIR resources:
* The Patient IE used to associate created resources with the appropriate Patient
* The Study ID used to associated created resources with the appropriate ImagingStudy and ServiceRequest
* The General Equipment IE used to create a FHIR Device resource
* The Document IE is used to create one or more FHIR Observations

![DICOM SR Measurement Report Instance Mapping](./dicom_sr_measurement_report_mapping.svg){: width="100%"}

See also the [DICOM SR IOD to FHIR ConceptMap](ConceptMap-dicom-sr-mreasurement-report-to-fhir.html).

### Document IE Mapping
<a name="sr_document"></a>

The DICOM SR Document IE contains:
* The PreliminaryFlag attribute which may indicate whether the contained observations are `preliminary` or `final`
* The ParticipantSequence attribute which may indicate:
    * A person who may be the `performer` of created observations
    * A device that may override the EquipmentDevice as the `device` associated with created observations
* The ContentSequence containing the SR content tree
    * The mapped content is from the Imaging Measurements `CONTAINER` node

![DICOM SR Document Mapping](./dicom_sr_document_ie_mapping.svg){: width="100%"}

See also the [DICOM SR Document IE to FHIR ConceptMap](ConceptMap-dicom-document-ie-to-fhir.html).

### Imaging Measurements Container Mapping
<a name="imaging_measurements_container"></a>

The Imaging Measurements Container contains:
* 0..1 Algorithm Identification content items denoting an algorithm associated with the observations
* 0..n MeasurementGroup Container nodes each of which maps to an ImagingMeasurementGroup Observation
* 0..1 Derived Imaging Measurements Containers
    * Each child node of this container maps to a DerivedImagingMeasurement Observation
* 0..1 Qualitative Evaluations Container
    * Select child nodes of this container maps to a ImagingQualitativeEvaluations Observation
        * Child nodes may include additional Algorithm Identification content items

![Imaging Measurements Container Mapping](./imaging_measurements_mapping.svg){: width="100%"}

See also the [DICOM Imaging Measurements Container ConceptMap](ConceptMap-dicom-imaging-measurements-container-to-fhir.html).

### Imaging Measurement Group Mapping
<a name="imaging_measurement_group"></a>
![Imaging Measurement Group Mapping](./imaging_measurement_group_mapping.svg){: width="100%"}