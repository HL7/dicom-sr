# DICOM SR to FHIR Resource Mapping IG

Provides guidance for the conversion of DICOM Structured Reports (SR) Observations, created in a DICOM based infrastructure to include in a Diagnostic Imaging Report or as a critical alert actionable finding for patient care.

In today's diagnostic imaging environment, Technologists operating Imaging modalities use DICOM SR to capture quantified measurements on images.  Radiologists reviewing images on their workstations capture their measurements using DICOM SR.  To capture these results in a diagnostic report, the Radiologist dictates the results into the report by displaying the DICOM contents.   This method is error prone and could lose content fidelity.  Mapping the DICOM SR observation to FHIR observation enables the seamless inclusion of the DICOM imaging observations into the diagnostic report.  

AI Imaging algorithms are changing patient care in diagnostic imaging.  Pneumothorax is an example of how AI is used in a clinical environment for a potentially life-threatening but readily treated emergency.  A patient presents in an emergency room after a motor vehicle accident and has an x-ray.  The image is obtained from the modality and sent to the PACS and AI algorithm. Before a Radiologist sees the results, an AI algorithm detects and estimates pneumothorax size. The AI algorithm sends the report to the PACS as a DICOM SR with the information, identification, and graphic highlighting the pneumothorax.  Without an automated alert, the technologist would report the results to the ordering physician and radiologist for urgent action.  To improve the workflow efficiencies, an automated alert is required for action by both the appropriate physician and the radiologist.  The AI findings, while captured as DICOM SR for the Radiologist read, the AI Findings need to be encoded as a FHIR observation to interact with systems that are non-imaging.

The HL7 Project Summary is under [this link](https://www.hl7.org/special/Committees/projman/searchableProjectIndex.cfm?action=edit&ProjectNumber=1707).

The pre-analysis of this work is under [this link](https://confluence.hl7.org/display/IMIN/Mapping+of+DICOM+SR+to+FHIR).

The CI build is under [this link](https://build.fhir.org/ig/HL7/dicom-sr/).