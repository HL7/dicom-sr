This chapter describes the mapping between a DICOM® SR Measurement Report and FHIR resources.

### DICOM SR Measurement Report Mapping Overview

The mapping between DICOM® SR Measurement Report contents and FHIR Resources is split into several sections as follows:
* [DICOM® SR Measurement Report Instance Mapping](#dicom-sr-measurement-report-instance-mapping)
* [Document IE Mapping](#document-ie-mapping)
* [Imaging Measurements Container Mapping](#imaging-measurements-container-mapping)
* [Imaging Measurement Group Mapping](#imaging-measurement-group-mapping)
* [Imaging Measurement Mapping](#imaging-measurement-mapping)
* [Imaging Qualitative Evaluation Mapping](#imaging-qualitative-evaluation-mapping)
* [Derived Imaging Measurement Mapping](#derived-imaging-measurement-mapping)

<figure>
  {% include dicom_sr_measurement_report_mapping_overview.svg %}
  <figcaption><b>Figure: DICOM® SR Measurement Report Mapping Overview</b></figcaption>
  <p></p>
</figure>

### DICOM SR Measurement Report Instance Mapping

The DICOM® SR Measurement Report instance contains the following information relevant to creating FHIR resources:
* The Patient IE used to associate created resources with the appropriate Patient
* The Study ID used to associated created resources with the appropriate ImagingStudy and ServiceRequest
* The General Equipment IE used to create a FHIR Device resource
* The Document IE is used to create one or more FHIR Observations

*Note:* This implementation guide assumes that Patient, ImagingStudy and ServiceRequest resources already exist in the destination FHIR server. See [Other Resource Relationships](architecture.html#other-resource-relationships).

<figure>
  {% include dicom_sr_measurement_report_mapping.svg %}
  <figcaption><b>Figure: DICOM® SR Measurement Report Instance Mapping Overview</b></figcaption>
  <p></p>
</figure>
See also the [DICOM SR IOD to FHIR ConceptMap](ConceptMap-dicom-sr-measurement-report-to-fhir.html).

### Document IE Mapping


The DICOM SR Document IE contains:
* The PreliminaryFlag attribute which may indicate whether the contained observations are `preliminary` or `final`
* The ParticipantSequence attribute which may indicate:
    * A person who may be the `performer` of created observations
    * A device that may override the EquipmentDevice as the `device` associated with created observations
* The ContentSequence containing the SR content tree
    * The mapped content is from the Imaging Measurements `CONTAINER` node

<figure>
  {% include dicom_sr_document_ie_mapping.svg %}
  <figcaption><b>Figure: DICOM SR Document Mapping Overview</b></figcaption>
  <p></p>
</figure>
See also the [DICOM SR Document IE to FHIR ConceptMap](ConceptMap-dicom-document-ie-to-fhir.html).

### Imaging Measurements Container Mapping


The Imaging Measurements Container contains:
* 0..1 Algorithm Identification content items
* 0..n MeasurementGroup Container nodes each of which maps to an ImagingMeasurementGroup Observation
* 0..1 Derived Imaging Measurements Containers
    * Each child node of this container maps to a DerivedImagingMeasurement Observation
* 0..1 Qualitative Evaluations Container
    * Select child nodes of this container maps to a ImagingQualitativeEvaluations Observation
        * Child nodes may include additional Algorithm Identification content items

<figure>
  {% include imaging_measurements_container_mapping.svg %}
  <figcaption><b>Figure: Imaging Measurements Container Mapping Overview</b></figcaption>
  <p></p>
</figure>
See also the [DICOM Imaging Measurements Container ConceptMap](ConceptMap-dicom-imaging-measurements-container-to-fhir.html).

### Imaging Measurement Group Mapping


The Imaging Measurement Group contains:
* 0..n Numerical Measurement Container nodes each of which maps to an ImagingMeasurement Observation
* 0..1 Algorithm Identification content items
* 0..1 Tracking Identifier content items
* 0..1 Tracking Unique Identifier content items
* 0..1 Finding content items representing the coded value of the imaging measurement group
* 0..1 Finding Category content items
* 0..1 Finding Site content items
   * Maps to a FindingSite BodyStructure
* 0..1 Image Region content items
   * Maps to an ImageRegion ImagingSelection
* 0..1 Measurement Method content items

<figure>
  {% include imaging_measurement_group_mapping.svg %}
  <figcaption><b>Figure: Imaging Measurement Group Mapping Overview</b></figcaption>
  <p></p>
</figure>
See also the [DICOM Imaging Measurement Group ConceptMap](ConceptMap-dicom-imaging-measurement-group-to-fhir.html).

### Imaging Measurement Mapping



<figure>
  {% include imaging_measurement_mapping.svg %}
  <figcaption><b>Figure: Imaging Measurement Mapping Overview</b></figcaption>
  <p></p>
</figure>
See also the [DICOM Imaging Measurement ConceptMap](ConceptMap-dicom-imaging-measurement-to-fhir.html).

### Imaging Qualitative Evaluation Mapping



<figure>
  {% include imaging_qualitative_evaluation_mapping.svg %}
  <figcaption><b>Figure: Imaging Qualitative Evaluation Mapping Overview</b></figcaption>
  <p></p>
</figure>
See also the [DICOM Imaging Qualitative Evaluation ConceptMap](ConceptMap-dicom-imaging-qualitative-evaluation-to-fhir.html).

### Derived Imaging Measurement Mapping



![Derived Imaging Measurement Mapping](./derived_imaging_measurement_mapping.svg){: width="100%"}

See also the [DICOM Derived Imaging Measurement ConceptMap](ConceptMap-dicom-derived-imaging-measurement-to-fhir.html).