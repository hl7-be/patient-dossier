Logical: BeModelDeviceUseStatement
Parent: Base
Title: "DeviceUseStatement Logical Model"
Description: "Logical model for recording the use of a medical device by a patient"

* identifier 0..* Identifier "Identifier" "Unique ID of this device use registration, assigned by the system that creates the DeviceUseStatement"
* basedOn 0..* Reference "Based On" "Reference to a request or plan on which this use is based, e.g. a ServiceRequest or prescription"
* status 1..1 code "Status" "Status of the registration (active, completed, entered-in-error, intended, stopped, on-hold)"
* status from http://hl7.org/fhir/ValueSet/device-statement-status
* patient 1..1 Reference(Patient) "Patient" "The patient who uses the medical device"
* derivedFrom 0..* Reference "Derived From" "Extra information on which this registration is based, e.g. a prior Procedure or Observation"
* timing 0..1 dateTime or Period or Timing "Timing" "Description of how often or when the device is used, e.g. every night between 22:00 and 07:00"
* recordedDate 1..1 dateTime "Recorded Date" "Date and time when the registration was entered"
* source 0..1 Reference(Practitioner or PractitionerRole or Patient or RelatedPerson) "Source" "Who created the registration, e.g. a nurse recording the use"
* device 1..1 Reference "Device" "The device being used, e.g. reference to Device 'Insulin pump SN12345'"
* reasonCode 0..* CodeableConcept "Reason Code" "Reason why the device is used - can be a condition (problem), procedure or observation code"
* reasonReference 0..* Reference "Reason Reference" "Reference to a clinical source for the reason, e.g. a diagnosis in a problem resource"
* bodySite 0..1 BackboneElement "Body Site" "The anatomical location where the device is used or implanted"
  * localisation 1..1 CodeableConcept "Body Localisation" "Specific location on the body, e.g. left hip"
  * localisation from https://www.ehealth.fgov.be/standards/fhir/core-clinical/ValueSet/be-vs-bodysite
  * laterality 0..1 CodeableConcept "Body Laterality" "Laterality of the body site where the device is used/implanted (right, left, both)"
  * laterality from https://www.ehealth.fgov.be/standards/fhir/core-clinical/ValueSet/be-vs-laterality
  * topography 0..1 CodeableConcept "Body Topography" "Relative position of the device on the body (e.g., upper/lower, medial/lateral, internal/external)"
  * topography from https://www.ehealth.fgov.be/standards/fhir/core-clinical/ValueSet/be-vs-topography
* note 0..* Annotation "Note" "Remarks or additional instructions, e.g. 'Patient reports irritation around the sensor'"


