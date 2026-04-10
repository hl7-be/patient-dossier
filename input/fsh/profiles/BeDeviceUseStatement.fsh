Profile: BeDeviceUseStatement
Parent: DeviceUseStatement
Id: be-device-use-statement
Title: "BeDeviceUseStatement"
Description: "A record of a device being used by a patient in the context of Belgian healthcare."

* identifier 0..* MS
* basedOn 0..* MS
* status 1..1 MS
* subject 1..1 MS
* subject only Reference(BePatient)
* derivedFrom 0..* MS
* timing[x] 0..1 MS
* recordedOn 1..1 MS
* source 0..1 MS
* source only Reference(BePractitioner or BePractitionerRole or BePatient or RelatedPerson)
* device 1..1 MS
* device only Reference(BeDevice)
* reasonCode 0..* MS
* reasonReference 0..* MS
* reasonReference only Reference(BeProblem or BeProcedure or Observation or DiagnosticReport or DocumentReference or Media)
* bodySite 0..1 MS
* bodySite from BeVSBodySite (required)
* bodySite.extension contains BeExtLaterality named laterality 0..1
* bodySite.extension contains BeExtBodyTopography named topography 0..1
* note 0..* MS
