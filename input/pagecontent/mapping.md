This chapter describes the steps required to process a DICOM SR measurement report.

### DICOM SR Measurement Report Instance Mapping
<a name="sr_instance"></a>

The DICOM SR Measurement Report instance contains the following information relevant to creating FHIR resources:
* The Patient IE used to associate created resources with the appropriate Patient
* The Study ID used to associated created resources with the approriate ImagingStudy and ServiceRequest
* The General Equipment IE used to create an a FHIR Device resource
* The Document IE is used to create one or more FHIR Observations
    * The mapped content is from the Imaging Measurements `CONTAINER` node

![DICOM SR Measurement Report Instance Mapping](./dicom_sr_measurement_report_mapping.svg){: width="100%"}

See also the [DICOM SR IOD to FHIR ConceptMap](ConceptMap-dicom-sr-mreasurement-report-to-fhir.html).

### Document IE Mapping
<a name="sr_document"></a>

![DICOM SR Document Mapping](./dicom_sr_document_mapping.svg){: width="100%"}

See also the [DICOM SR Document IE to FHIR ConceptMap](ConceptMap-dicom-sr-document-ie-to-fhir.html).

### Imaging Measurements Container Mapping
<a name="imaging_measurements_container"></a>
![Imaging Measurements Container Mapping](./imaging_measurements_mapping.svg){: width="100%"}

### Imaging Measurement Group Mapping
<a name="imaging_measurement_group"></a>
![Imaging Measurement Group Mapping](./imaging_measurement_group_mapping.svg){: width="100%"}